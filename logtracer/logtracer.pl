#! /usr/bin/perl -w
use strict;

use lib './lib';

use LogItem;
use DateTime;

if(@ARGV != 2){
	print "usage: ./logtracer.pl openid keyword\n";
	exit;
}
my ($openid, $keyword) = @ARGV;

my %thread_log_map = ();
my @user_log_list = ();
my @target_log_list =();

my $TARGET_LOG_PREFIX = "***";

while(<STDIN>){
  if(/(^\d{4})-(\d{2})-(\d{2})\s(\d{2}):(\d{2}):(\d{2}),(\d{3})\s-\s.+\s\[.+-(.{13}).+\$(\d+)\]\s([INFO|ERROR|FATAL|DEBUG|WARN]+)\s(.+)/){
	my $dt1 = DateTime->new(
   	     year => $1,
   	     month => $2,
   	     day => $3,
   	     hour => $4,
   	     minute => $5,
   	     second => $6,
   	     nanosecond => $7
	  );
         my $log_time_str = "$1-$2-$3 $4:$5:$6,$7";
         my $host_ip = $8;
         my $thread_id = $9;
         my $log_level = $10;
         my $log_detail = $_;
         my $log_item = LogItem->new ({
            log_time => $dt1,
            log_time_str => $log_time_str,
            host_ip => $host_ip,
            thread_id => $thread_id,
 	    log_level => $log_level,
            log_detail => $log_detail
         });
        if($log_detail =~ $openid){
           if($log_detail =~ $keyword){
                $log_item->{log_detail} = $TARGET_LOG_PREFIX.$log_item->{log_detail};
                push @target_log_list, $log_item;
	        next;
           }
        }
        #user log map create
        if($log_detail =~ $openid){
            push(@user_log_list,$log_item);
            next;
        }
        #end user log map create
        #thread log map create
        my $thread_log = $thread_log_map{$host_ip."_".$thread_id};
        if(defined($thread_log)){
	   push(@{$thread_log},$log_item);	
	}else{
	   $thread_log=[$log_item];
	   $thread_log_map{$host_ip."_".$thread_id} = $thread_log;
	}
        #end thread log map create

  }else{
	print "in else: $_ ";
  }
}

if(@target_log_list == 0){
  print "no item found\n";
  exit;
}

my @all_log = ();

push @all_log, @target_log_list;

my $end_time=$target_log_list[0]->{log_time};
my @unique_thread=();

foreach(@target_log_list){
  #print "***".$_->{log_detail}."\n";
  my $target_host_ip = $_->{host_ip};
  my $target_thread_id = $_->{thread_id};
  my $cur_time = $_->{log_time};
  if(DateTime->compare($end_time, $cur_time)==-1){
     $end_time = $cur_time;
  }
  my $exist_thread = 0;
  foreach(@unique_thread){
    if($_ eq $target_host_ip."_".$target_thread_id){
       $exist_thread = 1;
    }
  }
  
  if($exist_thread == 0){
        #print "push thread log ".$target_host_ip."_".$target_thread_id."\n";
  	push @unique_thread, $target_host_ip."_".$target_thread_id;
        my @thread_log = @{$thread_log_map{$target_host_ip."_".$target_thread_id}};
        push @all_log, @thread_log;
        #foreach(@thread_log){
        #   print "TTT".$_->{log_detail}."\n";
        #}
  }else{
        #print "skip thread log ".$target_host_ip."_".$target_thread_id."\n";
  }
}

push @all_log, @user_log_list;
#foreach(@user_log_list){
#   print "UUU".$_->{log_detail}."\n";
#}

#print "END_TIME: $end_time\n";
#print "===================\n";
foreach(sort {$a->{log_time_str} cmp $b->{log_time_str}} @all_log){
     if(DateTime->compare($end_time, $_->{log_time})==-1){
          #print "skip: $_->{log_detail}\n";
          next;
     }
     print $_->{log_detail}."\n";
}

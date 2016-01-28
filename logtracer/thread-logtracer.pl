#! /usr/bin/perl -w
use strict;

use lib './lib';

use LogItem;

if(@ARGV < 5){
    print "usage: ./logtracer.pl hostip thread openid keyword max_hitcount\n";
    exit;
}
my ($target_hostip, $target_thread, $openid, $keyword, $max_hitcount) = @ARGV;
my $hitcount = 0;

while(<STDIN>){
  if(/(^\d{4})-(\d{2})-(\d{2})\s(\d{2}):(\d{2}):(\d{2}),(\d{3})\s-\s.+\s\[.+-(.{13}).+\$(\d+)\]\s([INFO|ERROR|FATAL|DEBUG|WARN]+)\s(.+)/){
         my $log_time = "$1-$2-$3 $4:$5:$6,$7";
         my $host_ip = $8;
         my $thread_id = $9;
         my $log_level = $10;
         my $log_detail = $_;
         my $log_item = LogItem->new ({
            log_time => $log_time,
            host_ip => $host_ip,
            thread_id => $thread_id,
            log_level => $log_level,
            log_detail => $log_detail
         });
        if($target_hostip eq $host_ip && $target_thread eq $thread_id){
            if($log_detail =~ $openid && $log_detail =~ $keyword){
                  $hitcount++;
                  if($hitcount > $max_hitcount){
                       last;
                  }
            }
	    print $log_detail."\n";
	}

  }else{
    #print "in else: $_ ";
  }
}

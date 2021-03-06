#! /usr/bin/perl -w
use strict;

use lib './lib';

use LogItem;

if(@ARGV < 1){
    print "usage: ./logtracer.pl openid\n";
    exit;
}
my ($openid) = @ARGV;

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
         if($log_detail =~ $openid){
	    print $log_detail."\n";
	}
  }else{
    #print "in else: $_ ";
  }
}


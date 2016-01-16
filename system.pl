#! /usr/bin/perl
use strict;
use warnings;

print "usage: $0 ".join($", @ARGV)."\n";

#my @args = ("command", "arg1", "arg2");
#system(@args) == 0 or die "system @args failed: $?"

while (<STDIN>) { 
	chomp;
	system($_);
        if($? == 0){
		print "success: $_\n";
	}else{
		print "fail: $_ $? === $!\n";
	}
}

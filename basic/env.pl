#! /usr/bin/perl
use strict;
use warnings;

print "usage: $0 ".join($", @ARGV)."\n";

foreach(keys %ENV){
	print "$_ = $ENV{$_}\n";
}

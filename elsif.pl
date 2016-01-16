#! /usr/bin/perl
use strict;
use warnings;

print "usage: $0 ".join($", @ARGV)."\n";

if(@ARGV == 0){
	print "in if\n";
}elsif(@ARGV == 1){
	print "in elsif\n";
}else{
	print "in else\n";
}

#! /usr/bin/perl
use strict;
use warnings;

print "usage: $0 ".join($", @ARGV)."\n";

open(my $in,  "<",  "input.txt")  or die "Can't open input.txt: $!";
open(my $out, ">",  "output.txt") or die "Can't open output.txt: $!";

while (<$in>) { 
     my $line = $_;
     if(/1/){
	chomp;
	print $_, ",";
     }
     if($_ =~ /(line).*(2)/){
	print "$1$2\n";
     }
     $line =~ s/3/4/g;
     print $out $line;
}

close $in or die "$in: $!";
close $out or die "$out: $!";

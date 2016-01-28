#! /usr/bin/perl
use strict;
use warnings;

print "usage: $0 ".join($", @ARGV)."\n";

my @a = qw(hello world);
my $aref = \@a;
print $aref,"\n";
print $#a."\n";
print @a."\n";

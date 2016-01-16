#! /usr/bin/perl
use strict;
use warnings;

print "usage: $0 ".join($", @ARGV)."\n";


sub logger {
    my $priority = shift;
    my $logmessage = shift;
    open my $logfile, ">>", "my.log" or die "Could not open my.log: $!";
    print $logfile "[$priority]$logmessage";
}

open(my $in,  "<",  "input.txt")  or die "Can't open input.txt: $!";
open(my $out, ">",  "output.txt") or die "Can't open output.txt: $!";

while (<$in>) { 
     logger("INFO", "Just read in this line: $_");
     print $out $_;
}

print STDERR "This is your final warning.\n";

close $in or die "$in: $!";
close $out or die "$out: $!";

#! /usr/bin/perl
use strict;
use warnings;

print "usage: $0 ".join($", @ARGV)."\n";

#    $array[7][12]                       # array of arrays
#    $array[7]{string}                   # array of hashes
#    $hash{string}[7]                    # hash of arrays
#    $hash{string}{'another string'}     # hash of hashes

my %HoA = (
        flintstones        => [ "fred", "barney" ],
        jetsons            => [ "george", "jane", "elroy" ],
        simpsons           => [ "homer", "marge", "bart" ],
      );

 # print the whole thing
 foreach my $family ( keys %HoA ) {
     print "$family: @{ $HoA{$family} }\n"
 }
print "=============\n";
 # print the whole thing with indices
 foreach my $family ( keys %HoA ) {
     print "family: ";
     foreach my $i ( 0 .. $#{ $HoA{$family} } ) {
         #print " $HoA{$family}";
	 #the arrow is optional between two subscripts
         print " $i = $HoA{$family}[$i]";
     }
     print "\n";
 }
print "=============\n";

 # append new members to an existing family
 push @{ $HoA{"flintstones"} }, "wilma", "betty";
 # one element
 $HoA{flintstones}[0] = "Fred";
 # another element
 $HoA{simpsons}[1] =~ s/(\w)/\u$1/;

 # print the whole thing
 foreach my $family ( keys %HoA ) {
     print "$family: @{ $HoA{$family} }\n"
 }
print "=============\n";

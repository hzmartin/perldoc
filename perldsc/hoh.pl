#! /usr/bin/perl
use strict;
use warnings;

print "usage: $0 ".join($", @ARGV)."\n";

#    $array[7][12]                       # array of arrays
#    $array[7]{string}                   # array of hashes
#    $hash{string}[7]                    # hash of arrays
#    $hash{string}{'another string'}     # hash of hashes

my %HoH = (
        flintstones => {
                lead      => "fred",
                pal       => "barney",
        },
        jetsons     => {
                lead      => "george",
                wife      => "jane",
                "his boy" => "elroy",
        },
        simpsons    => {
                lead      => "homer",
                wife      => "marge",
                kid       => "bart",
        },
 );


# one element
 $HoH{flintstones}{wife} = "wilma";
 # another element
 $HoH{simpsons}{lead} =~ s/(\w)/\u$1/;
 # print the whole thing
 foreach my $family ( keys %HoH ) {
     print "$family: { ";
     for my $role ( keys %{ $HoH{$family} } ) {
         print "$role=$HoH{$family}{$role} ";
     }
     print "}\n";
 }
 # print the whole thing  somewhat sorted
 foreach my $family ( sort keys %HoH ) {
     print "$family: { ";
     for my $role ( sort keys %{ $HoH{$family} } ) {
         print "$role=$HoH{$family}{$role} ";
     }
     print "}\n";
 }

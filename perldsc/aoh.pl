#! /usr/bin/perl
use strict;
use warnings;

print "usage: $0 ".join($", @ARGV)."\n";

#    $array[7][12]                       # array of arrays
#    $array[7]{string}                   # array of hashes
#    $hash{string}[7]                    # hash of arrays
#    $hash{string}{'another string'}     # hash of hashes

my @AoH = (
        {
            Lead     => "fred",
            Friend   => "barney",
        },
        {
            Lead     => "george",
            Wife     => "jane",
            Son      => "elroy",
        },
        {
            Lead     => "homer",
            Wife     => "marge",
            Son      => "bart",
        }
  );

 # one element
 $AoH[0]{Lead} = "Fred";
 # another element
 $AoH[1]{Lead} =~ s/(\w)/\u$1/;
 # print the whole thing with refs
 for my $href ( @AoH ) {
     print "{ ";
     for my $role ( keys %$href ) {
         print "$role=$href->{$role} ";
     }
     print "}\n";
 }
 # print the whole thing with indices
 for my $i ( 0 .. $#AoH ) {
     print "$i is { ";
     for my $role ( keys %{ $AoH[$i] } ) {
         print "$role=$AoH[$i]{$role} ";
     }
     print "}\n";
 }
 # print the whole thing one at a time
 for my $i ( 0 .. $#AoH ) {
     for my $role ( keys %{ $AoH[$i] } ) {
         print "elt $i $role is $AoH[$i]{$role}\n";
     }
 }

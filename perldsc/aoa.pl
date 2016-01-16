#! /usr/bin/perl
use strict;
use warnings;

print "usage: $0 ".join($", @ARGV)."\n";

#    $array[7][12]                       # array of arrays
#    $array[7]{string}                   # array of hashes
#    $hash{string}[7]                    # hash of arrays
#    $hash{string}{'another string'}     # hash of hashes

my $aref = [
        [ "fred", "barney", "pebbles", "bambam", "dino", ],
        [ "homer", "bart", "marge", "maggie", ],
        [ "george", "jane", "elroy", "judy", ],
    ];
print $aref->[2][2]."\n";

my @AoA = (
        [ "fred", "barney" ],
        [ "george", "jane", "elroy" ],
        [ "homer", "marge", "bart" ],
      );
print $AoA[2][2]."\n";


# print the whole thing with refs
for $aref ( @AoA ) {
    print "\t [ @$aref ],\n";
}
print "================\n";
# print the whole thing with indices
for my $i ( 0 .. $#AoA ) {
    print "\t [ @{$AoA[$i]} ],\n";
}
print "================\n";
# print the whole thing one at a time
for my $i ( 0 .. $#AoA ) {
    for my $j ( 0 .. $#{ $AoA[$i] } ) {
        print "elt $i $j is $AoA[$i][$j]\n";
    }
}
print "================\n";

push @{ $AoA[0] }, "wilma", "betty";
# one element
$AoA[0][0] = "Fred";
# another element
$AoA[1][1] =~ s/(\w)/\u$1/;
# print the whole thing with refs
for $aref ( @AoA ) {
    print "\t [ @$aref ],\n";
}

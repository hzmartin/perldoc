#! /usr/bin/perl
use strict;
use warnings;

print "usage: $0 ".join($", @ARGV)."\n";

my @all_animals = ("camel", "monkey", "dog", "rat", "llama", "owl");

my @animals = @all_animals[1..$#all_animals];

my @sorted = sort @animals;
print "sorted animal:\n";
for(my $i = 0; $i <= $#sorted; $i++) {
	print $animals[$i];
	print ' , ' unless $i == $#sorted;
	print "\n" if $i == $#sorted;
}
	
print "reverse animal:\n";
my @backwards = reverse @animals;
print $backwards[$_]." " foreach 0..$#backwards;
print "\n";


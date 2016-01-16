#! /usr/bin/perl
use strict;
use warnings;

# array = {$aref}
# hash = {$href}

print "usage: $0 ".join($", @ARGV)."\n";

my @animals = ("camel", "monkey", "dog", "rat", "llama", "owl");

my $animalsref=\@animals;

print $animals[3], "\n";
print $animalsref->[3], "\n";

my $aref = [ 1, "foo", undef, 13 ];
# $aref now holds a reference to an array
my $href = { APR => 4, AUG => 8 };
# $href now holds a reference to a hash

print $aref,',',$aref->[3],',',${$aref}[3], "\n";
print $href,',',$href->{APR},',',${$href}{AUG},"\n";

#	@a		@{$aref}		An array
#	reverse @a	reverse @{$aref}	Reverse the array
#	$a[3]		${$aref}[3]		An element of the array
#	$a[3] = 17;	${$aref}[3] = 17	Assigning an element

#	%h		%{$href}	      A hash
#	keys %h		keys %{$href}	      Get the keys from the hash
#	$h{'red'}	${$href}{'red'}	      An element of the hash
#	$h{'red'} = 17	${$href}{'red'} = 17  Assigning an element


my @two_dimension = ( [1, 2, 3],
       [4, 5, 6],
       [7, 8, 9]
      );
print $two_dimension[1]->[2],"\n";
#In between two subscripts, the arrow is optional.
print $two_dimension[1][2],"\n";

#! /usr/bin/perl
use strict;
use warnings;

print "usage: $0 ".join($", @ARGV)."\n";

#my %fruit_color = ("apple", "red", "banana", "yellow");

my %fruit_colors = (
     "apple"  => "red",
     "banana" => "yellow",
);

my @fruits = keys(%fruit_colors);
my @colors = values(%fruit_colors);
print "keys: ".join($", @fruits)."\n";
print "values: ".join($", @colors)."\n";

my $variables = {
    scalar  =>  {
                 description => "single item",
                 sigil => '$',
                },
    array   =>  {
                 description => "ordered list of items",
                 sigil => '@',
                },
    hash    =>  {
                 description => "key/value pairs",
                 sigil => '%',
                },
};
print "Scalars begin with a $variables->{'scalar'}->{'sigil'}\n";

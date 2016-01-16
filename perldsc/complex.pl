#! /usr/bin/perl
use strict;
use warnings;

print "usage: $0 ".join($", @ARGV)."\n";

#    $array[7][12]                       # array of arrays
#    $array[7]{string}                   # array of hashes
#    $hash{string}[7]                    # hash of arrays
#    $hash{string}{'another string'}     # hash of hashes

#     $rec = {
#         TEXT      => $string,
#         SEQUENCE  => [ @old_values ],
#         LOOKUP    => { %some_table },
#         THATCODE  => \&some_function,
#         THISCODE  => sub { $_[0] ** $_[1] },
#         HANDLE    => \*STDOUT,
#     };

my %TV = (
        flintstones => {
            series   => "flintstones",
            nights   => [ qw(monday thursday friday) ],
            members  => [
                { name => "fred",    role => "lead", age  => 36, },
                { name => "wilma",   role => "wife", age  => 31, },
                { name => "pebbles", role => "kid",  age  =>  4, },
            ],
        },
        jetsons     => {
            series   => "jetsons",
            nights   => [ qw(wednesday saturday) ],
            members  => [
                { name => "george",  role => "lead", age  => 41, },
                { name => "jane",    role => "wife", age  => 39, },
                { name => "elroy",   role => "kid",  age  =>  9, },
            ],
         },
        simpsons    => {
            series   => "simpsons",
            nights   => [ qw(monday) ],
            members  => [
                { name => "homer", role => "lead", age  => 34, },
                { name => "marge", role => "wife", age => 37, },
                { name => "bart",  role => "kid",  age  =>  11, },
            ],
         },
      );

# then this would also change in
print $TV{simpsons}{members}[2]{age}."\n";

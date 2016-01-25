#! /usr/bin/perl -w
use strict;

#export PERL5LIB in shell env

#BEGIN{
# push(@INC, './lib');
#}

use lib './lib';

use MyFile;

my $file = MyFile->new("hello");
print $file->{path} , "\n";

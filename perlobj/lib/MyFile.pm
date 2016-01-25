package MyFile;

sub new{
 my $class = shift;
 return bless {path=>shift},$class;
}

#my $file = MyFile->new('test');
#print $file->{path};

1;

package MyFile;

sub new{
 my $class = shift;
 my $path = shift;
 return bless {path=>$path},$class;
}

my $file = MyFile->new('test');
print $file->{path},"\n";

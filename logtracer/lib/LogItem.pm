package LogItem;

sub new{
 my $class = shift;
 my $map = shift;
 return bless $map,$class;
}

1;

package WebService::Lucy::Schema::Candy;
use parent 'DBIx::Class::Candy';
sub base { $_[1] || 'WebService::Lucy::Schema::Result' }
sub autotable { 1 }

1;

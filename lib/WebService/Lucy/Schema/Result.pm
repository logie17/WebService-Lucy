package WebService::Lucy::Schema::Result;
use parent 'DBIx::Class::Core';

__PACKAGE__->load_components(qw/
  TimeStamp
  InflateColumn::DateTime
/);

1;

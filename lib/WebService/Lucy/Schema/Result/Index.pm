package WebService::Lucy::Schema::Result::Index;
use WebService::Lucy::Schema::Candy;

primary column index_id => {
  data_type => 'int',
  is_auto_increment => 1,
};

column name => {
  data_type = 'varchar',
  size => 25,
};

column 'created' => {
  data_type => 'datetime',
  set_on_create => 1,
  set_on_update => 1
};

unique_constraint ['name'];

1;

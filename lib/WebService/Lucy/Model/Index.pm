package WebService::Lucy::Model::Index;

use Moose;
use Lucy::Plan::Schema;
use Lucy::Plan::FullTextType;
use Lucy::Analysis::PolyAnalyzer;
use Lucy::Index::Indexer;
use File::ShareDir::ProjectDistDir;
use File::Spec;

sub create {
  my ( $self, $index_name, $fields, $language) = @_;

  my $index_dir = dist_dir('indexes');

  my $schema = Lucy::Plan::Schema->new;
  my $polyanalyser = Lucy::Analysis::PolyAnalyzer->new(language => 'en');
  my $type = Lucy::Plan::FullTextType->new( analyzer => $polyanalyser );

  $schema->spec_field ( name => $_->{name}, type => $type ) for @$fields;

  #$schema->resultset('Index')->find_or_create( { name => $index_name } );

  Lucy::Index::Indexer->new(
    index    => File::Spec->catfile($index_dir, $index_name ),
    schema   => $schema,
    create   => 1,
  );
}
__PACKAGE__->meta->make_immutable;

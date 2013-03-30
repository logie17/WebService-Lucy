package WebService::Lucy;
use Moose;
use WebService::Lucy::Service;

#ABSTRACT: Search for stuff

has index_path => ( is => 'rw', isa => 'Str', required => 1);
has port => ( is => 'rw', isa => 'Int', required => 1);

sub start {
  my $self = shift;
  return WebService::Lucy::Service->new;
}

__PACKAGE__->meta->make_immutable;



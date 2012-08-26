package WebService::Lucy;
use Moose;
use WebService::Lucy::Service;

with 'MooseX::Getopt';

has port       => ( is => 'rw', isa => 'Int', required => 1, default => 3000 );
has index_path => ( is => 'rw', isa => 'Str', required => 1, default => './index');

sub start {
  my $self = shift;
  return WebService::Lucy::Service->new;
}

__PACKAGE__->meta->make_immutable;

package WebService::Lucy::Service::Response;
use Moose;

has content => ( is => 'rw', isa => 'Str', default => 'foo' );
has content_type => ( is => 'rw', isa => 'Str', default => 'text/html', required => 1 );
has response_code => ( is => 'rw', isa => 'Int', default => 200, required => 1);

sub generate_response {
  my $self = shift;
  [ $self->response_code, [ 'Content-type', $self->content_type ], [ $self->content ] ]
}

__PACKAGE__->meta->make_immutable;

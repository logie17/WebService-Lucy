package WebService::Lucy::Service;
use WebService::Lucy::Model::Index;
use WebService::Lucy::Service::Response;
use Plack::Request;
use Web::Simple;
use Data::Dumper;

has response => ( 
  is => 'rw', 
  lazy => 1,
  builder => '_build_response' );

has index => (
  is => 'ro',
  lazy => 1,
  builder => '_build_index' );

sub dispatch_request {
  my $self = shift;
  sub (POST + /index/* + %*)  {
    my $env = $_[PSGI_ENV];
    my $req = Plack::Request->new($env);
    my $index_name = $_[1];
    my $body = $_[2];
    if ( my $body = $_[0] ) {
      my $fields   = $body->{fields} || [];
      my $language = $body->{language} || 'en';
      my $indexer = $_[0]->index->create($index_name, $fields, $language);
      [ 201, [ 'Content-type', 'text/html' ], [ Dumper($body) ] ]
    }
  },
  sub (GET) {
    [ $self->response->response_code, [ 'Content-type', $self->response->content_type ], [ $self->response->content ] ]
  },
  sub () {
    [ 405, [ 'Content-type', 'text/plain' ], [ 'Method not allowed' ] ]
  }
}

sub _build_index {
  return WebService::Lucy::Model::Index->new;
}

sub _build_response {
  return WebService::Lucy::Service::Response->new( content => '' );
}

1;

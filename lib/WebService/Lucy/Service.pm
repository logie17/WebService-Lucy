package WebService::Lucy::Service;
use Web::Simple;

sub dispatch_request {
  sub (GET) {
    [ 200, [ 'Content-type', 'text/plain' ], [ 'Hellow lucy' ] ]
  },
  sub () {
    [ 405, [ 'Content-type', 'text/plain' ], [ 'Method not allowed' ] ]
  }
}

1;

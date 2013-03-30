package WebService::Lucy::Config;

use Moose;
use Config::JFDI;

has filename => (
    is      => 'ro',
    isa     => 'Str',
    default => sub { "default" },
);

has config => (
  is => 'ro',
  isa => 'Config::JFDI',
  lazy => 1,
  default => sub {
    my $self = shift;
    return Config::JFDI->new(
      name => $self->filename,
      path => 'share/config/'
    );
  },
);

sub get {
  my ($self, $key) = @_;
  return $self->config->config->{$key};
}

sub as_hash {
  my ($self) = @_;
  return $self->config->config;
}

__PACKAGE__->meta->make_immutable;

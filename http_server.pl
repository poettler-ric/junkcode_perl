#!/usr/bin/perl

# simple implementation of a non-forking http server

use common::sense;

use HTTP::Daemon;
use HTTP::Status qw(:constants);

my $daemon = HTTP::Daemon->new(LocalPort => 8080)
    or die "couldn't create daemon";
say "listening at: ", $daemon->url;

while (my $connection = $daemon->accept) {
    my $request = $connection->get_request;
    say sprintf("%15s requested: %s",
	inet_ntoa($connection->peeraddr),
	$request->uri);
    my $response = HTTP::Response->new(HTTP_OK, undef, undef, "hello world");
    $connection->send_response($response);
    $connection->close;
    undef($connection);
}

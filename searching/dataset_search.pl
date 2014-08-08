#!/usr/bin/perl -w -I/opt/eprints3/perl_lib

use strict;
use EPrints;

# Search example

use EPrints;
use Getopt::Long;

GetOptions(
) or die "Usage: $0 repo_id";

my( $repoid ) = @ARGV;

my $repo = EPrints->new->repository( $repoid )
        or die "Invalid repository $repoid";


my $repoid = shift @ARGV or die( 'Missing param repoid' );

# simple search -retrieves/processes all objects in dataset
$repo->dataset( 'eprint' )->search()->map( 

		my( undef, undef, $eprint ) = @_;

		# do something eg.
		# $eprint->remove();

);

# with filters - this selects eprint's belonging to user '123'
$repo->dataset( 'eprint' )->search(
	filters => [
		{ meta_fields => [ 'userid' ], value => '123' }
	] )->map(

		my( undef, undef, $eprint ) = @_;

		# do something eg.
		# $eprint->remove();

);

exit;

#!/usr/bin/perl -w -I/opt/eprints3/perl_lib

use strict;

# two params: the repo ID and the path to the CSV file
#
# note: requires Text::CSV_XS (which uses the relevant core C library)

use EPrints;
use Getopt::Long;
use Text::CSV_XS;

GetOptions(
) or die "Usage: $0 repo_id csv_file";

my( $repoid, $csv_file ) = @ARGV;

my $repo = EPrints->new->repository( $repoid )
        or die "Invalid repository $repoid";

die "Invalid CSV file '$csv_file'" unless( defined $csv_file && -e $csv_file );

my $csv = Text::CSV_XS->new( {binary=>1} ) or die "Problem with Text::CSV_XS";

open my $fh, "<:encoding(utf8)", "$csv_file" or die "$csv_file: $!";

my @rows;
my $c=0;

while (my $row = $csv->getline ($fh)) {

	# comment-out to skip the first line (usually has the CSV headers):
	# next if( $c++ == 0 );

	# adapt to your fiels/columns:
	my( $field1, $field2, $field3 ) = @$row;

	# your own code here
}

$csv->eof or $csv->error_diag ();

close $fh;

exit;


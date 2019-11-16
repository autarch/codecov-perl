use strict;
use warnings FATAL => 'all';
use utf8;

use lib '.';
use t::Util;
use Devel::Cover::Report::Codecov::Service::Azure;

sub azure { 'Devel::Cover::Report::Codecov::Service::Azure' }

subtest 'if azure' => sub {
    local $ENV{AGENT_ID} = 1;
    local $ENV{BUILD_BUILDID} = 1;
    ok( azure->detect );
};

subtest 'if not azure' => sub {
    delete $ENV{AGENT_ID};
    delete $ENV{BUILD_BUILDID};
    ok( not azure->detect );
};

done_testing;

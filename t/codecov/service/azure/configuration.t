use strict;
use warnings FATAL => 'all';
use utf8;

use lib '.';
use t::Util;
use Devel::Cover::Report::Codecov::Service::Azure;

subtest basic => sub {
    local $ENV{AGENT_ID}               = 'agent_id';
    local $ENV{BUILD_BUILDID}          = 'build_id';
    local $ENV{BUILD_SOURCEVERSION}    = 'commit';
    local $ENV{AGENT_JOBID}            = 'job_id';
    local $ENV{BUILD_SOURCEBRANCHNAME} = 'some_branch';
    local $ENV{BUILD_REPOSITORY_NAME}  = 'org/repo';
    local $ENV{SYSTEM_TEAMFOUNDATIONSERVERURI}
        = 'https://dev.azure.com/foo123/';
    local $ENV{SYSTEM_PULLREQUEST_PULLREQUESTNUMBER} = '42';

    my $configuration
        = Devel::Cover::Report::Codecov::Service::Azure->configuration;
    cmp_deeply $configuration,
        {
        service      => 'azure',
        commit       => 'commit',
        build        => 'build_id',
        branch       => 'some_branch',
        job          => 'job_id',
        slug         => 'org/repo',
        build_url    => 'https://dev.azure.com/foo123/',
        pr           => '42',
        };
};

done_testing;

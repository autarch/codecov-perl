package Devel::Cover::Report::Codecov::Service::Azure;
use strict;
use warnings;
use utf8;

sub detect {
    # Azure sets a ton of variables but none of them have "AZURE" in the name.
    return $ENV{AGENT_ID} && $ENV{BUILD_BUILDID};
}

sub configuration {
    return {
        service   => 'azure',
        commit    => $ENV{BUILD_SOURCEVERSION},
        build     => $ENV{BUILD_BUILDID},
        job       => $ENV{AGENT_JOBID},
        branch    => $ENV{BUILD_SOURCEBRANCHNAME},
        slug      => $ENV{BUILD_REPOSITORY_NAME},
        build_url => $ENV{SYSTEM_TEAMFOUNDATIONSERVERURI},
        (
            $ENV{SYSTEM_PULLREQUEST_PULLREQUESTNUMBER}
            ? ( pr => $ENV{SYSTEM_PULLREQUEST_PULLREQUESTNUMBER} )
            : ()
        ),
    };
}

1;
__END__

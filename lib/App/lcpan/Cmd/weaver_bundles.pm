package App::lcpan::Cmd::weaver_bundles;

# DATE
# VERSION

use 5.010;
use strict;
use warnings;

require App::lcpan;

our %SPEC;

$SPEC{handle_cmd} = {
    v => 1.1,
    summary => 'List Pod::Weaver bundles available on CPAN',
    args => {
        %App::lcpan::common_args,
        %App::lcpan::query_multi_args,
        %App::lcpan::fauthor_args,
        %App::lcpan::fdist_args,
        %App::lcpan::flatest_args,
        %App::lcpan::sort_modules_args,
    },
};
sub handle_cmd {
    my %args = @_;

    my $res = App::lcpan::modules(%args, namespaces=>['Pod::Weaver::PluginBundle']);

    for (@{$res->[2]}) {
        if ($args{detail}) {
            $_->{name} =~ s/^Pod::Weaver::PluginBundle:://;
        } else {
            s/^Pod::Weaver::PluginBundle:://;
        }
    }

    $res;
}

1;
# ABSTRACT:

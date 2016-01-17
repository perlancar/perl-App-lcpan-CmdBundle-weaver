package App::lcpan::Cmd::weaver_sections;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

require App::lcpan;

our %SPEC;

$SPEC{handle_cmd} = {
    v => 1.1,
    summary => 'List Pod::Weaver sections available on CPAN',
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

    my $res = App::lcpan::modules(%args, namespaces=>['Pod::Weaver::Section']);

    for (@{$res->[2]}) {
        if ($args{detail}) {
            $_->{name} =~ s/^Pod::Weaver::Section:://;
        } else {
            s/^Pod::Weaver::Section:://;
        }
    }

    $res;
}

1;
# ABSTRACT:

package App::lcpan::Cmd::weaver_plugin;

# DATE
# DIST
# VERSION

use 5.010;
use strict;
use warnings;

use Hash::Subset 'hash_subset_without';
require App::lcpan;

our %SPEC;

our %weaver_plugin_args = (
    weaver_plugin => {
        schema => 'perl::modname*',
        req => 1,
        pos => 0,
        completion => sub {
            my %args = @_;

            my $word = $args{word} // '';
            my $res = App::lcpan::_complete_mod(
                %args,
                word => "Pod::Weaver::Plugin::$word",
            );
            for (@$res) { s!^Pod(::|/)Weaver(::|/)Plugin(::|/)!! }
            $res;
        },
    },
);

$SPEC{handle_cmd} = {
    v => 1.1,
    summary => 'Show a single Pod::Weaver plugin',
    args => {
        %App::lcpan::common_args,
        %weaver_plugin_args,
    },
};
sub handle_cmd {
    my %args = @_;

    my $res = App::lcpan::modules(
        hash_subset_without(\%args, ['weaver_plugin']),
        query => ["Pod::Weaver::Plugin::$args{weaver_plugin}"],
        query_type => 'exact-name',
        detail => 1,
    );
    return $res unless $res->[0] == 200;
    for my $entry (@{ $res->[2] }) {
        $entry->{name} = $entry->{module};
        $entry->{name} =~ s/^Pod::Weaver::Plugin:://;
    }
    unshift @{ $res->[3]{'table.fields'} }, 'name';
    $res;
}

1;
# ABSTRACT:

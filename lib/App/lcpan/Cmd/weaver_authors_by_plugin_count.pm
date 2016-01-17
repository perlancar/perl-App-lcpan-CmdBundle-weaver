package App::lcpan::Cmd::weaver_authors_by_plugin_count;

# DATE
# VERSION

use 5.010;
use strict;
use warnings;

require App::lcpan;

our %SPEC;

$SPEC{'handle_cmd'} = {
    v => 1.1,
    summary => 'List authors ranked by number of Pod::Weaver plugins',
    args => {
        %App::lcpan::common_args,
    },
};
sub handle_cmd {
    my %args = @_;

    App::lcpan::_set_args_default(\%args);
    my $cpan = $args{cpan};
    my $index_name = $args{index_name};

    my $dbh = App::lcpan::_connect_db('ro', $cpan, $index_name);

    my $sql = "SELECT
  cpanid author,
  COUNT(*) AS mod_count
FROM module m
WHERE m.name LIKE 'Pod::Weaver::Plugin::%'
GROUP BY cpanid
ORDER BY mod_count DESC
";

    my @res;
    my $sth = $dbh->prepare($sql);
    $sth->execute();
    while (my $row = $sth->fetchrow_hashref) {
        push @res, $row;
    }
    my $resmeta = {};
    $resmeta->{'table.field'} = [qw/author mod_count/];
    [200, "OK", \@res, $resmeta];
}

1;
# ABSTRACT:

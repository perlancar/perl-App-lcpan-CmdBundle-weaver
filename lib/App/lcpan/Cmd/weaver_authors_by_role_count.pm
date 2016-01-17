package App::lcpan::Cmd::weaver_authors_by_role_count;

# DATE
# VERSION

use 5.010;
use strict;
use warnings;

require App::lcpan;

our %SPEC;

$SPEC{'handle_cmd'} = {
    v => 1.1,
    summary => 'List authors ranked by number of Pod::Weaver roles',
    args => {
        %App::lcpan::common_args,
    },
};
sub handle_cmd {
    my %args = @_;

    my $state = App::lcpan::_init(\%args, 'ro');
    my $dbh = $state->{dbh};

    my $sql = "SELECT
  cpanid author,
  COUNT(*) AS mod_count
FROM module m
WHERE m.name LIKE 'Pod::Weaver::Role::%'
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

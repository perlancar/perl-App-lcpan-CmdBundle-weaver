package App::lcpan::CmdBundle::weaver;

# DATE
# VERSION

1;
# ABSTRACT: lcpan subcommands related to Pod::Weaver

=head1 SYNOPSIS

Install this distribution, then the lcpan subcommands below will be available:

 # List sections available on CPAN
 % lcpan weaver-sections

 # List plugins available on CPAN
 % lcpan weaver-plugins

 # List bundles available on CPAN
 % lcpan weaver-bundles

 # List roles available on CPAN
 % lcpan weaver-roles


 # Find plugins most depended by other CPAN distributions
 % lcpan weaver-sections-by-rdep-count

 # Find plugins most depended by other CPAN distributions
 % lcpan weaver-plugins-by-rdep-count

 # Find bundles most depended by other CPAN distributions
 % lcpan weaver-bundles-by-rdep-count

 # Find roles most depended by other CPAN distributions
 % lcpan weaver-roles-by-rdep-count


 # Who release the largest number of sections
 % lcpan weaver-authors-by-section-count

 # Who release the largest number of plugins
 % lcpan weaver-authors-by-plugin-count

 # Who release the largest number of bundles
 % lcpan weaver-authors-by-bundle-count

 # Who release the largest number of roles
 % lcpan weaver-authors-by-role-count


=head1 DESCRIPTION

This distribution packages several lcpan subcommands related to L<Pod::Weaver>.


=head1 SEE ALSO

L<lcpan>

L<Pod::Weaver>

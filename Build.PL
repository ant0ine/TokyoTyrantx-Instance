use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'TokyoTyrantx::Instance',
    license             => 'perl',
    dist_author         => 'Antoine Imbert <antoine.imbert@gmail.com>',
    dist_version_from   => 'lib/TokyoTyrantx/Instance.pm',
    build_requires => {
        'Test::More' => 0,
        TokyoTyrant  => 0,
        'IO::File'   => 0,
        Cwd          => 0,
    },
    add_to_cleanup      => [ 'TokyoTyrantx-Instance-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();

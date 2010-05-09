#!perl -w
use strict;
use warnings;

use Test::More tests => 1 * 13;

use TokyoTyrantx::Instance;

my $dir = '/tmp/TokyoTyrantx-Instance-test';
mkdir $dir;

{
    my $ti = TokyoTyrantx::Instance->new( test => {
            dir => $dir,
            host => '127.0.0.1',
            port => 4000,
            filename => 'test.tct',
            extra_options => '',
            indices => {
                col1 => 'ITLEXICAL',
            },
        }
    );
    isa_ok($ti, 'TokyoTyrantx::Instance');

    is($ti->start_cmd, '/usr/local/bin/ttserver -host 127.0.0.1 -port 4000 -pid /tmp/TokyoTyrantx-Instance-test/test.pid -log /tmp/TokyoTyrantx-Instance-test/test.log -dmn /tmp/TokyoTyrantx-Instance-test/test.tct', 'cmd');

    ok(!$ti->get_pid, 'no pid');

    ok($ti->start, 'start');
    sleep 1;

    ok($ti->set_indices, 'set_indices');
    
    ok($ti->opti_indices, 'opti_indices');

    ok($ti->get_pid, 'pid');

    my $rdb = $ti->get_rdb;
    isa_ok( $rdb, 'TokyoTyrant::RDBTBL');

    ok($ti->reload, 'reload');
    sleep 1;

    ok($ti->status, 'status');
    sleep 1;

    ok($ti->stop, 'stop');
    sleep( 1 );

    ok(!$ti->status, 'status');

    ok(!$ti->get_pid, 'no pid');

}


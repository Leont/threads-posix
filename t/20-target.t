#! perl
use strict;
use warnings;

use threads::posix;
use Test::More tests => 1;

use POSIX qw/pause SIGUSR1 SIG_BLOCK/;
use Thread::SigMask qw/sigmask/;
use Thread::Semaphore;

alarm 2;

$SIG{USR1} = sub {
	fail("Shouldn't receive signal in main thread");
};

my $sema = Thread::Semaphore->new(0);

sub child {
	$SIG{USR1} = sub {
		pass("Received ARLM");
	};
	$sema->up;
	pause;
}

my $child = threads::posix->create(\&child);
$sema->down;
sigmask(SIG_BLOCK, POSIX::SigSet->new(SIGUSR1));
kill(SIGUSR1, $$);
$child->join;


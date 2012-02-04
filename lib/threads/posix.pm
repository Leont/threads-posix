package threads::posix;
use strict;
use warnings;

use XSLoader;

XSLoader::load(__PACKAGE__, __PACKAGE__->VERSION);

use parent 'threads';

1;

#ABSTRACT: more POSIX correct threads

__END__

=head1 SYNOPSIS

 my $thread = thread::posix->create(sub { ... });
 $thread->kill(SIGALRM);

=head1 DESCRIPTION

This module extends L<threads> to provide behaviors that are more conformant to what POSIX prescribes. You should realize that this doesn't in any way change the threads themselves, just how you intereract with them. Everything not described here should work exactly the same as in threads.pm.

=method kill

Send a signal to a thread. Unlike what threads.pm does, this is a real OS level signal that will interact with various syscalls the way you expect them to, not a poke into the deferred signal handling system.

=begin Pod::Coverage

=item cancel

This method schedules a thread for cancelation. Currently L<threads> is known not to be cancel-safe, so this will leak an entire interpreter. Please use signals instead of this.

=end Pod::Coverage


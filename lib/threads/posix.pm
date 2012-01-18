package threads::posix;
use strict;
use warnings;

use XSLoader;

XSLoader::load(__PACKAGE__, __PACKAGE__->VERSION);

use parent 'threads';

1;

#ABSTRACT: more POSIX correct threads

use strict;
use warnings;
use Module::Build;
use Config;

if (not $Config{useithreads}) {
	print STDERR "Can't use threads::posix without threading support\n";
	exit 0;
}
if (eval { require Perl::OSType } && !Perl::OSType::is_os_type('Unix')) {
	print STDERR "Can't use threads::posix on non-unix\n";
	exit 0;
}

my $builder = Module::Build->new(
  module_name         => 'threads::posix',
##{ $plugin->get_prereqs ##}
);

$builder->create_build_script();

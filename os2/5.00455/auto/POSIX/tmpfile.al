# NOTE: Derived from ../../lib/POSIX.pm.  Changes made here will be lost.
package POSIX;

sub tmpfile {
    redef "IO::File::new_tmpfile()";
}

1;

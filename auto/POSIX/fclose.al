# NOTE: Derived from ../../lib/POSIX.pm.  Changes made here will be lost.
package POSIX;

sub fclose {
    redef "IO::Handle::close()";
}

1;

# NOTE: Derived from ../../lib/POSIX.pm.  Changes made here will be lost.
package POSIX;

sub fflush {
    redef "FileHandle::flush()";
}

1;

# NOTE: Derived from ../../lib/POSIX.pm.  Changes made here will be lost.
package POSIX;

sub clearerr {
    redef "IO::Handle::clearerr()";
}

1;

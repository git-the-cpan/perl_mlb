# NOTE: Derived from ../../lib/POSIX.pm.  Changes made here will be lost.
package POSIX;

sub fileno {
    redef "IO::Handle::fileno()";
}

1;

# NOTE: Derived from ../../lib/POSIX.pm.  Changes made here will be lost.
package POSIX;

sub fseek {
    redef "IO::Seekable::seek()";
}

1;

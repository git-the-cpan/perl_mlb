# NOTE: Derived from ../../lib/POSIX.pm.
# Changes made here will be lost when autosplit again.
# See AutoSplit.pm.
package POSIX;

#line 867 "../../lib/POSIX.pm (autosplit into ../../lib/auto/POSIX/getpgrp.al)"
sub getpgrp {
    usage "getpgrp()" if @_ != 0;
    CORE::getpgrp($_[0]);
}

# end of POSIX::getpgrp
1;

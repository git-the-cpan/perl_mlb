#
# This file is auto-generated. ***ANY*** changes here will be lost
#

package Errno;
use vars qw(@EXPORT_OK %EXPORT_TAGS @ISA $VERSION %errno $AUTOLOAD);
use Exporter ();
use Config;
use strict;

$Config{'myarchname'} eq "os2" or
	die "Errno architecture (os2) does not match executable architecture ($Config{'myarchname'})";

$VERSION = "1.111";
@ISA = qw(Exporter);

@EXPORT_OK = qw(EPIPE ENOTSOCK EWOULDBLOCK ENOSPC EISCONN ENOTTY
	EOPNOTSUPP EAFNOSUPPORT ESHUTDOWN EAGAIN EADDRNOTAVAIL ENETUNREACH
	ESOCKTNOSUPPORT ENOTDIR ESRCH EINPROGRESS EISDIR EROFS EEXIST EBADF
	ENOPROTOOPT EINVAL ENOLCK ENAMETOOLONG EMSGSIZE EDESTADDRREQ EINTR
	EPROTONOSUPPORT ELOOP ECONNREFUSED EPROTOTYPE EDEADLK EIO ECONNRESET
	ENETDOWN EFBIG ENOEXEC ENOTCONN ENFILE EACCES ETIMEDOUT EPERM ERANGE
	ESPIPE ENOMEM ENOSYS EXDEV ECHILD EPFNOSUPPORT ENODEV EALREADY EMLINK
	ENXIO ETOOMANYREFS EADDRINUSE E2BIG EBUSY ECONNABORTED ENOENT
	ENETRESET ENOTEMPTY EDOM EHOSTUNREACH ENOBUFS EFAULT EHOSTDOWN
	EMFILE);

%EXPORT_TAGS = (
    POSIX => [qw(
	E2BIG EACCES EADDRINUSE EADDRNOTAVAIL EAFNOSUPPORT EAGAIN EALREADY
	EBADF EBUSY ECHILD ECONNABORTED ECONNREFUSED ECONNRESET EDEADLK
	EDESTADDRREQ EDOM EEXIST EFAULT EFBIG EHOSTDOWN EHOSTUNREACH
	EINPROGRESS EINTR EINVAL EIO EISCONN EISDIR ELOOP EMFILE EMLINK
	EMSGSIZE ENAMETOOLONG ENETDOWN ENETRESET ENETUNREACH ENFILE ENOBUFS
	ENODEV ENOENT ENOEXEC ENOLCK ENOMEM ENOPROTOOPT ENOSPC ENOSYS ENOTCONN
	ENOTDIR ENOTEMPTY ENOTSOCK ENOTTY ENXIO EOPNOTSUPP EPERM EPFNOSUPPORT
	EPIPE EPROTONOSUPPORT EPROTOTYPE ERANGE EROFS ESHUTDOWN
	ESOCKTNOSUPPORT ESPIPE ESRCH ETIMEDOUT ETOOMANYREFS EWOULDBLOCK
	EXDEV
    )]
);

sub EPERM () { 1 }
sub ENOENT () { 2 }
sub ESRCH () { 3 }
sub EINTR () { 4 }
sub EIO () { 5 }
sub ENXIO () { 6 }
sub E2BIG () { 7 }
sub ENOEXEC () { 8 }
sub EBADF () { 9 }
sub ECHILD () { 10 }
sub EWOULDBLOCK () { 11 }
sub EAGAIN () { 11 }
sub ENOMEM () { 12 }
sub EACCES () { 13 }
sub EFAULT () { 14 }
sub ENOLCK () { 15 }
sub EBUSY () { 16 }
sub EEXIST () { 17 }
sub EXDEV () { 18 }
sub ENODEV () { 19 }
sub ENOTDIR () { 20 }
sub EISDIR () { 21 }
sub EINVAL () { 22 }
sub ENFILE () { 23 }
sub EMFILE () { 24 }
sub ENOTTY () { 25 }
sub EDEADLK () { 26 }
sub EFBIG () { 27 }
sub ENOSPC () { 28 }
sub ESPIPE () { 29 }
sub EROFS () { 30 }
sub EMLINK () { 31 }
sub EPIPE () { 32 }
sub EDOM () { 33 }
sub ERANGE () { 34 }
sub ENOTEMPTY () { 35 }
sub EINPROGRESS () { 36 }
sub ENOSYS () { 37 }
sub ENAMETOOLONG () { 38 }
sub EDESTADDRREQ () { 39 }
sub EMSGSIZE () { 40 }
sub EPROTOTYPE () { 41 }
sub ENOPROTOOPT () { 42 }
sub EPROTONOSUPPORT () { 43 }
sub ESOCKTNOSUPPORT () { 44 }
sub EOPNOTSUPP () { 45 }
sub EPFNOSUPPORT () { 46 }
sub EAFNOSUPPORT () { 47 }
sub EADDRINUSE () { 48 }
sub EADDRNOTAVAIL () { 49 }
sub ENETDOWN () { 50 }
sub ENETUNREACH () { 51 }
sub ENETRESET () { 52 }
sub ECONNABORTED () { 53 }
sub ECONNRESET () { 54 }
sub ENOBUFS () { 55 }
sub EISCONN () { 56 }
sub ENOTCONN () { 57 }
sub ESHUTDOWN () { 58 }
sub ETOOMANYREFS () { 59 }
sub ETIMEDOUT () { 60 }
sub ECONNREFUSED () { 61 }
sub ELOOP () { 62 }
sub ENOTSOCK () { 63 }
sub EHOSTDOWN () { 64 }
sub EHOSTUNREACH () { 65 }
sub EALREADY () { 66 }

sub TIEHASH { bless [] }

sub FETCH {
    my ($self, $errname) = @_;
    my $proto = prototype("Errno::$errname");
    if (defined($proto) && $proto eq "") {
	no strict 'refs';
        return $! == &$errname;
    }
    require Carp;
    Carp::confess("No errno $errname");
} 

sub STORE {
    require Carp;
    Carp::confess("ERRNO hash is read only!");
}

*CLEAR = \&STORE;
*DELETE = \&STORE;

sub NEXTKEY {
    my($k,$v);
    while(($k,$v) = each %Errno::) {
	my $proto = prototype("Errno::$k");
	last if (defined($proto) && $proto eq "");
	
    }
    $k
}

sub FIRSTKEY {
    my $s = scalar keys %Errno::;
    goto &NEXTKEY;
}

sub EXISTS {
    my ($self, $errname) = @_;
    my $proto = prototype($errname);
    defined($proto) && $proto eq "";
}

tie %!, __PACKAGE__;

1;
__END__

=head1 NAME

Errno - System errno constants

=head1 SYNOPSIS

    use Errno qw(EINTR EIO :POSIX);

=head1 DESCRIPTION

C<Errno> defines and conditionally exports all the error constants
defined in your system C<errno.h> include file. It has a single export
tag, C<:POSIX>, which will export all POSIX defined error numbers.

C<Errno> also makes C<%!> magic such that each element of C<%!> has a non-zero
value only if C<$!> is set to that value, eg

    use Errno;
    
    unless (open(FH, "/fangorn/spouse")) {
        if ($!{ENOENT}) {
            warn "Get a wife!\n";
        } else {
            warn "This path is barred: $!";
        } 
    } 

=head1 AUTHOR

Graham Barr <gbarr@pobox.com>

=head1 COPYRIGHT

Copyright (c) 1997-8 Graham Barr. All rights reserved.
This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut


package Time::HiRes;

use strict;
use vars qw($VERSION $XS_VERSION @ISA @EXPORT @EXPORT_OK $AUTOLOAD);

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);

@EXPORT = qw( );
@EXPORT_OK = qw (usleep sleep ualarm alarm gettimeofday time tv_interval
		 getitimer setitimer
		 ITIMER_REAL ITIMER_VIRTUAL ITIMER_PROF ITIMER_REALPROF
		 d_usleep d_ualarm d_gettimeofday d_getitimer d_setitimer
		 d_nanosleep);
	
$VERSION = '1.52';
$XS_VERSION = $VERSION;
$VERSION = eval $VERSION;

sub AUTOLOAD {
    my $constname;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    die "&Time::HiRes::constant not defined" if $constname eq 'constant';
    my ($error, $val) = constant($constname);
    if ($error) { die $error; }
    {
	no strict 'refs';
	*$AUTOLOAD = sub { $val };
    }
    goto &$AUTOLOAD;
}

bootstrap Time::HiRes;

# Preloaded methods go here.

sub tv_interval {
    # probably could have been done in C
    my ($a, $b) = @_;
    $b = [gettimeofday()] unless defined($b);
    (${$b}[0] - ${$a}[0]) + ((${$b}[1] - ${$a}[1]) / 1_000_000);
}

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__

=head1 NAME

Time::HiRes - High resolution alarm, sleep, gettimeofday, interval timers

=head1 SYNOPSIS

  use Time::HiRes qw( usleep ualarm gettimeofday tv_interval );

  usleep ($microseconds);

  ualarm ($microseconds);
  ualarm ($microseconds, $interval_microseconds);

  $t0 = [gettimeofday];
  ($seconds, $microseconds) = gettimeofday;

  $elapsed = tv_interval ( $t0, [$seconds, $microseconds]);
  $elapsed = tv_interval ( $t0, [gettimeofday]);
  $elapsed = tv_interval ( $t0 );

  use Time::HiRes qw ( time alarm sleep );

  $now_fractions = time;
  sleep ($floating_seconds);
  alarm ($floating_seconds);
  alarm ($floating_seconds, $floating_interval);

  use Time::HiRes qw( setitimer getitimer
		      ITIMER_REAL ITIMER_VIRTUAL ITIMER_PROF ITIMER_REALPROF );

  setitimer ($which, $floating_seconds, $floating_interval );
  getitimer ($which);

=head1 DESCRIPTION

The C<Time::HiRes> module implements a Perl interface to the C<usleep>,
C<ualarm>, C<gettimeofday>, and C<setitimer>/C<getitimer> system calls, in other
words, high resolution time and timers. See the L</EXAMPLES> section below
and the test scripts for usage; see your system documentation for the
description of the underlying C<nanosleep> or C<usleep>, C<ualarm>,
C<gettimeofday>, and C<setitimer>/C<getitimer> calls.

If your system lacks C<gettimeofday()> or an emulation of it you don't
get C<gettimeofday()> or the one-argument form of C<tv_interval()>.  If your system lacks all of 
C<nanosleep()>, C<usleep()>, and C<select()>, you don't get
C<Time::HiRes::usleep()> or C<Time::HiRes::sleep()>.  If your system lacks both
C<ualarm()> and C<setitimer()> you don't get
C<Time::HiRes::ualarm()> or C<Time::HiRes::alarm()>.

If you try to import an unimplemented function in the C<use> statement
it will fail at compile time.

If your subsecond sleeping is implemented with C<nanosleep()> instead of
C<usleep()>, you can mix subsecond sleeping with signals since
C<nanosleep()> does not use signals.  This, however is unportable, and you
should first check for the truth value of C<&Time::HiRes::d_nanosleep> to
see whether you have nanosleep, and then carefully read your
C<nanosleep()> C API documentation for any peculiarities.  (There is no
separate interface to call C<nanosleep()>; just use C<Time::HiRes::sleep()>
or C<Time::HiRes::usleep()> with small enough values.)

Unless using C<nanosleep> for mixing sleeping with signals, give
some thought to whether Perl is the tool you should be using for work
requiring nanosecond accuracies.

The following functions can be imported from this module.
No functions are exported by default.

=over 4

=item gettimeofday ()

In array context returns a two-element array with the seconds and
microseconds since the epoch.  In scalar context returns floating
seconds like C<Time::HiRes::time()> (see below).

=item usleep ( $useconds )

Sleeps for the number of microseconds specified.  Returns the number
of microseconds actually slept.  Can sleep for more than one second,
unlike the C<usleep> system call. See also C<Time::HiRes::sleep()> below.

=item ualarm ( $useconds [, $interval_useconds ] )

Issues a C<ualarm> call; the C<$interval_useconds> is optional and
will be zero if unspecified, resulting in C<alarm>-like behaviour.

=item tv_interval 

tv_interval ( $ref_to_gettimeofday [, $ref_to_later_gettimeofday] )

Returns the floating seconds between the two times, which should have
been returned by C<gettimeofday()>. If the second argument is omitted,
then the current time is used.

=item time ()

Returns a floating seconds since the epoch. This function can be
imported, resulting in a nice drop-in replacement for the C<time>
provided with core Perl; see the L</EXAMPLES> below.

B<NOTE 1>: This higher resolution timer can return values either less
or more than the core C<time()>, depending on whether your platform
rounds the higher resolution timer values up, down, or to the nearest second
to get the core C<time()>, but naturally the difference should be never
more than half a second.

B<NOTE 2>: Since Sunday, September 9th, 2001 at 01:46:40 AM GMT, when
the C<time()> seconds since epoch rolled over to 1_000_000_000, the
default floating point format of Perl and the seconds since epoch have
conspired to produce an apparent bug: if you print the value of
C<Time::HiRes::time()> you seem to be getting only five decimals, not six
as promised (microseconds).  Not to worry, the microseconds are there
(assuming your platform supports such granularity in first place).
What is going on is that the default floating point format of Perl
only outputs 15 digits.  In this case that means ten digits before the
decimal separator and five after.  To see the microseconds you can use
either C<printf>/C<sprintf> with C<"%.6f">, or the C<gettimeofday()> function in
list context, which will give you the seconds and microseconds as two
separate values.

=item sleep ( $floating_seconds )

Sleeps for the specified amount of seconds.  Returns the number of
seconds actually slept (a floating point value).  This function can be
imported, resulting in a nice drop-in replacement for the C<sleep>
provided with perl, see the L</EXAMPLES> below.

=item alarm ( $floating_seconds [, $interval_floating_seconds ] )

The C<SIGALRM> signal is sent after the specified number of seconds.
Implemented using C<ualarm()>.  The C<$interval_floating_seconds> argument
is optional and will be zero if unspecified, resulting in C<alarm()>-like
behaviour.  This function can be imported, resulting in a nice drop-in
replacement for the C<alarm> provided with perl, see the L</EXAMPLES> below.

B<NOTE 1>: With some operating system and Perl release combinations
C<SIGALRM> restarts C<select()>, instead of interuping it.  
This means that an C<alarm()> followed by a C<select()>
may together take the sum of the times specified for the the
C<alarm()> and the C<select()>, not just the time of the C<alarm()>.

=item setitimer ( $which, $floating_seconds [, $interval_floating_seconds ] )

Start up an interval timer: after a certain time, a signal arrives,
and more signals may keep arriving at certain intervals.  To disable a
timer, use C<$floating_seconds> of zero.  If the C<$interval_floating_seconds>
is set to zero (or unspecified), the timer is disabled B<after> the
next delivered signal.

Use of interval timers may interfere with C<alarm()>, C<sleep()>,
and C<usleep()>.  In standard-speak the "interaction is unspecified",
which means that I<anything> may happen: it may work, it may not.

In scalar context, the remaining time in the timer is returned.

In list context, both the remaining time and the interval are returned.

There are usually three or four interval timers available: the C<$which>
can be C<ITIMER_REAL>, C<ITIMER_VIRTUAL>, C<ITIMER_PROF>, or C<ITIMER_REALPROF>.
Note that which ones are available depends: true UNIX platforms usually
have the first three, but (for example) Win32 and Cygwin have only
C<ITIMER_REAL>, and only Solaris seems to have C<ITIMER_REALPROF> (which is
used to profile multithreaded programs).

C<ITIMER_REAL> results in C<alarm()>-like behavior.  Time is counted in
I<real time>; that is, wallclock time.  C<SIGALRM> is delivered when
the timer expires.

C<ITIMER_VIRTUAL> counts time in (process) I<virtual time>; that is, only
when the process is running.  In multiprocessor/user/CPU systems this
may be more or less than real or wallclock time.  (This time is also
known as the I<user time>.)  C<SIGVTALRM> is delivered when the timer expires.

C<ITIMER_PROF> counts time when either the process virtual time or when
the operating system is running on behalf of the process (such as I/O).
(This time is also known as the I<system time>.)  (The sum of user
time and system time is known as the I<CPU time>.)  C<SIGPROF> is
delivered when the timer expires.  C<SIGPROF> can interrupt system calls.

The semantics of interval timers for multithreaded programs are
system-specific, and some systems may support additional interval
timers.  See your C<setitimer()> documentation.

=item getitimer ( $which )

Return the remaining time in the interval timer specified by C<$which>.

In scalar context, the remaining time is returned.

In list context, both the remaining time and the interval are returned.
The interval is always what you put in using C<setitimer()>.

=back

=head1 EXAMPLES

  use Time::HiRes qw(usleep ualarm gettimeofday tv_interval);

  $microseconds = 750_000;
  usleep $microseconds;

  # signal alarm in 2.5s & every .1s thereafter
  ualarm 2_500_000, 100_000;	

  # get seconds and microseconds since the epoch
  ($s, $usec) = gettimeofday;

  # measure elapsed time 
  # (could also do by subtracting 2 gettimeofday return values)
  $t0 = [gettimeofday];
  # do bunch of stuff here
  $t1 = [gettimeofday];
  # do more stuff here
  $t0_t1 = tv_interval $t0, $t1;

  $elapsed = tv_interval ($t0, [gettimeofday]);
  $elapsed = tv_interval ($t0);	# equivalent code

  #
  # replacements for time, alarm and sleep that know about
  # floating seconds
  #
  use Time::HiRes;
  $now_fractions = Time::HiRes::time;
  Time::HiRes::sleep (2.5);
  Time::HiRes::alarm (10.6666666);

  use Time::HiRes qw ( time alarm sleep );
  $now_fractions = time;
  sleep (2.5);
  alarm (10.6666666);

  # Arm an interval timer to go off first at 10 seconds and
  # after that every 2.5 seconds, in process virtual time

  use Time::HiRes qw ( setitimer ITIMER_VIRTUAL time );

  $SIG{VTALRM} = sub { print time, "\n" };
  setitimer(ITIMER_VIRTUAL, 10, 2.5);

=head1 C API

In addition to the perl API described above, a C API is available for
extension writers.  The following C functions are available in the
modglobal hash:

  name             C prototype
  ---------------  ----------------------
  Time::NVtime     double (*)()
  Time::U2time     void (*)(UV ret[2])

Both functions return equivalent information (like C<gettimeofday>)
but with different representations.  The names C<NVtime> and C<U2time>
were selected mainly because they are operating system independent.
(C<gettimeofday> is Unix-centric, though some platforms like VMS have
emulations for it.)

Here is an example of using C<NVtime> from C:

  double (*myNVtime)();
  SV **svp = hv_fetch(PL_modglobal, "Time::NVtime", 12, 0);
  if (!svp)         croak("Time::HiRes is required");
  if (!SvIOK(*svp)) croak("Time::NVtime isn't a function pointer");
  myNVtime = INT2PTR(double(*)(), SvIV(*svp));
  printf("The current time is: %f\n", (*myNVtime)());

=head1 DIAGNOSTICS

=head2 negative time not invented yet

You tried to use a negative time argument.

=head2 internal error: useconds < 0 (unsigned ... signed ...)

Something went horribly wrong-- the number of microseconds that cannot
become negative just became negative.  Maybe your compiler is broken?

=head1 CAVEATS

Notice that the core C<time()> maybe rounding rather than truncating.
What this means is that the core C<time()> may be reporting the time as one second
later than C<gettimeofday()> and C<Time::HiRes::time()>.

=head1 AUTHORS

D. Wegscheid <wegscd@whirlpool.com>
R. Schertler <roderick@argon.org>
J. Hietaniemi <jhi@iki.fi>
G. Aas <gisle@aas.no>

=head1 COPYRIGHT AND LICENSE

Copyright (c) 1996-2002 Douglas E. Wegscheid.  All rights reserved.

Copyright (c) 2002,2003 Jarkko Hietaniemi.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

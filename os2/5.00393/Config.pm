package Config;
use Exporter ();
@ISA = (Exporter);
@EXPORT = qw(%Config);
@EXPORT_OK = qw(myconfig config_sh config_vars);

$] == 5.00393
  or die "Perl lib version (5.00393) doesn't match executable version ($])";

# This file was created by configpm when Perl was built. Any changes
# made to this file will be lost the next time perl is built.

##!F:/BIN/sh.exe
##
## This file was produced by running the Configure script. It holds all the
## definitions figured out by Configure. Should you modify one of these values,
## do not forget to propagate your changes by running "Configure -der". You may
## instead choose to run each of the .SH files by yourself, or "Configure -S".
##
#
## Configuration time: Thu Mar 13 07:34:29 PST 1997
## Configured by: ilya
## Target system: os2 karetnikova 2 2.30 i386 
#
## Variables propagated from previous config.sh file.

my $config_sh = <<'!END!';
archlibexp='f:/perllib/lib/os2/5.00393'
archname='os2'
cc='gcc'
ccflags='-Zomf -Zmt -DDOSISH -DOS2=2 -DEMBED -I. -DPACK_MALLOC -DDEBUGGING_MSTATS -DTWO_POT_OPTIMIZE -DPERL_EMERGENCY_SBRK'
cppflags='-Zomf -Zmt -DDOSISH -DOS2=2 -DEMBED -I. -DPACK_MALLOC -DDEBUGGING_MSTATS -DTWO_POT_OPTIMIZE -DPERL_EMERGENCY_SBRK'
dlsrc='dl_dlopen.xs'
dynamic_ext='DB_File Fcntl IO OS2/ExtAttr OS2/PrfDB OS2/Process OS2/REXX Opcode POSIX SDBM_File Socket'
extensions='DB_File Fcntl IO OS2/ExtAttr OS2/PrfDB OS2/Process OS2/REXX Opcode POSIX SDBM_File Socket'
installarchlib='f:/perllib/lib/os2/5.00393'
installprivlib='f:/perllib/lib'
libpth='f:/emx.add/lib f:/emx/lib D:/DEVTOOLS/OPENGL/LIB f:/emx/lib/mt'
libs='-lsocket -lm -lbsd'
osname='os2'
osvers='2.30'
prefix='f:/perllib'
privlibexp='f:/perllib/lib'
sharpbang='#!'
shsharp='true'
sig_name='ZERO HUP INT QUIT ILL TRAP ABRT EMT FPE KILL BUS SEGV SYS PIPE ALRM TERM USR1 USR2 CHLD NUM19 NUM20 BREAK CLD '
sig_num='0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 18 '
so='dll'
startsh='#!F:/BIN/sh.exe'
static_ext=' '
Author=''
CONFIG='true'
Date='$Date'
EXECSHELL='sh'
Header=''
Id='$Id'
Locker=''
Log='$Log'
Mcc='Mcc'
PATCHLEVEL='3'
RCSfile='$RCSfile'
Revision='$Revision'
SUBVERSION='93'
Source=''
State=''
afs='false'
alignbytes='4'
aout_ar='ar'
aout_archobjs='os2.o dl_os2.o'
aout_ccflags='-DPERL_CORE -DDOSISH -DPERL_IS_AOUT -DOS2=2 -DEMBED -I. -DPACK_MALLOC -DDEBUGGING_MSTATS -DTWO_POT_OPTIMIZE -DPERL_EMERGENCY_SBRK'
aout_cppflags='-DPERL_CORE -DDOSISH -DPERL_IS_AOUT -DOS2=2 -DEMBED -I. -DPACK_MALLOC -DDEBUGGING_MSTATS -DTWO_POT_OPTIMIZE -DPERL_EMERGENCY_SBRK'
aout_d_fork='define'
aout_d_shrplib='undef'
aout_lddlflags='-Zdll'
aout_ldflags='-Zexe -Zsmall-conv'
aout_lib_ext='.a'
aout_obj_ext='.o'
aout_plibext='.a'
aout_use_clib='c'
aout_usedl='undef'
aout_useshrplib='false'
aphostname=''
ar='emxomfar'
archlib='f:/perllib/lib/os2/5.00393'
archobjs='os2.obj dl_os2.obj'
awk='awk'
baserev='5.0'
bash=''
bin='f:/perllib/bin'
bincompat3='y'
binexp='f:/perllib/bin'
bison=''
byacc='byacc'
byteorder='1234'
c='\c'
castflags='0'
cat='cat'
cccdlflags='-Zdll'
ccdlflags=' '
cf_by='ilya'
cf_email='ilya@karetnikova.uucp'
cf_time='Thu Mar 13 07:34:29 PST 1997'
chgrp=''
chmod=''
chown=''
clocktype='clock_t'
comm='comm'
compress=''
contains='grep'
cp='cp'
cpio=''
cpp='cpp'
cpp_stuff='42'
cpplast='-'
cppminus='-'
cpprun='gcc -E'
cppstdin='gcc -E'
cryptlib=''
csh='csh'
d_Gconvert='gcvt((x),(n),(b))'
d_access='define'
d_alarm='define'
d_archlib='define'
d_attribut='define'
d_bcmp='define'
d_bcopy='define'
d_bincompat3='define'
d_bsd='undef'
d_bsdgetpgrp='undef'
d_bsdpgrp='undef'
d_bsdsetpgrp='undef'
d_bzero='define'
d_casti32='define'
d_castneg='define'
d_charvspr='undef'
d_chown='undef'
d_chroot='undef'
d_chsize='define'
d_closedir='define'
d_const='define'
d_crypt='undef'
d_csh='undef'
d_cuserid='define'
d_dbl_dig='define'
d_difftime='define'
d_dirnamlen='define'
d_dlerror='undef'
d_dlopen='undef'
d_dlsymun='undef'
d_dosuid='undef'
d_dup2='define'
d_eofnblk='define'
d_eunice='undef'
d_fchmod='undef'
d_fchown='undef'
d_fcntl='define'
d_fd_macros='define'
d_fd_set='define'
d_fds_bits='define'
d_fgetpos='define'
d_flexfnam='define'
d_flock='define'
d_fork='define'
d_fpathconf='define'
d_fsetpos='define'
d_ftime='undef'
d_getgrps='define'
d_gethent='define'
d_gethname='undef'
d_getlogin='define'
d_getpgid='undef'
d_getpgrp2='undef'
d_getpgrp='define'
d_getppid='define'
d_getprior='define'
d_gettimeod='define'
d_gnulibc='undef'
d_htonl='define'
d_index='undef'
d_inetaton='undef'
d_isascii='define'
d_killpg='undef'
d_link='undef'
d_locconv='define'
d_lockf='undef'
d_lstat='undef'
d_mblen='define'
d_mbstowcs='define'
d_mbtowc='define'
d_memcmp='define'
d_memcpy='define'
d_memmove='define'
d_memset='define'
d_mkdir='define'
d_mkfifo='undef'
d_mktime='define'
d_msg='undef'
d_msgctl='undef'
d_msgget='undef'
d_msgrcv='undef'
d_msgsnd='undef'
d_mymalloc='define'
d_nice='undef'
d_oldarchlib='undef'
d_oldsock='undef'
d_open3='define'
d_pathconf='define'
d_pause='define'
d_phostname='undef'
d_pipe='define'
d_poll='undef'
d_portable='define'
d_pwage='define'
d_pwchange='undef'
d_pwclass='undef'
d_pwcomment='define'
d_pwexpire='undef'
d_pwquota='undef'
d_readdir='define'
d_readlink='undef'
d_rename='define'
d_rewinddir='define'
d_rmdir='define'
d_safebcpy='define'
d_safemcpy='undef'
d_sanemcmp='define'
d_seekdir='define'
d_select='define'
d_sem='undef'
d_semctl='undef'
d_semget='undef'
d_semop='undef'
d_setegid='undef'
d_seteuid='undef'
d_setlinebuf='undef'
d_setlocale='define'
d_setpgid='define'
d_setpgrp2='undef'
d_setpgrp='undef'
d_setprior='define'
d_setregid='undef'
d_setresgid='undef'
d_setresuid='undef'
d_setreuid='undef'
d_setrgid='undef'
d_setruid='undef'
d_setsid='undef'
d_sfio='undef'
d_shm='undef'
d_shmat='undef'
d_shmatprototype='undef'
d_shmctl='undef'
d_shmdt='undef'
d_shmget='undef'
d_sigaction='define'
d_sigsetjmp='define'
d_socket='define'
d_sockpair='undef'
d_statblks='undef'
d_stdio_cnt_lval='define'
d_stdio_ptr_lval='define'
d_stdiobase='define'
d_stdstdio='define'
d_strchr='define'
d_strcoll='define'
d_strctcpy='define'
d_strerrm='strerror(e)'
d_strerror='define'
d_strtod='define'
d_strtol='define'
d_strtoul='define'
d_strxfrm='define'
d_suidsafe='undef'
d_symlink='undef'
d_syscall='undef'
d_sysconf='define'
d_sysernlst=''
d_syserrlst='define'
d_system='define'
d_tcgetpgrp='define'
d_tcsetpgrp='define'
d_telldir='define'
d_time='define'
d_times='define'
d_truncate='define'
d_tzname='define'
d_umask='define'
d_uname='define'
d_vfork='undef'
d_void_closedir='undef'
d_voidsig='define'
d_voidtty=''
d_volatile='define'
d_vprintf='define'
d_wait4='undef'
d_waitpid='define'
d_wcstombs='define'
d_wctomb='define'
d_xenix='undef'
date='date'
db_hashtype='u_int32_t'
db_prefixtype='size_t'
defvoidused='15'
direntrytype='struct dirent'
dlext='dll'
eagain='EAGAIN'
echo='echo'
egrep='egrep'
emacs=''
emxcrtrev='51'
eunicefix=':'
exe_ext='.exe'
expr='expr'
find='find'
firstmakefile='GNUmakefile'
flex=''
fpostype='fpos_t'
freetype='void'
full_csh='csh'
full_sed='F:/EMX.ADD/BIN/sed'
gcc=''
gccversion='2.7.2.1'
gidtype='gid_t'
glibpth='/usr/shlib  /shlib /lib/pa1.1 /usr/lib/large /lib /usr/lib /usr/lib/386 /lib/386 /lib/large /usr/lib/small /lib/small /usr/ccs/lib /usr/ucblib /usr/local/lib '
grep='grep'
groupcat=''
groupstype='gid_t'
gzip='gzip'
h_fcntl='false'
h_sysfile='true'
hint='recommended'
hostcat=''
huge=''
i_bsdioctl=''
i_db='define'
i_dbm='undef'
i_dirent='define'
i_dld='undef'
i_dlfcn='define'
i_fcntl='undef'
i_float='define'
i_gdbm='undef'
i_grp='define'
i_limits='define'
i_locale='define'
i_malloc='define'
i_math='define'
i_memory='undef'
i_ndbm='undef'
i_neterrno='undef'
i_niin='define'
i_pwd='define'
i_rpcsvcdbm='undef'
i_sfio='undef'
i_sgtty='undef'
i_stdarg='define'
i_stddef='define'
i_stdlib='define'
i_string='define'
i_sysdir='define'
i_sysfile='define'
i_sysfilio='undef'
i_sysin='undef'
i_sysioctl='define'
i_sysndir='undef'
i_sysparam='define'
i_sysresrc='define'
i_sysselct='define'
i_syssockio=''
i_sysstat='define'
i_systime='define'
i_systimek='undef'
i_systimes='define'
i_systypes='define'
i_sysun='define'
i_syswait='define'
i_termio='undef'
i_termios='define'
i_time='undef'
i_unistd='define'
i_utime='define'
i_values='undef'
i_varargs='undef'
i_varhdr='stdarg.h'
i_vfork='undef'
incpath=''
inews=''
installbin='f:/perllib/bin'
installman1dir='f:/perllib/man/man1'
installman3dir='f:/perllib/man/man3'
installscript='f:/perllib/bin'
installsitearch='f:/perllib/lib/site_perl/os2'
installsitelib='f:/perllib/lib/site_perl'
intsize='4'
known_extensions='DB_File Fcntl GDBM_File IO NDBM_File ODBM_File OS2/ExtAttr OS2/PrfDB OS2/Process OS2/REXX Opcode POSIX SDBM_File Socket'
ksh=''
large=''
ld='gcc'
lddlflags='-Zdll -Zomf -Zmt -Zcrtdll'
ldflags='-Zexe -Zomf -Zmt -Zcrtdll -Zstack 32000'
less='less'
lib_ext='.lib'
libc='f:/emx/lib/mt/c_import.lib'
libemx='f:/emx/lib'
libperl='libperl.lib'
libswanted='sfio net socket inet nsl nm ndbm gdbm dbm db malloc dl dld ld sun m c cposix posix ndir dir crypt ucb bsd BSD PW x'
line='line'
lint=''
lkflags=''
ln='cp'
lns='cp'
locincpth='/usr/local/include /opt/local/include /usr/gnu/include /opt/gnu/include /usr/GNU/include /opt/GNU/include'
loclibpth='/usr/local/lib /opt/local/lib /usr/gnu/lib /opt/gnu/lib /usr/GNU/lib /opt/GNU/lib'
longsize='4'
lp=''
lpr=''
ls='ls'
lseektype='off_t'
mail=''
mailx=''
make='F:/EMX.ADD/BIN/make'
make_set_make='#'
mallocobj='malloc.obj'
mallocsrc='malloc.c'
malloctype='void *'
man1dir='f:/perllib/man/man1'
man1direxp='f:/perllib/man/man1'
man1ext='1'
man3dir='f:/perllib/man/man3'
man3direxp='f:/perllib/man/man3'
man3ext='3'
medium=''
mips=''
mips_type=''
mkdir='mkdir'
models='none'
modetype='mode_t'
more='more'
mv=''
myarchname='os2'
mydomain='.uucp'
myhostname='karetnikova'
myttyname=''
myuname='os2 karetnikova 2 2.30 i386 '
n=''
nm_opt='-p'
nm_so_opt=''
nroff='nroff'
o_nonblock='O_NONBLOCK'
obj_ext='.obj'
oldarchlib=''
oldarchlibexp=''
optimize='-O'
orderlib='true'
package='perl5'
pager='/usr/ucb/more'
passcat=''
patchlevel='3'
path_sep=';'
perl='perl'
perladmin='ilya@karetnikova.uucp'
perlpath='f:/perllib/bin/perl'
pg='pg'
phostname='hostname'
plibext='.lib'
plibpth=''
pmake=''
pr=''
prefixexp='f:/perllib'
privlib='f:/perllib/lib'
prototype='define'
randbits='31'
ranlib=':'
rd_nodata='-1'
rm='rm'
rmail=''
runnm='true'
scriptdir='f:/perllib/bin'
scriptdirexp='f:/perllib/bin'
sed='sed'
selecttype='fd_set *'
sendmail='sendmail'
sh='F:/BIN/sh.exe'
shar=''
shmattype=''
shortsize='2'
shrpenv='env LD_RUN_PATH=f:/perllib/lib/os2/5.00393/CORE'
signal_t='void'
sitearch='f:/perllib/lib/site_perl/os2'
sitearchexp='f:/perllib/lib/site_perl/os2'
sitelib='f:/perllib/lib/site_perl'
sitelibexp='f:/perllib/lib/site_perl'
sizetype='size_t'
sleep=''
smail=''
small=''
sockethdr=''
socketlib=''
sort='sort'
spackage='Perl5'
spitshell='cat'
split=''
ssizetype='ssize_t'
startperl='#!f:/perllib/bin/perl'
stdchar='char'
stdio_base='((fp)->_buffer)'
stdio_bufsiz='((fp)->_rcount + (fp)->_ptr - (fp)->_buffer)'
stdio_cnt='((fp)->_rcount)'
stdio_ptr='((fp)->_ptr)'
stdstdunder='1'
strings='f:/emx/include/string.h'
submit=''
subversion='93'
sysman='f:/man/man1'
tail=''
tar=''
tbl=''
test='test'
timeincl='f:/emx/include/sys/time.h '
timetype='time_t'
touch='touch'
tr='tr'
troff=''
uidtype='uid_t'
uname='uname'
uniq='uniq'
used_aout='d_shrplib useshrplib plibext lib_ext obj_ext ar plibext d_fork lddlflags ldflags ccflags use_clib usedl archobjs cppflags'
usedl='define'
usemymalloc='y'
usenm='true'
useopcode='true'
useperlio='undef'
useposix='true'
usesfio='false'
useshrplib='true'
usevfork='false'
usrinc='/emx/include'
uuname=''
vi=''
voidflags='15'
xlibpth='/usr/lib/386 /lib/386'
zcat=''
zip='zip'
!END!

my $summary = <<'!END!';
Summary of my $package ($baserev patchlevel $PATCHLEVEL subversion $SUBVERSION) configuration:
  Platform:
    osname=$osname, osvers=$osvers, archname=$archname
    uname='$myuname'
    hint=$hint, useposix=$useposix, d_sigaction=$d_sigaction
    bincompat3=$bincompat3 useperlio=$useperlio d_sfio=$d_sfio
  Compiler:
    cc='$cc', optimize='$optimize', gccversion=$gccversion
    cppflags='$cppflags'
    ccflags ='$ccflags'
    stdchar='$stdchar', d_stdstdio=$d_stdstdio, usevfork=$usevfork
    voidflags=$voidflags, castflags=$castflags, d_casti32=$d_casti32, d_castneg=$d_castneg
    intsize=$intsize, alignbytes=$alignbytes, usemymalloc=$usemymalloc, randbits=$randbits
  Linker and Libraries:
    ld='$ld', ldflags ='$ldflags'
    libpth=$libpth
    libs=$libs
    libc=$libc, so=$so
    useshrplib=$useshrplib, libperl=$libperl
  Dynamic Linking:
    dlsrc=$dlsrc, dlext=$dlext, d_dlsymun=$d_dlsymun, ccdlflags='$ccdlflags'
    cccdlflags='$cccdlflags', lddlflags='$lddlflags'

!END!
my $summary_expanded = 0;

sub myconfig {
	return $summary if $summary_expanded;
	$summary =~ s/\$(\w+)/$Config{$1}/ge;
	$summary_expanded = 1;
	$summary;
}

sub FETCH { 
    # check for cached value (which may be undef so we use exists not defined)
    return $_[0]->{$_[1]} if (exists $_[0]->{$_[1]});

    # Search for it in the big string 
    my($value, $start, $marker);
    $marker = "$_[1]='";
    # return undef unless (($value) = $config_sh =~ m/^$_[1]='(.*)'\s*$/m);
    $start = index($config_sh, "\n$marker");
    return undef if ( ($start == -1) &&  # in case it's first 
        (substr($config_sh, 0, length($marker)) ne $marker) );
    if ($start == -1) { $start = length($marker) } 
        else { $start += length($marker) + 1 }
    $value = substr($config_sh, $start, 
        index($config_sh, qq('\n), $start) - $start);
 
    $value = undef if $value eq 'undef'; # So we can say "if $Config{'foo'}".
    $_[0]->{$_[1]} = $value; # cache it
    return $value;
}
 
my $prevpos = 0;

sub FIRSTKEY {
    $prevpos = 0;
    # my($key) = $config_sh =~ m/^(.*?)=/;
    substr($config_sh, 0, index($config_sh, '=') );
    # $key;
}

sub NEXTKEY {
    my $pos = index($config_sh, qq('\n), $prevpos) + 2;
    my $len = index($config_sh, "=", $pos) - $pos;
    $prevpos = $pos;
    $len > 0 ? substr($config_sh, $pos, $len) : undef;
}

sub EXISTS { 
    # exists($_[0]->{$_[1]})  or  $config_sh =~ m/^$_[1]=/m;
    exists($_[0]->{$_[1]}) or
    index($config_sh, "\n$_[1]='") != -1 or
    substr($config_sh, 0, length($_[1])+2) eq "$_[1]='";
}

sub STORE  { die "\%Config::Config is read-only\n" }
sub DELETE { &STORE }
sub CLEAR  { &STORE }


sub config_sh {
    $config_sh
}

sub config_re {
    my $re = shift;
    my @matches = ($config_sh =~ /^$re=.*\n/mg);
    @matches ? (print @matches) : print "$re: not found\n";
}

sub config_vars {
    foreach(@_){
	config_re($_), next if /\W/;
	my $v=(exists $Config{$_}) ? $Config{$_} : 'UNKNOWN';
	$v='undef' unless defined $v;
	print "$_='$v';\n";
    }
}

my %preconfig;
if ($OS2::is_aout) {
    my ($value, $v) = $config_sh =~ m/^used_aout='(.*)'\s*$/m;
    for (split ' ', $value) {
        ($v) = $config_sh =~ m/^aout_$_='(.*)'\s*$/m;
        $preconfig{$_} = $v eq 'undef' ? undef : $v;
    }
}
sub TIEHASH { bless {%preconfig} }

tie %Config, 'Config';

1;
__END__

=head1 NAME

Config - access Perl configuration information

=head1 SYNOPSIS

    use Config;
    if ($Config{'cc'} =~ /gcc/) {
	print "built by gcc\n";
    } 

    use Config qw(myconfig config_sh config_vars);

    print myconfig();

    print config_sh();

    config_vars(qw(osname archname));


=head1 DESCRIPTION

The Config module contains all the information that was available to
the C<Configure> program at Perl build time (over 900 values).

Shell variables from the F<config.sh> file (written by Configure) are
stored in the readonly-variable C<%Config>, indexed by their names.

Values stored in config.sh as 'undef' are returned as undefined
values.  The perl C<exists> function can be used to check if a
named variable exists.

=over 4

=item myconfig()

Returns a textual summary of the major perl configuration values.
See also C<-V> in L<perlrun/Switches>.

=item config_sh()

Returns the entire perl configuration information in the form of the
original config.sh shell variable assignment script.

=item config_vars(@names)

Prints to STDOUT the values of the named configuration variable. Each is
printed on a separate line in the form:

  name='value';

Names which are unknown are output as C<name='UNKNOWN';>.
See also C<-V:name> in L<perlrun/Switches>.

=back

=head1 EXAMPLE

Here's a more sophisticated example of using %Config:

    use Config;
    use strict;

    my %sig_num;
    my @sig_name;
    unless($Config{sig_name} && $Config{sig_num}) {
	die "No sigs?";
    } else {
	my @names = split ' ', $Config{sig_name};
	@sig_num{@names} = split ' ', $Config{sig_num};
	foreach (@names) {
	    $sig_name[$sig_num{$_}] ||= $_;
	}   
    }

    print "signal #17 = $sig_name[17]\n";
    if ($sig_num{ALRM}) { 
	print "SIGALRM is $sig_num{ALRM}\n";
    }   

=head1 WARNING

Because this information is not stored within the perl executable
itself it is possible (but unlikely) that the information does not
relate to the actual perl binary which is being used to access it.

The Config module is installed into the architecture and version
specific library directory ($Config{installarchlib}) and it checks the
perl version number when loaded.

=head1 NOTE

This module contains a good example of how to use tie to implement a
cache and an example of how to make a tied variable readonly to those
outside of it.

=cut


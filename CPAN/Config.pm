
# This is CPAN.pm's systemwide configuration file.  This file provides
# defaults for users, and the values can be changed in a per-user configuration
# file. The user-config file is being looked for as ~/.cpan/CPAN/MyConfig.pm.

$CPAN::Config = {
  'build_cache' => q[10],
  'build_dir' => q[f:/home/.cpan/build],
  'cpan_home' => q[f:/home/.cpan],
  'ftp' => q[d:\tcpip\bin/ftp],
  'ftp_proxy' => q[],
  'gzip' => q[F:\UTILS/gzip],
  'http_proxy' => q[],
  'inactivity_timeout' => q[0],
  'index_expire' => q[1],
  'inhibit_startup_message' => q[0],
  'keep_source_where' => q[f:/home/.cpan/sources],
  'lynx' => q[F:\EMX.ADD\BIN/lynx],
  'make' => q[F:\EMX.ADD\BIN/make],
  'make_arg' => q[],
  'make_install_arg' => q[],
  'makepl_arg' => q[],
  'no_proxy' => q[],
  'pager' => q[F:\UTILS/less],
  'shell' => q[],
  'tar' => q[F:\UTILS/tar],
  'unzip' => q[F:\UTILS/unzip],
  'urllist' => [q[ftp://ftp.digital.com/pub/plan/perl/CPAN/], q[ftp://ftp.funet.fi/pub/languages/perl/CPAN/]],
  'wait_list' => [q[wait://ls6.informatik.uni-dortmund.de:1404]],
};
1;
__END__

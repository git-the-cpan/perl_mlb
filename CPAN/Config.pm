
# This is CPAN.pm's systemwide configuration file. This file provides
# defaults for users, and the values can be changed in a per-user
# configuration file. The user-config file is being looked for as
# ~/.cpan/CPAN/MyConfig.pm.

$CPAN::Config = {
  'build_cache' => q[50],
  'build_dir' => q[f:/home/.cpan/build],
  'cpan_home' => q[f:/home/.cpan],
  'ftp' => q[d:/tcpip/bin/ftp.exe],
  'ftp_proxy' => q[],
  'getcwd' => q[cwd],
  'gzip' => q[F:/UTILS/gzip.exe],
  'http_proxy' => q[],
  'inactivity_timeout' => q[0],
  'index_expire' => q[1],
  'inhibit_startup_message' => q[0],
  'keep_source_where' => q[f:/home/.cpan/sources],
  'lynx' => q[F:/EMX.ADD/BIN/lynx.exe],
  'make' => q[F:/EMX.ADD/BIN/make.exe],
  'make_arg' => q[],
  'make_install_arg' => q[],
  'makepl_arg' => q[],
  'ncftp' => q[F:/UTILS/ncftp.exe],
  'ncftpget' => q[],
  'no_proxy' => q[],
  'pager' => q[F:/UTILS/less.exe],
  'shell' => q[sh],
  'tar' => q[F:/UTILS/tar.exe],
  'unzip' => q[F:/UTILS/unzip.exe],
  'urllist' => [q[ftp://ftp.metronet.com/pub/perl/], q[ftp://ftp.perl.org/pub/perl/CPAN/], q[ftp://ftp.cdrom.com/pub/perl/CPAN/]],
  'wait_list' => [q[wait://ls6.informatik.uni-dortmund.de:1404]],
};
1;
__END__

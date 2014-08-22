# == Class: phpmyadmin
#
# This class installs and configures phpmyadmin.
# Does _not_ install/configure a webserver nor php.
#
# This works on Debian like systems.
# Puppet Version >= 3.4.0
#
# === Parameters
#
# [*dbuser*]
#   DB User for phpmyadmin control Database.
#   *Optional* (defaults to _pma_)
#
# [*dbpass*]
#   DB password for phpmyadmin control Database.
#   *Optional* (defaults to _password_)
#
# [*dbname*]
#   DB name for phpmyadmin control Database.
#   *Optional* (defaults to _phpmyadmin_)
#
# === Examples
#
# include phpmyadmin
#
# === Authors
#
# Frederik Wagner <wagner@wagit.de>
#
# === Copyright
#
# Copyright 2014 Frederik Wagner
#
class phpmyadmin (
  $dbuser = $phpmyadmin::params::dbuser,
  $dbpass = $phpmyadmin::params::dbpass,
  $dbname = $phpmyadmin::params::dbname,
) inherits phpmyadmin::params {

  contain phpmyadmin::install
  contain phpmyadmin::config

  Class['phpmyadmin::install'] ->
  Class['phpmyadmin::config']

}

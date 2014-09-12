# == Class: phpmyadmin::site
#
# This class installs and configures phpmyadmin site.
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
class phpmyadmin::site {

  include phpmyadmin

  contain phpmyadmin::site::install
  contain phpmyadmin::site::config

  Class['phpmyadmin::site::install'] ->
  Class['phpmyadmin::site::config']

}

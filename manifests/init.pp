# == Class: phpmyadmin
#
# This class only makes parameters available.
# Do _not_ include this class directly.
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

  validate_string($dbuser)
  validate_string($dbpass)
  validate_string($dbname)

  # nothing to do here, only variables defined.

}

# == Class: phpmyadmin::node
#
# For a MySQL server to be managed over PHPMyAadmin, this class
# exports the relvant config snippet for the PHPMyAdmin server.
# It get's collected through the phpmyadmin class.
#
# This works on Debian like systems.
# Puppet Version >= 3.4.0
#
# === Parameters
#
# [*verbose*]
#   Verbose name of server to be shown in phpmyadmin login page.
#   *Optional* (defaults to _$::fqdn_)
#
# [*order*]
#   Order in the selction list on login page.
#   *Optional* (defaults to _10_)
#
# [*create_pmatables*]
#   Shoulde the PHPMyAdmin amangement tables be created?
#   *Optional* (defaults to _true_)
#
# === Examples
#
# include phpmyadmiin::node
#
# === Authors
#
# Frederik Wagner <wagner@wagit.de>
#
# === Copyright
#
# Copyright 2014 Frederik Wagner
#
class phpmyadmin::node (
  $verbose          = $phpmyadmin::node::params::verbose,
  $order            = $phpmyadmin::node::params::order,
  $create_pmatables = $phpmyadmin::node::params::create_pmatables,
) inherits phpmyadmin::node::params {

  validate_string($verbose)
  validate_re($order,'^\d+$')
  validate_bool($create_pmatables)

  include phpmyadmin
  contain phpmyadmin::node::export

  if $create_pmatables {
    contain phpmyadmin::node::create_pmatables
  }

}

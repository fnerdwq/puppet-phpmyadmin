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
  $verbose = $::fqdn,
  $order   = 10,
) {

  @@concat::fragment { "phpmyadmin config NODE - ${::fqdn}":
    target  => '/etc/phpmyadmin/config.inc.php',
    content => template('phpmyadmin/config.inc.php.fragment.erb'),
    order   => $order,
  }


}

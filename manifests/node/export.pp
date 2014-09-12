# (private)
class phpmyadmin::node::export {

  $verbose = $phpmyadmin::node::verbose

  @@concat::fragment { "phpmyadmin config NODE - ${::fqdn}":
    target  => '/etc/phpmyadmin/config.inc.php',
    content => template('phpmyadmin/config.inc.php.fragment.erb'),
    order   => $phpmyadmin::node::order,
  }

}

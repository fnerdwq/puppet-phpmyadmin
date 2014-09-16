# (private)
class phpmyadmin::node::export {

  $verbose   = $phpmyadmin::node::verbose
  $auth_type = $phpmyadmin::node::auth_type
  $user      = $phpmyadmin::node::user
  $password  = $phpmyadmin::node::password

  @@concat::fragment { "phpmyadmin config NODE - ${::fqdn}":
    target  => '/etc/phpmyadmin/config.inc.php',
    content => template('phpmyadmin/config.inc.php.fragment.erb'),
    order   => $phpmyadmin::node::order,
  }

}

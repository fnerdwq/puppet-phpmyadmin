# default node parameters (private)
class phpmyadmin::node::params {

  $verbose          = $::fqdn
  $order            = 10
  $auth_type        = 'cookie'
  $user             = undef
  $password         = undef
  $create_pmauser   = true
  $create_pmatables = true

}

# default node parameters (private)
class phpmyadmin::node::params {

  $verbose          = $::fqdn
  $order            = 10
  $create_pmauser   = true
  $create_pmatables = true

}

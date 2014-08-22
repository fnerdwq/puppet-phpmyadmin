# (private)
class phpmyadmin::config {

  $dbuser = $phpmyadmin::dbuser
  $dbpass = $phpmyadmin::dbpass
  $dbname = $phpmyadmin::dbname

  file {'/etc/phpmyadmin/config-db.php':
    owner   => 'root',
    group   => 'www-data',
    mode    => '0640',
    content => template('phpmyadmin/config-db.php.erb'),
  }

  concat {'/etc/phpmyadmin/config.inc.php':
    ensure => present,
  }

  concat::fragment { 'phpadmin config BEGIN':
    target => '/etc/phpmyadmin/config.inc.php',
    source => 'puppet:///modules/phpmyadmin/config.inc.php.BEGIN',
    order  => '01'
  }
  concat::fragment { 'phpmyadmin config END':
    target => '/etc/phpmyadmin/config.inc.php',
    source => 'puppet:///modules/phpmyadmin/config.inc.php.END',
    order  => '99'
  }

  Concat::Fragment <<| tag == 'phpmyadmin::node' |>>

}

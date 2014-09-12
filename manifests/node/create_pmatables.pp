# (private)
class phpmyadmin::node::create_pmatables {

  # this class needs mysql installed!

  $dbuser = $phpmyadmin::dbuser
  $dbname = $phpmyadmin::dbname

  $mysql_cmd = 'mysql --defaults-extra-file=/root/.my.cnf'
  $sql_dir   = '/var/local/scripts'
  $sql_file  = 'create_tables.sql'

  ensure_resource('file', $sql_dir, {'ensure' => 'directory'})

  file { $sql_file:
    path    => "${sql_dir}/${sql_file}",
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("phpmyadmin/${sql_file}.erb"),
  }

  exec { "mysql ${sql_file}":
    command => "${mysql_cmd} < ${sql_dir}/${sql_file}",
    unless  => "${mysql_cmd} -e 'SHOW DATABASES'|grep -qi '^${dbname}$'",
    path    => ['/bin', '/usr/bin'],
    require => File[$sql_file],
  }

}

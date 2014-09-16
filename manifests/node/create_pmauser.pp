# (private)
class phpmyadmin::node::create_pmauser {

  # this class needs mysql installed!

  $dbuser = $phpmyadmin::dbuser
  $dbpass = $phpmyadmin::dbpass
  $dbname = $phpmyadmin::dbname

# fuer phpMyAdmin, PW: MySql@dm1n

  # this include GRANT USAGE!
  mysql_user {"${dbuser}@%":
    ensure        => present,
    #password_hash => '*3DF3E00E7ED37FE98286F3B3CFCF3BCE5F31BEC8',
    password_hash => mysql_password($dbpass),
  }

  mysql_grant {"${dbuser}@%/mysql.user":
    ensure     => present,
    user       => "${dbuser}@%",
    table      => 'mysql.user',
    privileges => ['SELECT (Host, User, Select_priv, Insert_priv, Update_priv, Delete_priv, Create_priv, Drop_priv, Reload_priv, Shutdown_priv, Process_priv, File_priv, Grant_priv, References_priv, Index_priv, Alter_priv, Show_db_priv, Super_priv, Create_tmp_table_priv, Lock_tables_priv, Execute_priv, Repl_slave_priv, Repl_client_priv)'],
  }

  mysql_grant {"${dbuser}@%/mysql.db":
    ensure     => present,
    user       => "${dbuser}@%",
    table      => 'mysql.db',
    privileges => ['SELECT'],
  }

  mysql_grant {"${dbuser}@%/mysql.tables_priv":
    ensure     => present,
    user       => "${dbuser}@%",
    table      => 'mysql.tables_priv',
    privileges => ['SELECT (Host, Db, User, Table_name, Table_priv, Column_priv)'],
  }

  # starting from MySQL Version 5.6.7 mysql.host ist obsolete
  if $::mysql_version and versioncmp ($::mysql_version, '5.6.7') < 0 {
    mysql_grant {"${dbuser}@%/mysql.host":
      ensure     => present,
      user       => "${dbuser}@%",
      table      => 'mysql.host',
      privileges => ['SELECT'],
    }
  }

  # acces to PHPMyAdmins tables
  mysql_grant {"${dbuser}@%/${dbname}.*":
    ensure     => present,
    user       => "${dbuser}@%",
    table      => "${dbname}.*",
    privileges => ['SELECT','INSERT','UPDATE','DELETE'],
  }

}

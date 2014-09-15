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
    #privileges => ['SELECT (HOST, USER, SELECT_PRIV, INSERT_PRIV, UPDATE_PRIV, DELETE_PRIV, CREATE_PRIV, DROP_PRIV, RELOAD_PRIV, SHUTDOWN_PRIV, PROCESS_PRIV, FILE_PRIV, GRANT_PRIV, REFERENCES_PRIV, INDEX_PRIV, ALTER_PRIV, SHOW_DB_PRIV, SUPER_PRIV, CREATE_TMP_TABLE_PRIV, LOCK_TABLES_PRIV, EXECUTE_PRIV, REPL_SLAVE_PRIV, REPL_CLIENT_PRIV)'],
    privileges => ['SELECT'],
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
    #privileges => ['SELECT (HOST, DB, USER, TABLE_NAME, TABLE_PRIV, COLUMN_PRIV)'],
    privileges => ['SELECT'],
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

require 'digest/sha1'

Puppet::Parser::Functions::newfunction(:mysql_password, :type => :rvalue, :arity => 1, :doc => "Returns a mysql_password (MySQL 4.1 native hashing) value from a provided string.") do |args|
      # MySQL password creation as SHA1(UNHEX(SHA1('...')))
      pw = Digest::SHA1.hexdigest(Digest::SHA1.hexdigest(args[0]).unpack('H*'))
      return "*#{pw}"
end

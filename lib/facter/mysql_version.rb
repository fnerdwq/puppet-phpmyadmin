# return mysql version taken from utility version string
Facter.add(:mysql_version) do
  setcode do
    begin
      match=Facter::Core::Execution.exec('/usr/bin/mysql --version').match(/Distrib\s(.*),/)
      match[1]
    rescue
      nil
    end
  end
end

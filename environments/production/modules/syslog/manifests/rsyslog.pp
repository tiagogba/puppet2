class rsyslog {

  file {'/etc/rsyslog.conf':
  ensure => file,
  source => 'puppet:///modules/syslog/syslog.conf',
}

  service{'syslog':
  ensure => running,
  enable => true,
}


}

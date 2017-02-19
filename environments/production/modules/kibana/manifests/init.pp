class kibana ($kibana_version = '5.2.1') {

staging::deploy { "kibana-${kibana_version}-linux-x86_64.tar.gz":
  source => "https://artifacts.elastic.co/downloads/kibana/kibana-${kibana_version}-linux-x86_64.tar.gz",
  target => '/opt',
}

user{'kibana':
  ensure => 'present',
  shell => '/bin/bash',
}

file{'/usr/lib/systemd/system/kibana.service':
  ensure => file,
  mode => '0644',
  owner => 'root',
  group => 'root',
  source => 'puppet:///modules/kibana/kibana.service',

}

->

service{'kibana':
  ensure => running,
  enable => true,
}


}

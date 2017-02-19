class logstash {

yumrepo { 'logstash-5.x':
  ensure   => 'present',
  baseurl  => 'https://artifacts.elastic.co/packages/5.x/yum',
  descr    => 'Elasticsearch repository for 5.x packages',
  enabled  => '1',
  gpgcheck => '1',
  gpgkey   => 'https://artifacts.elastic.co/GPG-KEY-elasticsearch',
}
 ->
package { 'logstash':
  ensure  => installed,
}
 ->

 file {'/etc/logstash/conf.d/central.conf':
 ensure  => file,
 mode    => '0644',
 owner   => 'root',
 group   => 'root',
 source  => 'puppet:///modules/logstash/central.conf',
}

 ~>
service { 'logstash':
  ensure  => running,
  enable  => true,
}

}

class elasticsearch {

yumrepo { 'elasticsearch-5.x':
  ensure   => 'present',
  baseurl  => 'https://artifacts.elastic.co/packages/5.x/yum',
  descr    => 'Elasticsearch repository for 5.x packages',
  enabled  => '1',
  gpgcheck => '1',
  gpgkey   => 'https://artifacts.elastic.co/GPG-KEY-elasticsearch',
}

package { 'elasticsearch':
  ensure  => installed,
}

service { 'elasticsearch':
  ensure  => running,
  enable  => true,
  require => Package['elasticsearch'],
}

}

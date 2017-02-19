
class role::logserver {

  include profile::java::jre
  include profile::elasticsearch
  include profile::logstash
  include profile::kibana
 
  Class['profile::java::jre'] -> Class['profile::elasticsearch']
  Class['profile::elasticsearch'] -> Class['profile::logstash']
  Class['profile::logstash'] -> Class['profile::kibana']
}

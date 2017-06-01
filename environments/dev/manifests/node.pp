node default {

  include apache
  include firewall
  include apache::mod::php

  notify { "Hello world!": message => "I am in the ${environment} environment"}

  apache::vhost {'dave.com':
    port    => 80,
    docroot => '/vagrant/app',
    #custom_fragment => 'AddType application/x-httpd-php .php',
  }
  #file { 'puppet.conf':
  #  path   => '/etc/puppetlabs/puppet/puppet.conf',
  #  ensure => file,
  #  content => template('puppet/puppet.conf.erb'),
  #}
  firewall { '000 accept port 80/tcp':
    dport  => [80],
    proto  => tcp,
    action => accept,
  #  require => File ['puppet.conf'],
  }
}

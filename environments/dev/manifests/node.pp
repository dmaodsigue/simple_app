node default {

  include apache
  include firewall
  include apache::mod::php

  notify { "Hello world!": message => "I am in the ${environment} environment"}

  apache::vhost {'dave.com':
    port    => 80,
    docroot => '/vagrant/app',
  }
  firewall { '000 accept port 80/tcp':
    dport  => [80],
    proto  => tcp,
    action => accept,
  }
  package { 'vim':
    ensure => 'installed'
  }
}

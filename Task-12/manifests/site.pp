# /etc/puppet/manifests/site.pp

node default {

package { 'nginx':
        ensure=>'installed'
}

notify { 'Nginx is installed.':
}

service { 'nginx':
        ensure=>'running'
}

notify { 'Nginx is running.':
}

  include '::mysql::server'
  mysql::db { 'test1_mdb':
  user     => 'test1_user',
  password => 'Pa$$w0rd',
  host     => 'localhost',
  grant    => ['ALL'],
}
  
}

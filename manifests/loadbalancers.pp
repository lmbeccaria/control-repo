node 'node4' {

  include ::haproxy
  
  haproxy::listen { 'lb-01':
    collect_exported => false,
    ipaddress        => $::ipaddress,
    ports            => '80',
  }
  
  haproxy::balancermember { 'node1':
    listening_service => 'lb-01',
    server_names      => 'node1.codespaces.io',
    ipaddresses       => '172.18.0.4',
    ports             => '8080',
    options           => 'check',
  }
  
  haproxy::balancermember { 'node2':
    listening_service => 'lb-01',
    server_names      => 'node2.codespaces.io',
    ipaddresses       => '172.18.0.5',
    ports             => '8080',
    options           => 'check',
  }

}
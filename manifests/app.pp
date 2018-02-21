node 'node1' {
    include base
    
    class { '::tomcat' :
        user    => 'tomcat',
        group   => 'root',
        xms     => '60m',
        xmx     => '120m',
        service_state   => 'stopped',
    }
    
    tomcat::deploy { "sysfoo":
        # deploy_url      => "https://3-122260486-gh.circle-artifacts.com/0/tmp/circle-artifacts.8hsrwKe/sysfoo.war",
        # checksum_value  => "8b68b71a1d1f8274e27d1ea83a46a56e"
        deploy_url      => "https://1-122260486-gh.circle-artifacts.com/0/tmp/circle-artifacts.pVnnnJ3/sysfoo.war",
        checksum_value  => "69b3e62429838c3fd742f4dcdd08795e",
    }
    
}

node 'node2' {

    include base

    class { '::tomcat' :
        user    => 'tomcat',
        group   => 'tomcat',
        xms     => '70m',
        xmx     => '130m',
        service_state   => 'running',
    }
    
    tomcat::deploy { "sysfoo":
        deploy_url      => "https://3-122260486-gh.circle-artifacts.com/0/tmp/circle-artifacts.8hsrwKe/sysfoo.war",
        checksum_value  => "8b68b71a1d1f8274e27d1ea83a46a56e",
    }
}
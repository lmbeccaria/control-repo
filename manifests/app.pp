node 'node3' {
    
    class { '::tomcat' :
        user    => 'tomcat',
        group   => 'root',
        xms     => '60m',
        xmx     => '120m',
        service_state   => 'stopped',
    }
    
    tomcat::deploy { "sysfoo":
        deploy_url      => "https://1-122260486-gh.circle-artifacts.com/0/tmp/circle-artifacts.pVnnnJ3/sysfoo.war",
        checksum_value  => "69b3e62429838c3fd742f4dcdd08795e",
    }
    
}

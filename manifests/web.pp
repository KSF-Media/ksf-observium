class ksf-observium::web {

    file { '/usr/lib/observium_agent/local/apache':
        ensure => file,
        mode => 755,
        source => 'puppet:///modules/ksf-observium/apache'
    }

}

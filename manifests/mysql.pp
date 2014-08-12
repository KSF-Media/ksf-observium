class ksf-observium::mysql {

    file { '/usr/lib/observium_agent/local/mysql':
        ensure => file,
        mode => 755,
        source => 'puppet:///modules/ksf-observium/mysql'
    }
    file { '/usr/lib/observium_agent/local/mysql.cnf':
        ensure => file,
        mode => 755,
        source => 'puppet:///modules/ksf-observium/mysql.cnf'
    }

    package { 'php5-cli':
        ensure => installed
    }

    package { 'php5-mysql':
        ensure => installed,
    }


}

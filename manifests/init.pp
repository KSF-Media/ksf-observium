class ksf-observium {

    package { 'snmpd':
        ensure => installed
    }

    file { '/etc/default/snmpd':
        ensure => file,
        require => Package['snmpd'],
        source => 'puppet:///modules/ksf-observium/snmpd-default'
    }

    file { '/etc/snmp/snmpd.conf':
        ensure => file,
        require => Package['snmpd'],
        source => 'puppet:///modules/ksf-observium/snmpd.conf'
    }

    file { '/usr/bin/distro':
        ensure => file,
        require => Package['snmpd'],
        source => 'puppet:///modules/ksf-observium/distro'
    }

    service { 'snmpd':
        ensure => running,
        enable => true,
        subscribe => File['/etc/snmp/snmpd.conf']
    }

    package { 'xinetd':
        ensure => installed
    }

    file { '/etc/xinetd.d/observium_agent':
        ensure => file,
        require => Package['xinetd'],
        source => 'puppet:///modules/ksf-observium/xinetd.d-observium_agent'

    }

    file { '/usr/bin/observium_agent':
        ensure => file,
        require => Package['xinetd'],
        mode => 755,
        source => 'puppet:///modules/ksf-observium/observium_agent'
    }

    service { 'xinetd':
        ensure => running,
        enable => true,
        subscribe => File['/etc/xinetd.d/observium_agent']
    }
    file { '/usr/lib/observium_agent':
        ensure => 'directory',
    }
    file { '/usr/lib/observium_agent/local':
        ensure => 'directory',
    }

}

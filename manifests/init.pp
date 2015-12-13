class influxdb (
    String $package_source = 'default',
) inherits influxdb::params {

    case $package_source {
        default: {
            package { $package_name:
                ensure => installed,
            }
        }
        'web': {
            ensure_packages(['wget'])

            exec { 'Download InfluxDB Package':
                command => "wget ${package_url} -P /tmp",
                creates => "/tmp/${source}",
                path    => '/usr/local/bin/:/bin/',
                require => Package['wget'],
            }

            package { $package_name:
                ensure   => installed,
                provider => $provider,
                require  => Exec['Download InfluxDB Package'],
                source   => "/tmp/${source}",
            }
        }
    }

    #file { $config_file:
    #    ensure  => present,
    #    content => epp("${module_name}${config_file}.epp"),
    #    require => Package[$package_name],
    #}

    service { $service_name:
        ensure    => running,
        enable    => true,
        require   => Package[$package_name],
        #subscribe => File[$config_file],
    }

}

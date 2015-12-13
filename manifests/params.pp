class influxdb::params {

    $package_location = 'https://s3.amazonaws.com'
    $package_name     = 'influxdb'
    $package_version  = '0.9.6.1'
    $service_name     = 'influxd'

    case $::osfamily {
        default: {
            fail("${::osfamily} is not supported.")
        }
        'Debian': {
            $provider = 'deb'
            $source   = "${package_name}_${package_version}_amd64.deb"
        }
        'RedHat': {
            $provider = 'rpm'
            $source   = "${package_name}-${package_version}-1.x86_64.rpm"

        }
    }

    #$config_file = '/opt/chronograf/config.toml'
    $package_url = "${package_location}/${package_name}/${source}"

}

# influxdb

## Module Description

[InfluxDB](https://influxdata.com/time-series-platform/influxdb) is an open source database written in Go specifically to handle time series data with high availability and performance requirements. InfluxDB installs in minutes without external dependencies, yet is flexible and scalable enough for complex deployments. This module installs InfluxDB and provides the ability to customise the configuration. This module aims to be generic and simple.

## Setup

*What the influxdb Puppet module affects:*

* Package installation
* Service management
* Configuration files

## Usage

```
include influxdb
```

This will simply call the package as a standard resource and thus assumes you have configured a repository that contains the package, be it your own or a third party. For most production environments this assumption should be appropriate as external access is often restricted.

If you do not have such restrictions and do not want to configure a repository you can simply request that the package be fetched from the internet:

```
class { 'influxdb':
    package_source => 'web',
}
```

### Hiera Support

It is recommended that Hiera is used, but not required. Below is an example configuration:

*site.pp*

```
hiera_include('classes', [])
```

*mynode.example.org.yaml*

```
clases:
    - influxdb

influxdb::package_source: web
```

## Reference

### Classes

Class: `influxdb`

Guides the basic setup and installation of InfluxDB on your system.

When this class is declared with the default options, Puppet:

* Installs the appropriate InfluxDB software package for your operating system (assumes you have a repository configured).
* Places the required configuration files in a directory, with the default location determined by your operating system.
* Starts the InfluxDB service.

*Paramters within `influxdb`:*

`package_source`
Determines how to install the package. Valid options: undef, 'web'. Default: undef

## Limitations

### Puppet Future Parser

This module is written using features that are found in the future parser and is not backwards compatible.

## Development

### Contributing

Please feel free to fork this module, make the appropriate changes in a feature branch, and submit a pull request.

### Running Tests

TBD

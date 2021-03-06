# == Class: Kibana4
#
# Installs and configures Kibana4.
#
# === Parameters
# [*ensure*]
# Should the service be started. Valid values are stopped (false) and running (true)
#
# [*enable*]
# Should the service be enabled on boot. Valid values are true, false, and manual.
#
# [*version*]
# Version of Kibana4 that gets installed.
# Defaults to the latest 4.0.0 version available at the time of module release.
#
# [*install_method*]
# Set to 'archive' to download kibana from the supplied download_url.
# Set to 'package' to use the default package manager for installation.
# Defaults to 'archive'.
#
# [*download_url*]
# URL to download kibana from iff install_method is 'archive'
# Defaults to "https://download.elasticsearch.org/kibana/kibana/kibana-${version}.tar.gz"
#
# [*install_dir*]
# Installation directory used iff install_method is 'archive'
# Defaults to '/opt'.
#
# [*install_method*]
# Only the "archive" method is supported at the moment
#
# [*symlink*]
# Determines if a symlink should be created in the installation directory for
# the extracted archive. Only used if install_method is 'archive'.
# Defaults to 'true'.
#
# [*symlink_name*]
# Sets the name to be used for the symlink. The default is '${install_dir}/kibana'.
# Only used if install_method is 'archive'.
#
# [*kibana4_user*]
# The user that will run the service. For now installation directory is still owned by root.
#
# [*kibana4_group*]
# The primary group of the kibana user
#
#
# === Examples
#
#  class { '::kibana4':
#    version         => '4.0.0',
#    install_method  => 'package',
#  }
#
class kibana4 (
  $download_url                = "https://download.elasticsearch.org/kibana/kibana/kibana-${version}.tar.gz",
  $create_user                 = $kibana4::params::create_user,
  $ensure                      = $kibana4::params::ensure,
  $enable                      = $kibana4::params::enable,
  $kibana4_group               = $kibana4::params::kibana_group,
  $kibana4_gid                 = $kibana4::params::kibana_gid,
  $kibana4_user                = $kibana4::params::kibana_user,
  $kibana4_uid                 = $kibana4::params::kibana_uid,
  $install_dir                 = $kibana4::params::install_dir,
  $install_method              = $kibana4::params::install_method,
  $symlink                     = $kibana4::params::symlink,
  $symlink_name                = "${install_dir}/kibana4",
  $version                     = $kibana4::params::version,
  $port                        = $kibana4::params::port,
  $host                        = $kibana4::params::host,
  $elasticsearch_url           = $kibana4::params::elasticsearch_url,
  $elasticsearch_preserve_host = $kibana4::params::elasticsearch_preserve_host,
  $kibana_index                = $kibana4::params::kibana_index,
  $default_app_id              = $kibana4::params::default_app_id,
  $request_timeout             = $kibana4::params::request_timeout,
  $shard_timeout               = $kibana4::params::shard_timeout,
  $verify_ssl                  = $kibana4::params::verify_ssl,
  $ca                          = $kibana4::params::ca,
  $ssl_key_file                = $kibana4::params::ssl_key_file,
  $ssl_cert_file               = $kibana4::params::ssl_cert_file,
  $pid_file                    = $kibana4::params::pid_file,
  $bundled_plugin_ids          = $kibana4::params::bundled_plugin_ids,
) inherits kibana4::params {

  class {'kibana4::user': }->
  class {'kibana4::install': }->
  class {'kibana4::config': }->
  class {'kibana4::service': }

}

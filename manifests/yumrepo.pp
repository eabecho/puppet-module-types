# == Define: types::package
#
define types::yumrepo (
  $ensure            = 'present',
  $baseurl           = undef,
  $descr             = undef,
  $enabled           = undef,
  $gpgcakey          = undef,
  $gpgcheck          = undef,
  $gpgkey            = undef,
  $mirrorlist        = undef,
  $proxy             = undef,
  $proxy_password    = undef,
  $proxy_username    = undef,
) {

  validate_re($ensure, '^(present)|(absent)$',
    "types::yumrepo::${name}::ensure is invalid and does not match the regex.")

  if $enable != undef {
    if is_string($enable) {
      validate_re($enable, '^(true|false|absent)$',
        "types::yumrepo::${name}::enable can only be <true>, <false> or <absent> and is set to <${enable}>")
    } else {
      validate_bool($enable)
    }
  }
  if $gpgcheck != undef {
    if is_string($gpgcheck) {
      validate_re($gpgcheck, '^(true|false|absent)$',
        "types::yumrepo::${name}::gpgcheck can only be <true>, <false> or <absent> and is set to <${enable}>")
    } else {
      validate_bool($gpgcheck)
    }
  }

  yumrepo { $name:
    ensure         => $ensure,
    baseurl        => $baseurl,
    descr          => $descr,
    enabled        => $enabled,
    gpgcakey       => $gpgcakey,
    gpgcheck       => $gpgcheck,
    gpgkey         => $gpgkey,
    mirrorlist     => $mirrorlist,
    proxy          => $proxy,
    proxy_password => $proxy_password,
    proxy_username => $proxy_username,
  }
}

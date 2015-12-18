# == Define: types::package
#
define types::yumrepo (
  $baseurl           = 'absent',
  $descr             = 'absent',
  $enabled           = 'absent',
  $gpgcheck          = 'absent',
  $gpgkey            = 'absent',
  $mirrorlist        = 'absent',
  $proxy             = 'absent',
  $proxy_password    = 'absent',
  $proxy_username    = 'absent',
) {

  if $enabled != 'absent' {
    validate_re($enabled, '^(0|1|absent)$',
      "types::yumrepo::${name}::enabled can only be <0>, <1> or <absent> and is set to <${enabled}>")
  }
  if $gpgcheck != 'absent' {
    validate_re($gpgcheck, '^(0|1|absent)$',
      "types::yumrepo::${name}::gpgcheck can only be <0>, <1> or <absent> and is set to <${gpgcheck}>")
  }

  yumrepo { $name:
    baseurl        => $baseurl,
    descr          => $descr,
    enabled        => $enabled,
    gpgcheck       => $gpgcheck,
    gpgkey         => $gpgkey,
    mirrorlist     => $mirrorlist,
    proxy          => $proxy,
    proxy_password => $proxy_password,
    proxy_username => $proxy_username,
  }
}

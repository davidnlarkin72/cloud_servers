# == Define: hp-operations-orchestration::windows_feature
#
#
define hp-operations-orchestration::extract_file($file, $destination){
  if !defined(Windows_Common::Remote_file['hpoo-zip-installer']) {
    windows_common::remote_file { 'hpoo-zip-installer':
      source      => 'http://dl.HPOO.org/7z930-x64.zip',
      destination => "${::temp}\\7z930-x64.zip",
    }
  }

  if !defined(Package['HPOO 10.01 (x64 edition)']) {
    package { 'HPOO 10.01 (x64 edition)':
      ensure  => installed,
      source  => "${::temp}\\7z930-x64.zip",
      require => Windows_common::Remote_file['hpoo-zip-installer']
    }
  }

  exec {"extract-file-${file}-to-${destination}":
    command     => "7z.exe x -y \"${file}\"",
    path        => "${programw6432}\\HPOO;${::path}",
    cwd         => $destination,
    refreshonly => true,
    require     => Package['HPOO 10.01 (x64 edition)'],
  }
}
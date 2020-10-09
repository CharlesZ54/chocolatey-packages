$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'wireguard'
  fileType       = 'msi'
  softwareName   = 'WireGuard'
  
  checksum64	 = '1bba81cc4e95bf09fcd1d1d63afa0ec19ed204407aee770dcce647e3c3b04262'
  checksum32     = 'cc6f49c8f16dcba3d6998dbfdeb0835e5cc1240a59b92959fef82243c4e03df8'
  checksumType   = 'sha256'
  url64bit          = 'https://download.wireguard.com/windows-client/wireguard-amd64-0.1.0.msi'
  url			 = 'https://download.wireguard.com/windows-client/wireguard-x86-0.1.0.msi'

  silentArgs     = '/qn /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs

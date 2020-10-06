$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'wireguard'
  fileType       = 'msi'
  softwareName   = 'WireGuard'
  
  checksum64	 = 'f00dcbe7f1ef225a834af5e70d90ebe2ef9da4d016afc5ede1b135c708f8134c'
  checksum32     = 'efb92345d489627ac9014dfcaa1b2323e227a2835d9b7468d9a3c4f9d6b4fcae'
  checksumType   = 'sha256'
  url64bit          = 'https://download.wireguard.com/windows-client/wireguard-amd64-0.1.1.msi'
  url			 = 'https://download.wireguard.com/windows-client/wireguard-x86-0.1.1.msi'

  silentArgs     = '/qn /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs

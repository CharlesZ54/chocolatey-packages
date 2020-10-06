import-module au

$releases = 'https://download.wireguard.com/windows-client/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.url)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.url64bit)'"
            "(?i)(^\s*checksum32\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing #1
     $url32     = $download_page.links | ? href -match '.msi$' | select -Last 1 -expand href #2
	 $url64		= $url32 -replace 'x86', 'amd64'
     $version = $url32 -split '-|.msi' | select -Last 1 -Skip 1 #3

     @{  
		Version = $version;
		url = $releases+$url32;
		url64bit = $releases+$url64;
	  }
}

update
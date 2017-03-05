﻿Param(
  [string]$newVersion
)

$file = "$PSScriptRoot\Templates\HomeSeerTemplates\source.extension.vsixmanifest"

[xml]$xml = get-content -Path $file

if ($newVersion -eq "") {
    $version = [System.Version]::Parse($xml.PackageManifest.Metadata.Identity.Version)

    $newVersion = "$($version.Major).$($version.Minor).$($version.Build + 1)"
}

$xml.PackageManifest.Metadata.Identity.Version = $newVersion

$xml.Save($file)

"Updated $file to $newVersion"
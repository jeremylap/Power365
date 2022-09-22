Param
(
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [string]$environment
)

"Exporting portal for env " + $environment
"====================================="

$portalId = ""
pac auth select -n nomprojet-$environment

if (Test-Path portal) {
    Remove-Item -Force -Recurse portal
}

pac paportal download --websiteId $portalId -p portal
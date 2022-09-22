Param
(
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [string]$environment
)        
$ErrorActionPreference = "Stop"

"Deploying portal to $environment"

if ($environment -notin ("prod", "preprod", "dev", "recette")) {
  throw "Environment must be one of prod, preprod or dev"
}

$path = "portal\nomprojet-dev---nomprojet-dev"
Copy-Item -Force -Recurse .\alm\deployment-profiles $path

pac auth select -n nomprojet-$environment

pac paportal upload --path $path --deploymentProfile $environment

$webAppIps=$(az webapp show -g $rg -n $webAppName --query possibleOutboundIpAddresses -o tsv).Split(',')
$functionAppIps=$(az functionapp show -g $rg -n $functionAppName --query possibleOutboundIpAddresses -o tsv).Split(',')

$appServiceIps = $webAppIps + $functionAppIps

# TODO - use vnet integration instead   
foreach ($appServiceIp in $appServiceIps) {
    echo "Adding firewall rule for app service IP $appServiceIp"
    az sql server firewall-rule create `
    -g $rg -s $sqlServerName -n "appservice-$appServiceIp" `
    --start-ip-address $appServiceIp --end-ip-address $appServiceIp
}
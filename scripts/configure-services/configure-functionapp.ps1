
$connectionStringTemplate=$(az sql db show-connection-string --server $sqlServerName --client ado.net -o tsv)
$connectionString=$connectionStringTemplate.Replace('<databasename>', $sqlDatabaseName).Replace('<username>', $sqlUserName).Replace('<password>', $sqlPassword)

$serviceBusConnectionString=$(az servicebus namespace authorization-rule keys list -n RootManageSharedAccessKey -g $rg  --query primaryConnectionString -o tsv --namespace-name $serviceBusName)
$signalRConnectionString=$(az signalr key list -g $rg --query primaryConnectionString -o tsv -n $signalrName)

az functionapp config appsettings set `
  -g $rg -n $functionAppName `
  --settings "SignalRConnectionString=$signalRConnectionString" "ServiceBusConnectionString=$serviceBusConnectionString" "SqlServerConnectionString=$connectionString"

# CORS
az functionapp update `
  -g $rg -n $functionAppName `
  --set siteConfig.cors.supportCredentials=true

$webAppHost=$(az webapp show -g $rg -n $webAppName --query defaultHostName -o tsv)
$webAppUrl="https://$webAppHost"

az functionapp cors add `
  -g $rg -n $functionAppName `
   --allowed-origins $webAppUrl

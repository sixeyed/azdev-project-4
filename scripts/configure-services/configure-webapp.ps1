
$connectionStringTemplate=$(az sql db show-connection-string --server $sqlServerName --client ado.net -o tsv)
$connectionString=$connectionStringTemplate.Replace('<databasename>', $sqlDatabaseName).Replace('<username>', $sqlUserName).Replace('<password>', $sqlPassword)

$serviceBusConnectionString=$(az servicebus namespace authorization-rule keys list -n RootManageSharedAccessKey -g $rg  --query primaryConnectionString -o tsv --namespace-name $serviceBusName)

$functionAppHost=$(az functionapp show -g $rg -n $functionAppName --query defaultHostName -o tsv)
$functionsConnectionString="https://$functionAppHost/api"

az webapp config appsettings set `
  -g $rg -n $webAppName `
  --settings "ConnectionStrings:Functions=$functionsConnectionString" "ConnectionStrings:ServiceBus=$serviceBusConnectionString" "ConnectionStrings:ToDoDb=$connectionString"

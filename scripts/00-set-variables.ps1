# variables
$environmentName = if ($env:ENVIRONMENT_NAME) { $env:ENVIRONMENT_NAME } else { 'dev' };
$appPlanSku = if ($env:APP_PLAN_SKU) { $env:APP_PLAN_SKU } else { 'B1' }
$appPlanWorkerCount = if ($env:APP_PLAN_WORKER_COUNT) { $env:APP_PLAN_WORKER_COUNT } else { '1' }
$sqlDatabaseComputeModel = if ($env:SQL_DB_COMPUTE_MODEL) { $env:SQL_DB_COMPUTE_MODEL } else { 'Serverless' }
$sqlDatabaseMaxSize = if ($env:SQL_DB_MAX_SIZE) { $env:SQL_DB_MAX_SIZE } else { '1GB' }
$sqlDatabaseCapacity = if ($env:SQL_DB_CAPACITY) { $env:SQL_DB_CAPACITY } else { '1' }

# core
$projectName="proj4todo$environmentName"
$rg="rg-$($projectName)"
$location='westus'

# sql server
$sqlServerName="sql$($projectName)"
$sqlUserName='sqluser'
$sqlPassword=$env:LAB_PASSWORD

# sql database
$sqlDatabaseName="sqldb-$($projectName)"
$sqlDatabaseEdition='GeneralPurpose'
$sqlDatabaseFamily='Gen5'

# webapp
$appPlanName="asp-$($projectName)"
$webAppName="web$($projectName)"

#d eployment
$projectGitHubUrl='https://github.com/sixeyed/azdev-project-4.git'
$projectGitBranch='main'
$projectGitHubToken=$env:GH_TOKEN

# keyvault
$keyVaultName="kv$($projectName)"

# servicebus:
$serviceBusName="sb$($projectName)"
# TODO - tier, need Premium for vnet integration

# vnet:
$vnetName="vn$($projectName)"
$vnetSubnetName='app'

# signalr:
$signalrName="sr$($projectName)"
$signalrSku='Standard_S1'

# functions:
$functionAppName="fn$($projectName)"
$functionStorageName="fnsa$($projectName)"
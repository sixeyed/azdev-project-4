
. ./secrets.ps1
. ./00-set-variables.ps1

# core 
./create-core/01_create-rg.ps1
./create-core/02_create-vnet.ps1

# infra & app
./create-services/create-servicebus.ps1
./create-services/create-sql.ps1
./create-services/create-signalr.ps1
./create-services/create-webapp.ps1
./create-services/create-functions.ps1

# configuration
./configure-services/configure-functionapp.ps1
./configure-services/configure-sql.ps1
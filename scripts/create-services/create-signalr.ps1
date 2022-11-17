
az signalr create `
  -g $rg -n $signalrName -l $location `
  --service-mode Serverless --sku $signalrSku

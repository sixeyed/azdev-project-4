
echo "Creating function app storage: $functionStorageName"

az storage account create `
  -l $location -g $rg -n $functionStorageName `
  --sku Standard_LRS `

echo "Creating function app: $functionAppName"

az functionapp create `
  -g $rg -n $functionAppName `
  --runtime dotnet --functions-version 4 `
  --consumption-plan-location $location `
  --storage-account $functionStorageName

echo "Configuring function app deployment from: $projectGitBranch branch; $webAppGitUrl"

az functionapp config appsettings set `
  -g $rg -n $functionAppName `
  --settings PROJECT='functions/TodoList.Functions/ToDoList.csproj' DEPLOYMENT_BRANCH=$projectGitBranch

az functionapp deployment source config `
  -g $rg -n $functionAppName `
  --branch $projectGitBranch `
  --repo-url $projectGitHubUrl `
  --git-token $projectGitHubToken

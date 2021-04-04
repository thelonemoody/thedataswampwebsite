param project string 
param env string 

var app = 'cdb'
var name = concat(app, project, env)


resource cosmos 'Microsoft.DocumentDB/databaseAccounts@2020-06-01-preview' = {
  name: name
  location: resourceGroup().location
  properties:{
    createMode: 'Default'
    databaseAccountOfferType: 'Standard'
    locations: [
                 {
                  locationName: resourceGroup().location
                 }
      ]
    enableFreeTier: true  
    }
  }

resource cosmosDb 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2020-06-01-preview' = {
  name: '${cosmos.name}/Database'
  properties: {
    resource: {
      id: 'Database'
    }
    options: {}
  }
}

resource cosmosContainer 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2020-06-01-preview' = {
  name: '${cosmosDb.name}/Items'
  properties: {
    resource: {
      id: 'Items'
     }
     options:{}
    }
  }



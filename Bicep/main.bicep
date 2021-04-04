
param project string = 'thedataswamp' 
param env string = 'dev'

module stg './cosmos.bicep' = {
  name: 'storageDeploy'
  params: {
    project: project
    env: env

  }
}



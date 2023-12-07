param acrName string 
param location string 
param appServicePlanName string



module registry './ResourceModules-main/modules/container-registry/registry/main.bicep' = {
  name: acrName
  params: {
    name: acrName
    location: location
    acrAdminUserEnabled: true
  }
}


module serverfarm './ResourceModules-main/modules/web/serverfarm/main.bicep' = {
  name: '${appServicePlanName}-deploy'
  params: {
    name: appServicePlanName
    location: location
    sku: {
      capacity: 1
      family: 'B'
      name: 'B1'
      size: 'B1'
      tier: 'Basic'
    }
    reserved: true
  }
}

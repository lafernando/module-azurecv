# Ballerina Azure CV Service Connector

This connector allows to use the Azure CV service through Ballerina. The following section provide you the details on connector operations.

## Compatibility
| Ballerina Language Version 
| -------------------------- 
| 0.991.0                    


The following sections provide you with information on how to use the Azure CV Service Connector.

- [Contribute To Develop](#contribute-to-develop)
- [Working with Azure CV Service Connector actions](#working-with-azure-cv-service-connector)
- [Sample](#sample)

### Contribute To develop

Clone the repository by running the following command 
```shell
git clone https://github.com/lafernando/module-azurecv.git
```

### Working with Azure CV Service Connector

First, import the `wso2/azurecv` module into the Ballerina project.

```ballerina
import wso2/azurecv;
```

In order for you to use the Azure CV Service Connector, first you need to create an Azure CV Service Connector client.

```ballerina
azurecv:Configuration config = {
    key: config:getAsString("KEY")
};

azurecv:Client cvClient = new(config);
```

##### Sample

```ballerina
import ballerina/config;
import ballerina/io;
import wso2/azurecv;

azurecv:Configuration config = {
    key: config:getAsString("KEY"),
    region: "eastus"
};

azurecv:Client cvClient = new(config);

public function main(string... args) {
    var result = cvClient->ocr("https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Atomist_quote_from_Democritus.png/338px-Atomist_quote_from_Democritus.png");
    io:println(result);
}
```

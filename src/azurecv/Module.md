Connects to Azure CV service through Ballerina.

# Module Overview

## Compatibility
| Ballerina Language Version 
| -------------------------- 
| 1.2.x

## Sample

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

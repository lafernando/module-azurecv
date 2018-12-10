// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/config;
import ballerina/test;
import ballerina/io;

Configuration config = {
    key: config:getAsString("KEY")
};

Client cvClient = new(config);

@test:Config
function testOCR() {
    var result = cvClient->ocr("https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Atomist_quote_from_Democritus.png/338px-Atomist_quote_from_Democritus.png");
    if (result is error) {
        test:assertFail(msg = <string> result.detail().message);
    } else {
        string expected = "NOTHING\nEXISTS\nEXCEPT\nATOMS\nAND EMPTY\nSPACE.\nEverything else\nis opinion.";
        test:assertTrue(result == expected);
    }
}

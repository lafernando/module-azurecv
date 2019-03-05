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

import ballerina/http;
import ballerina/io;

# Object to initialize the connection with Azure CV Service.
public type Client client object {

    string key;
    string region;
    http:Client clientEP;

    public function __init(Configuration config) {
        self.key = config.key;
        self.region = config.region;
        self.clientEP = new("https://" + self.region + ".api.cognitive.microsoft.com/vision/v2.0");
    }

    # Applies Optical Character Recognition (OCR) for the given URL or the image data.
    # 
    # + input - The input value, either a string value, which is an URL, or else, image payload as a byte[]
    # + return - If successful, returns a `string` with the text, else returns an `error` value
    public remote function ocr(string|byte[] input) returns string|error;

};

public remote function Client.ocr(string|byte[] input) returns string|error {
    http:Request req = new;
    req.setHeader("Ocp-Apim-Subscription-Key", self.key);
    if (input is string) {
        req.setJsonPayload({ url: untaint input});
    } else {
        req.setBinaryPayload(input);
    }
    var resp = self.clientEP->post("/ocr?language=unk&detectOrientation=true", req);
    if (resp is http:Response) {
        string text = "";
        json result = check resp.getJsonPayload();
        if (result.regions is ()) {
            error err = error(<string> result.code, { message: <string> result.message });
            return untaint err;
        }
        int regionCount = result.regions.length();
        int i = 0;
        while (i < regionCount) {
            json region = result.regions[i];
            i = i + 1;
            int lineCount = region.lines.length();
            int j = 0;
            while (j < lineCount) {
                if (j > 0) {
                    text = text + "\n";
                }
                json line = region.lines[j];
                j = j + 1;
                int wordCount = line.words.length();
                int k = 0;
                while (k < wordCount) {
                    if (k > 0) {
                        text = text + " ";
                    }
                    text = text + <string> line.words[k].text;
                    k = k + 1;
                }                
            }
        }
        return untaint text;
    } else {
        return resp;
    }
}



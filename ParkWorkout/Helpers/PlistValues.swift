//
//  PlistValues.swift
//  CalendarApp
//
//  Created by Irwin Gonzales on 12/23/20.
//

import Foundation

class PlistValue {
    class func plistValues(bundle: Bundle) -> (testBackendUrl: String, backendUrl: String, baseBackendUrl: String, accessToken: String, tokenUrl: String)? {
        guard
            let path = bundle.path(forResource: "Config", ofType: "plist"),
            let values = NSDictionary(contentsOfFile: path) as? [String: Any]
        else {
            print("Missing Config.plist file with 'TestBackendUrl', 'BackendUrl' & 'BaseBackendUrl' entries in main bundle!")
            return nil
        }

        guard
            let testUrl = values["TestBackendUrl"] as? String,
            let backendUrl = values["BackendUrl"] as? String,
            let baseUrl = values["BaseBackendUrl"] as? String,
            let tokenUrl = values["TokenUrl"] as? String,
            let accessToken = values["AccessToken"] as? String
        else {
            print("Config.plist file at \(path) is missing 'TestBackendUrl','BackendUrl' and/or'BaseBackendUrl' entries!")
            print("File currently has the following entries: \(values)")
            return nil
        }
        return (testBackendUrl: testUrl, backendUrl: backendUrl, baseBackendUrl: baseUrl, accessToken: accessToken, tokenUrl: tokenUrl)
    }
}

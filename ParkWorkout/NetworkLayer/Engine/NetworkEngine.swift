//
//  NetworkEngine.swift
//  CalendarApp
//
//  Created by Irwin Gonzales on 12/23/20.
//

import Foundation

class NetworkEngine {
    class func call(endpoint: Endpoint, method: HttpMethod, body: [String : Any] = [:], queries: [String : Any] = [:], completion: @escaping(Data?, URLResponse?, Error?) -> Void) {
        // getting data
//        guard let tokenId = SessionManager.shared.credentials?.accessToken else { return }
        guard let clientInfo = PlistValue.plistValues(bundle: Bundle.main) else { return }
        let jsonString = body
        let urlString = String(clientInfo.backendUrl + endpoint.rawValue)
        guard let url = URL(string: urlString) else { return }


        // creating url request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
//        urlRequest.setValue("Bearer \(tokenId)", forHTTPHeaderField: "Authorization")

        if !body.isEmpty {
            urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: jsonString, options: [])
        }

        if !queries.isEmpty {
            // Adding params
            let urlComponents = NSURLComponents(string: urlString)
            var items = [URLQueryItem]()

            for (key,value) in queries {
                items.append(URLQueryItem(name: key, value: value as? String))
            }

            items = items.filter{!$0.name.isEmpty}

            if !items.isEmpty {
                urlComponents?.queryItems = items
            } else {
                print("Nothing to query!")
            }
        }

        // sending request off
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard response != nil, let data = data else {
                completion(nil, nil, error)
                print(error?.localizedDescription ?? "Unknown Error")
                return
            }
            guard error == nil else {
                completion(nil, response, error)
                print(error?.localizedDescription ?? "Unknown Error")
                return
            }
            completion(data, response, nil)
            print(String(describing: response))
        }
        dataTask.resume()
    }
}


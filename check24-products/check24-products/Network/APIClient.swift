//
//  APIClient.swift
//  check24-products
//
//  Created by omar on 16/11/2021.
//

import Foundation

class APIClient {
    // URLSession data task method syntax from this link https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift
    
    static func fetchRequest(with path: String,
                             httpMethod: String? = "GET",
                             body: Dictionary<String, Any>? = nil,
                             completion:@escaping (Data?,Error?) -> ()) {
        guard let serviceUrl = URL(string: path) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = httpMethod
        if let body = body {
            guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: []) else { return }
            request.httpBody = httpBody
        }
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let error = error else {
                guard let data = data else {
                    completion(nil, NSError(domain:Constants.emptyDataErrorDomain, code: Constants.emptyDataErrorCode, userInfo:nil))
                    return
                }
                completion(data,nil)
                return
            }
            completion(nil,error)
            
        }
        task.resume()
    }
    
    static func loadImage(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}

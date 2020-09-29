//
//  APIManager.swift
//  MWM
//
//  Created by Fabrice Froehly on 29/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

import Foundation

// MARK: - Connection CRUD operation errors

class APIManager {
    
    private let apiURL: String = "https://europe-west1-mwm-sandbox.cloudfunctions.net/"
    static let shared = APIManager()
    
    private init() {}
    
    // MARK: - Object serialization

    
    //APPError enum which shows all possible errors
    enum APPError: Error {
        case networkError(Error)
        case dataNotFound
        case jsonParsingError(Error)
        case invalidStatusCode(Int)
    }
    
    //Result enum to show success or failure
    enum Result<T> {
        case success(T)
        case failure(APPError)
    }
    
    //dataRequest which sends request to given URL and convert to Decodable Object
    
    func request<T: Codable>(urlString: String, httpMethodType: String, urlParams: [String: String], params: [String: Any]? = nil, completionHandler: @escaping (_ object: T?) -> Void, errorHandler: ((Error?) -> Void)?) {
        
        guard let url: URL = URL(string: apiURL + urlString) else {
            print("Error - APIManager - Could not generate URL for: \(urlString)")
            errorHandler?(nil)
            return
        }
        
        let session = URLSession.shared
        var request: URLRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 20)
        request.httpMethod = httpMethodType
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let decoder = JSONDecoder()
                if let data: Data = data {
                    let decodedData: T = try decoder.decode(T.self, from: data)
                    completionHandler(decodedData);
                } else {
                    print("Error - APIManager - Data is corrupted for URL: \(urlString)")
                    errorHandler?(nil)
                }
            } catch {
                print("Error - APIManager - Request couldnt be done for URL: \(urlString)")
                errorHandler?(error)
            }
        })
        task.resume()
    }
}

// MARK: - Extension to encode class into dictionary

extension Encodable {
    
    func asDictionary() throws -> [String: Any] {
        
        let data = try JSONEncoder().encode(self)
        
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}

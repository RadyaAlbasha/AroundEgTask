//
//  NetworkManager.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 24/01/2025.
//

import Alamofire
import Combine

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<T: Codable>(_ url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, headers: HTTPHeaders? = nil) -> AnyPublisher<T, Error> {
        return Future<T, Error> { promise in
            AF.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success(let data):
                        if let jsonData = data as? [String: Any] {
                            // Handle the JSON data here (it will be a dictionary)
                            print("Response JSON: \(jsonData)")
                        } else {
                            print("Failed to cast response to JSON dictionary.")
                        }
                        
                    case .failure(let error):
                        print("Request failed with error: \(error)")
                        // Handle failure (e.g., network error, invalid response)
                    }
                }
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let data):
                        promise(.success(data))
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }
        }
        .receive(on: DispatchQueue.global(qos: .userInitiated))
        .eraseToAnyPublisher()
    }
}

//
//  ApiProvider.swift
//  Testing
//
//  Created by Ahmad Nur Alifullah on 07/04/23.
//

import Foundation
import Alamofire

class ApiProvider {
  static let shared: ApiProvider = ApiProvider()
  private init() { }
  
  func get(url: String, parameter: [String: Any], completion: @escaping (Result<Data, Error>) -> Void) {
    AF.request(
      url,
      method: .get,
      parameters: parameter,
      encoding: URLEncoding.default
    ).responseData { response in
      switch response.result {
      case .success(let data):
        completion(.success(data))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}

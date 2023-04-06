//
//  RAWGProvider.swift
//  Testing
//
//  Created by Ahmad Nur Alifullah on 07/04/23.
//

import Foundation

public let baseUrl = "https://api.rawg.io/api/games"

public var apiKey: String {
  get {
    guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist") else {
      fatalError("Couldn't find file 'Info.plist'.")
    }
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "API_KEY") as? String else {
      fatalError("Couldn't find key 'API_KEY' in 'Info.plist'.")
    }
    return value
  }
}

final class RawgProvider {
  static let shared: RawgProvider = RawgProvider()
  private init() { }
    let result: Observable<[ResultRawg]?> = Observable(nil)
    
  func getGames(pageSize: Int, completion: @escaping (Result<[ResultRawg], Error>) -> Void) {
    let parameterGetGames: [String: Any] = ["page_size": pageSize, "key": apiKey]
    ApiProvider.shared.get(url: baseUrl, parameter: parameterGetGames) { result in
      switch result {
      case .success(let data):
        let decoder = JSONDecoder()
        do {
          let response = try decoder.decode(RootRawg.self, from: data)
            self.result.value = response.results
          completion(.success(response.results))
        } catch {
          completion(.failure(error))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  func getDetail(id: Int, completion: @escaping (Result<DetailRawg, Error>) -> Void) {
    let parameterGetDetail: [String: Any] = ["key": apiKey]
    ApiProvider.shared.get(url: "\(baseUrl)/\(id)", parameter: parameterGetDetail) { result in
      switch result {
      case .success(let data):
        let decoder = JSONDecoder()
        do {
          let response = try decoder.decode(DetailRawg.self, from: data)
          completion(.success(response))
        } catch {
          completion(.failure(error))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  func getSearch(_ query: String, completion: @escaping (Result<[ResultRawg], Error>) -> Void) {
    let parameterGetSearch = ["search": query, "key": apiKey]
    ApiProvider.shared.get(url: baseUrl, parameter: parameterGetSearch) { result in
      switch result {
      case .success(let data):
        do {
          let decoder = JSONDecoder()
          let response = try decoder.decode(RootRawg.self, from: data)
          completion(.success(response.results))
        } catch {
          completion(.failure(error))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}

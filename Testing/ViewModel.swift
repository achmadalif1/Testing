//
//  ViewModel.swift
//  Testing
//
//  Created by Ahmad Nur Alifullah on 07/04/23.
//

import Foundation


final class HomeSearchViewModel{
    private let provider: RawgProvider = RawgProvider.shared
    
    let result: Observable<[ResultRawg]?> = Observable(nil)
    let errorMessage: Observable<String?> = Observable(nil)
    let isLoading: Observable<Bool> = Observable(false)
    
  func getGames(pageSize: Int){
    let parameterGetGames: [String: Any] = ["page_size": pageSize, "key": apiKey]
    ApiProvider.shared.get(url: baseUrl, parameter: parameterGetGames) { result in
        self.isLoading.value = true
      switch result {
      case .success(let data):
        let decoder = JSONDecoder()
        do {
          let response = try decoder.decode(RootRawg.self, from: data)
            self.result.value = response.results
            self.isLoading.value = true
        } catch {
            self.errorMessage.value = error.localizedDescription
            self.isLoading.value = false
        }
      case .failure(let error):
          self.errorMessage.value = error.localizedDescription
          self.isLoading.value = false
      }
    }
  }
    
}

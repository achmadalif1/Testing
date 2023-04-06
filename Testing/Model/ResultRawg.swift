//
//  ResultRawg.swift
//  Gamelog
//
//  Created by yxgg on 22/04/22.
//

import Foundation

struct ResultRawg: Codable {
  let id: Int64
  let backgroundImage: String
  let name: String
  let rating: Double
  let genres: [Genres]?
  
  enum CodingKeys: String, CodingKey {
    case id
    case backgroundImage = "background_image"
    case name
    case rating
    case genres
  }
  
 
}

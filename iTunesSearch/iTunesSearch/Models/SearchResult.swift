//
//  SearchResult.swift
//  iTunesSearch
//
//  Created by Aaron on 9/6/19.
//  Copyright © 2019 AlphaGrade, INC. All rights reserved.
//

import Foundation


struct SearchResult: Codable {
    let title: String
    let creator: String
    
  private enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case creator = "artistName"
    }
    
}

struct SearchResults: Decodable {
   let results: [SearchResult]
}

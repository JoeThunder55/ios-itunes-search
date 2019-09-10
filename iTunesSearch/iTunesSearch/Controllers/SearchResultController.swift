//
//  SearchResultController.swift
//  iTunesSearch
//
//  Created by Aaron on 9/6/19.
//  Copyright © 2019 AlphaGrade, INC. All rights reserved.
//

import Foundation
class SearchResultsController {

let baseURL = URL(string: "https://itunes.apple.com/search")!
var searchResult: [SearchResult] = []


func performSearch(searchTerm: String, resultType: ResultType, completion: @escaping (Error?) -> Void) {

    var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
    let searchTermQueryItem = URLQueryItem(name: "term", value: searchTerm)
    let resultsTermQueryItem = URLQueryItem(name: "entity", value: resultType.rawValue)
    urlComponents?.queryItems = [searchTermQueryItem, resultsTermQueryItem]

    guard let requestURL = urlComponents?.url else {
        print("Request URL is nil, man.")
        return
    }
    
    var request = URLRequest(url: requestURL)
    request.httpMethod = "GET"
    
    URLSession.shared.dataTask(with: request) { data, _, error in
        if let error = error {
            print("Error Parsing Data: \(error)")
            return
        }
        guard let data = data else {
            print("No Data returned from data task.")
            return
        }
        let jsonDecoder = JSONDecoder()
        do {
            let searchResults = try jsonDecoder.decode(SearchResults.self, from: data)
            self.searchResult = searchResults.results
        } catch {
            print("Hey Dude. Unable to decode into person search object: \(error)")
        }
        
        completion(error)
        }.resume()
    }
  
    
 
}



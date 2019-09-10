//
//  SearchResultsTableViewController.swift
//  iTunesSearch
//
//  Created by Aaron on 9/6/19.
//  Copyright © 2019 AlphaGrade, INC. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterController: UISegmentedControl!
    
    let searchResultsController = SearchResultsController()
    var type: ResultType = .software
    
    private var filteredAndSortedResults: [SearchResult] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
 
        
    }
    
    // MARK: - Segment Controller Action
    @IBAction func segControlSelected(_ sender: UISegmentedControl) {
        var updatedResults: [SearchResult]
        switch sender.selectedSegmentIndex {
        case 0: updatedResults = searchResultsController.searchResult.filter {$0.title == "Apps"}
                type = .software
        case 1: updatedResults = searchResultsController.searchResult.filter {$0.title == "Music"}
                type = .musicTrack
        case 2: updatedResults = searchResultsController.searchResult.filter {$0.title == "Movies"}
                type = .movie
        default: updatedResults = searchResultsController.searchResult
        }
        filteredAndSortedResults = updatedResults
    }
}


// MARK: - TableView Extension
extension SearchResultsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell()}
        
        let results = filteredAndSortedResults[indexPath.row]
        cell.result = results
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredAndSortedResults.count
    }

}

// MARK: - Search Bar Extension
extension SearchResultsTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {return}

        
        searchResultsController.performSearch(searchTerm: searchTerm, resultType: type) { error in
            if let error = error {
                print("Hey Dude. There was an Error: \(error)")
                return
            }
            
            self.filteredAndSortedResults = self.searchResultsController.searchResult
          
        }
        
    }
}



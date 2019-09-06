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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
}

// MARK: - TableView Extension
extension SearchResultsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell()}
    }
    
    
   
    
}

// MARK: - Search Bar Extension
extension SearchResultsTableViewController: UISearchBarDelegate {
    
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

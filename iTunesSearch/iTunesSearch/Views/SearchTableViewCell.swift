//
//  SearchTableViewCell.swift
//  iTunesSearch
//
//  Created by Aaron on 9/6/19.
//  Copyright © 2019 AlphaGrade, INC. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var result: SearchResult? {
        didSet {
            updateView()
        }
    }

    func updateView() {
        guard let result = result else { return }
        titleLabel.text = result.title
        titleLabel.text = result.creator
    }

}

//
//  MovieCollectionViewCell.swift
//  movie_assignment
//
//  Created by May Phoo on 16/07/2020.
//  Copyright © 2020 padcios. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"

    @IBOutlet weak var imgMovie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

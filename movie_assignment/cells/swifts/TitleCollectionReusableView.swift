//
//  TitleCollectionReusableView.swift
//  movie_assignment
//
//  Created by May Phoo on 16/07/2020.
//  Copyright © 2020 padcios. All rights reserved.
//

import UIKit

class TitleCollectionReusableView: UICollectionReusableView {

    static let identifier = "TitleCollectionReusableView"
    
    @IBOutlet weak var textTitle: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

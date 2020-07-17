//
//  CategoryTitleHeaderView.swift
//  movie_assignment
//
//  Created by May Phoo on 17/07/2020.
//  Copyright © 2020 padcios. All rights reserved.
//

import UIKit

class CategoryTitleHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var labelTitle: UILabel!
    
    static var identifier : String {
        return String(describing: self)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//
//  CategoryTableViewCell.swift
//  movie_assignment
//
//  Created by May Phoo on 17/07/2020.
//  Copyright © 2020 padcios. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    static let identifier = "CategoryTableViewCell";
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var collectionMovieItem: UICollectionView!
    
    let categoryList = ["Trending", "Now Playing", "Upcoming", "Top Rated"]
    
    func setTitle(with title: String){
        self.labelTitle.text = title
        collectionMovieItem.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionMovieItem.dataSource = self
        collectionMovieItem.delegate = self
        
        collectionMovieItem.register(UINib(nibName: MovieItemCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieItemCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MovieItemCollectionViewCell.self), for: indexPath) as? MovieItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    

}

extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 150)
    }
}

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
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        movieCollectionView.register(UINib(nibName: MovieItemCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier:
            MovieItemCollectionViewCell.identifier)
        
    }

}

extension MovieCollectionViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MovieItemCollectionViewCell.self), for: indexPath) as? MovieItemCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: 120, height: 50)
    }
    
    
}

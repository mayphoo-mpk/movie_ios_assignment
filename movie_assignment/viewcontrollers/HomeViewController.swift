//
//  HomeViewController.swift
//  movie_assignment
//
//  Created by May Phoo on 16/07/2020.
//  Copyright © 2020 padcios. All rights reserved.
//

import Foundation
import UIKit

enum HomeSection : Int {
    case Trending = 0
    case NowPlaying = 1
    case Upcoming = 2
    case TopRated = 3
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionViewHome: UICollectionView!
    
    var items : [HomeSection] = [
        HomeSection.Trending,
        HomeSection.NowPlaying,
        HomeSection.Upcoming,
        HomeSection.TopRated
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    private func initView() {
        
        collectionViewHome.register(UINib(nibName: MovieCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    
        collectionViewHome.register(UINib(nibName: TitleCollectionReusableView.identifier, bundle: nil), forSupplementaryViewOfKind: TitleCollectionReusableView.identifier, withReuseIdentifier: TitleCollectionReusableView.identifier)
        
    
        collectionViewHome.delegate = self
        collectionViewHome.dataSource = self
        collectionViewHome.setCollectionViewLayout(generateCompositionalLayout(), animated: true)
    
    }
    
    func generateCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {
            (sectionIndex : Int, layoutEnv :
            NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let type = self.items[sectionIndex]
            
            switch type {
            case .NowPlaying:
                return self.sectionLayoutForMovieView()
            case .TopRated:
                return self.sectionLayoutForMovieView()
            case .Trending:
                return self.sectionLayoutForMovieView()
            case .Upcoming:
                return self.sectionLayoutForMovieView()
            default:
                fatalError("Crash")
            }
        }
        
    }
    
    
    func sectionLayoutForMovieView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            //1.0 is full
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(171))
            
            //Group -> Item (1)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            
            
            let section = NSCollectionLayoutSection(group: group)
        
            //section.orthogonalScrollingBehavior = .continuous
            section.orthogonalScrollingBehavior = .paging
            //between cells spacing in group
            section.interGroupSpacing = 10
            //inset
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 16, trailing: 20)
            
            return section
    }

}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let type = items[indexPath.section]
        
        switch type {
        case .NowPlaying:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
            
        case .TopRated:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
            
        case .Trending:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
            
        case .Upcoming:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
}

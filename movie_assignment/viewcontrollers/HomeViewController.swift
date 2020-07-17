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
    
    @IBOutlet weak var categoryTableView: UITableView!

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
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.separatorStyle = .none
    
//        categoryTableView.register(UINib(nibName: CategoryTitleHeaderView.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: CategoryTitleHeaderView.identifier)
        
        categoryTableView.register(UINib(nibName: CategoryTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CategoryTableViewCell.identifier)
    
    }

}
extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let type = items[section]
//        switch type {
//        case HomeSection.Trending:
//            let headerView = tableView.dequeueReusableCell(withIdentifier: CategoryTitleHeaderView.identifier) as?
//            CategoryTitleHeaderView
//
//            headerView?.labelTitle.text = "Trending"
//            return headerView
//        case HomeSection.NowPlaying:
//            let headerView = tableView.dequeueReusableCell(withIdentifier: CategoryTitleHeaderView.identifier) as?
//            CategoryTitleHeaderView
//
//            headerView?.labelTitle.text = "Now Playing"
//            return headerView
//
//        case HomeSection.Upcoming:
//            let headerView = tableView.dequeueReusableCell(withIdentifier: CategoryTitleHeaderView.identifier) as?
//            CategoryTitleHeaderView
//
//            headerView?.labelTitle.text = "Upcoming"
//            return headerView
//
//        case HomeSection.TopRated:
//            let headerView = tableView.dequeueReusableCell(withIdentifier: CategoryTitleHeaderView.identifier) as?
//            CategoryTitleHeaderView
//
//            headerView?.labelTitle.text = "Top Rated"
//            return headerView
//        default:
//            return nil
//        }
//    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        let type = items[section]
//
//        switch type {
//        case HomeSection.Trending:
//            return 25
//        case HomeSection.NowPlaying:
//            return 25
//        case HomeSection.Upcoming:
//            return 25
//        case HomeSection.TopRated:
//            return 25
//        default:
//            return 0
//        }
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let type = items[indexPath.section]
        switch type {
            case HomeSection.Trending:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell else {
                    return UITableViewCell()
                }
                cell.setTitle(with: "Trending")
                //cell.labelTitle.text = "Trending"
                return cell
            
            case HomeSection.NowPlaying:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.setTitle(with: "Now Playing")
                //cell.labelTitle.text = "Now Playing"
                return cell
            
            case HomeSection.Upcoming:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.labelTitle.text = "Upcoming"
                return cell
            
            case HomeSection.TopRated:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.labelTitle.text = "Top Rated"
                return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    
}

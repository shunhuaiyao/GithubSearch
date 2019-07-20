//
//  ViewController.swift
//  GithubSearch
//
//  Created by Yao Shun-Huai on 2019/7/18.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userCollectionView: UICollectionView!
    @IBOutlet weak var userCollectionViewFlowLayout: UICollectionViewFlowLayout!
    let searchController = UISearchController(searchResultsController: nil)
    var firstPage: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userCollectionView.delegate = self
        userCollectionView.dataSource = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        // Do any additional setup after loading the view.
    }


}


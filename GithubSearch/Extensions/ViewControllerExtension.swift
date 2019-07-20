//
//  ViewControllerExtension.swift
//  GithubSearch
//
//  Created by Yao Shun-Huai on 2019/7/19.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit
import Foundation

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width-10)/2 - 2.5, height: (view.frame.width-10)/2 - 2.5)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UserData.userModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let userCell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as! UserCell
        userCell.setupCell(indexPath)
        return userCell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        UserFunctions.removeAllUsers()
        userCollectionView.reloadData()
        if let keyUser = searchBar.text {
            let urlString = "https://api.github.com/search/users?q="+keyUser+"&page=1&per_page=100"
            retrieveData(URL(string: urlString)!)
        }
        searchBar.setShowsCancelButton(false, animated: true)
        
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
}

extension ViewController {
    func retrieveData(_ url: URL) {
        URLSession.shared.dataTask(with: url) { [unowned self] data, response, err in
            guard let data = data, let response = response as? HTTPURLResponse else {
                return
            }
            do {
                let searchDescription = try JSONDecoder().decode(SearchDescription.self, from: data)
                guard searchDescription.items != nil else{
                    return
                }
                
                for user in searchDescription.items! {
                    UserFunctions.addUser(userModel: user!)
                }
                
                if self.firstPage {
                    self.reloadCollectionView()
                    self.firstPage = false
                }
                // check if the next page exists
                if let link = response.allHeaderFields["Link"] as? String{
                    if let nextPageUrl = link.nextPageUrl {
                        self.retrieveData(nextPageUrl)
                    } else {
                        self.reloadCollectionView()
                        self.firstPage = true
                    }
                } else {
                    self.firstPage = true
                }
            } catch let jsonError{
                print("Failed to retrieve data:", jsonError)
            }
        }.resume()
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async { [unowned self] in
            self.userCollectionView.reloadData()
        }
    }
    
}

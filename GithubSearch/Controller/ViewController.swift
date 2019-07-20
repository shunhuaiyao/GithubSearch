//
//  ViewController.swift
//  GithubSearch
//
//  Created by Yao Shun-Huai on 2019/7/18.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonUrlString = "https://api.github.com/search/users?q=sean"
        guard let url = URL(string: jsonUrlString) else {
            return
        }
        retrieveData(url)
    }


}


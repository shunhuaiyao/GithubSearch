//
//  User.swift
//  GithubSearch
//
//  Created by Yao Shun-Huai on 2019/7/19.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit
import Foundation

struct User: Decodable {
    let id: Int?
    let login: String?
    let avatar_url: URL?
}

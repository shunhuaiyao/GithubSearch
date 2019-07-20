//
//  SearchDescription.swift
//  GithubSearch
//
//  Created by Yao Shun-Huai on 2019/7/19.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit
import Foundation

struct SearchDescription: Decodable {
    let total_count: Int?
    let incomplete_results: Bool?
    let items: ([User?])?
}

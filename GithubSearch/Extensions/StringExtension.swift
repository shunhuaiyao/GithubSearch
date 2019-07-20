//
//  StringExtension.swift
//  GithubSearch
//
//  Created by Yao Shun-Huai on 2019/7/19.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import Foundation

extension String {
    var nextPageUrl: URL? {
        var nextPageUrl: URL?
        let pagination = self.components(separatedBy: ", ")
        for page in pagination {
            if page.contains("rel=\"next\"") {
                nextPageUrl = URL(string: page.components(separatedBy: ">;").first?.components(separatedBy: "<").last ?? "")
            }
        }
        return nextPageUrl
    }
}

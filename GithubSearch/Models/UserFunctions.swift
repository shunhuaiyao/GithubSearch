//
//  UserFunctions.swift
//  GithubSearch
//
//  Created by Yao Shun-Huai on 2019/7/19.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import Foundation

class UserFunctions {
    static func addUser(userModel: User) {
        UserData.userModels.append(userModel)
    }
    static func removeAllUsers() {
        UserData.userModels.removeAll()
    }
}

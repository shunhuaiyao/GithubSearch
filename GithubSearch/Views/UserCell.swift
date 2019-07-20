//
//  UserCell.swift
//  GithubSearch
//
//  Created by Yao Shun-Huai on 2019/7/19.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit
import Foundation

class UserCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarName: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImage.layer.cornerRadius = 10
    }
    
    func setupCell(_ indexPath: IndexPath) {
        if UserData.userModels.count == 0 {
            return
        }
        if let userName = UserData.userModels[indexPath.row]?.login {
            avatarName.text = userName
        }
        if let userImageUrl = UserData.userModels[indexPath.row]?.avatar_url {
            avatarImage.load(url: userImageUrl)
        }
    }
}

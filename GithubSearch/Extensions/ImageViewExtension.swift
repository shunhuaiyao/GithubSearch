//
//  ImageViewExtension.swift
//  GithubSearch
//
//  Created by Yao Shun-Huai on 2019/7/19.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit
import Foundation

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func load(url: URL) {
        image = nil
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as NSString) {
            image = imageFromCache
            setGradientBackground()
            return
        }
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            do {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            let imageToCache = image
                            imageCache.setObject(imageToCache, forKey: url.absoluteString as NSString)
                            self?.image = imageToCache
                            self?.setGradientBackground()
                        }
                    }
                }
            }
        }
    }
    
    func setGradientBackground() {
        guard layer.sublayers?.count == nil else{
            return
        }
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width-10)/2-2.5, height: (UIScreen.main.bounds.width-10)/2-2.5)
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: bounds.width/2/bounds.width, y: 0)
        gradientLayer.endPoint = CGPoint(x: bounds.width/2/bounds.width, y: 1)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

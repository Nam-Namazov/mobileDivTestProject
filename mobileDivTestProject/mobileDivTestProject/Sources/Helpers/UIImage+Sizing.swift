//
//  UIImage+Sizing.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/12/22.
//

import UIKit

extension UIImage {
    func scaled(with scale: CGFloat, color: UIColor) -> UIImage? {
        let size = CGSize(width: floor(size.width * scale), height: floor(size.height * scale))
        UIGraphicsBeginImageContext(size)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()?.withTintColor(color)
        UIGraphicsEndImageContext()
        return image
    }
}

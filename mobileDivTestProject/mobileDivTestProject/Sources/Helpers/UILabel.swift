//
//  UILabel.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/11/22.
//

import UIKit

extension UILabel {
    convenience init(size: CGFloat,
                     textColor: UIColor = .black,
                     isBold: Bool = false ) {
        self.init(frame: .zero)
        font = isBold ? .boldSystemFont(ofSize: size) : .systemFont(ofSize: size)
        self.textColor = textColor
    }
}

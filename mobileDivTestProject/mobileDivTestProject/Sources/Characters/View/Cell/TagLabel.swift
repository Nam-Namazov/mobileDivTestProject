//
//  TagLabel.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/11/22.
//

import UIKit

final class TagLabel: UILabel {
    
    var status = AliveStatus.unknown {
        didSet {
            switch status {
            case .alive:
                configureTagLabel(backgroundColor: UIColor.Theme.lightGreen,
                                  textColor: UIColor.Theme.green,
                                  text: "ALIVE")
            case .dead:
                configureTagLabel(backgroundColor: UIColor.Theme.lightRed,
                                  textColor: UIColor.Theme.red,
                                  text: "DEAD")
            case .unknown:
                configureTagLabel(backgroundColor: UIColor.Theme.lightGray,
                                  textColor: UIColor.Theme.gray,
                                  text: "UNKNOWN")
            }
        }
    }
    
    private let topInset: CGFloat = 5.0
    private let bottomInset: CGFloat = 5.0
    private let leftInset: CGFloat = 7.0
    private let rightInset: CGFloat = 7.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset,
                                  left: leftInset,
                                  bottom: bottomInset,
                                  right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
    
    private func configureTagLabel(backgroundColor: UIColor,
                                   textColor: UIColor,
                                   text: String) {
        font = UIFont.boldSystemFont(ofSize: 14)
        layer.cornerRadius = 12
        layer.masksToBounds = true
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.text = text
    }
}

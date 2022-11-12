//
//  TagLabel.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/11/22.
//

import UIKit

enum LifeStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
    
    init(_ status: String) {
        switch status {
        case "Alive":
            self = .alive
        case "Dead":
            self = .dead
        default:
            self = .unknown
        }
    }
}

final class TagLabel: UILabel {
    
    var status = LifeStatus.unknown {
        didSet {
            switch status {
            case .alive:
                backgroundColor = UIColor.Theme.lightGreen
                textColor = UIColor.Theme.green
                text = "ALIVE"
            case .dead:
                backgroundColor = UIColor.Theme.lightRed
                textColor = UIColor.Theme.red
                text = "DEAD"
            case .unknown:
                backgroundColor = UIColor.Theme.lightGray
                textColor = UIColor.Theme.gray
                text = "UNKNOWN"
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.Theme.lightGreen
        textColor = UIColor.Theme.green
        text = "ALIVE"
        font = UIFont.boldSystemFont(ofSize: 14)
        layer.cornerRadius = 12
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

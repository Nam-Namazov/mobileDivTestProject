//
//  CharacterTableViewCell.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/11/22.
//

import UIKit

final class CharacterTableViewCell: UITableViewCell {
    static let identifier = "CharacterTableViewCell"
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .clear
    }
    
    private func configureLayout() {
        
    }
}

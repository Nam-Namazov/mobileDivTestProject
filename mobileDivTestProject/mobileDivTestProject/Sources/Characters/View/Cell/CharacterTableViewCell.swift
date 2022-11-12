//
//  CharacterTableViewCell.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/11/22.
//

import UIKit
import Kingfisher

final class CharacterTableViewCell: UITableViewCell {
    
    static let identifier = "CharacterTableViewCell"
    
    private let view = CharacterTableViewCellView()
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(characterImage: String,
                   characterName: String,
                   characterGender: String,
                   locationTitle: String,
                   lifeStatus: String) {
        view.nameLabel.text = characterName
        view.genderLabel.text = characterGender
        view.nameLocationLabel.text = locationTitle
        view.lifeStatusLabel.text = lifeStatus
        
        let status = LifeStatus(lifeStatus)
        view.lifeStatusLabel.status = status
        view.characterImageView.kf.setImage(with: URL(string: characterImage), options: [.processor(GrayscaleFilter(status == .dead)), .diskCacheExpiration(.expired)])
    }
    
    private func configureLayout() {
        contentView.addSubview(view)
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            view.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            view.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor),
        ])
    }
}

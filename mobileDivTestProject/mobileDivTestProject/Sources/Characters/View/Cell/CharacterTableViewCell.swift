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
    
    var onWatchEpisode: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureButtons()
        addSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(characterImage: String,
                   name: String,
                   species: String,
                   location: String,
                   aliveStatus: String) {
        view.nameLabel.text = name
        view.speciesLabel.text = species
        view.locationLabel.text = location
        view.aliveStatusLabel.text = aliveStatus
        
        let status = AliveStatus(aliveStatus)
        view.aliveStatusLabel.status = status
        view.characterImageView
            .kf
            .setImage(with: URL(string: characterImage),
                      options: [.processor(GrayscaleFilter(status == .dead)),
                                .diskCacheExpiration(.expired)])
    }
    
    private func configureButtons() {
        view.watchEpisodesButton.addTarget(self,
                                           action: #selector(watchEpisodeAction),
                                           for: .touchUpInside)
    }
    
    @objc
    private func watchEpisodeAction() {
        onWatchEpisode?()
    }
    
    private func addSubviews() {
        contentView.addSubview(view)
    }
    
    private func configureLayout() {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

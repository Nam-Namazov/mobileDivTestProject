//
//  CharacterTableViewCellView.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/11/22.
//

import UIKit

final class CharacterTableViewCellView: UIView {

    let characterImageView: UIImageView = {
        let characterImageView = UIImageView()
        characterImageView.layer.cornerRadius = 40
        characterImageView.clipsToBounds = true
        characterImageView.backgroundColor = .blue
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        return characterImageView
    }()
    
    let nameLabel = UILabel(size: 21, isBold: true)
    let genderLabel = UILabel(size: 14)
    
    let watchEpisodesButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.title = " Watch episodes"
        filled.buttonSize = .small
        filled.baseBackgroundColor = UIColor.Theme.lightOrange
        filled.baseForegroundColor = UIColor.Theme.orange
        filled.image = UIImage.play.scaled(with: 0.6, color: UIColor.Theme.orange)
        filled.imagePlacement = .leading
        filled.imagePadding = 5
        let watchEpisodesButton = UIButton(configuration: filled)
        watchEpisodesButton.clipsToBounds = true
        watchEpisodesButton.layer.cornerRadius = 17
        watchEpisodesButton.translatesAutoresizingMaskIntoConstraints = false
        return watchEpisodesButton
    }()
    
    let nameLocationLabel = UILabel(size: 14, textColor: UIColor.Theme.darkGray)
    
    let locationImageView: UIImageView = {
        let locationImageView = UIImageView()
        locationImageView.image = .location
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        locationImageView.tintColor = UIColor.Theme.lightGray
        return locationImageView
    }()
    
    let lifeStatusLabel = TagLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false 
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        addSubview(characterImageView)
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel,
                                                       genderLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        addSubview(watchEpisodesButton)
        addSubview(locationImageView)
        addSubview(nameLocationLabel)
        addSubview(lifeStatusLabel)
        
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 24),
            characterImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 12),
            characterImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -12),
            characterImageView.heightAnchor.constraint(
                equalToConstant: 120),
            characterImageView.widthAnchor.constraint(
                equalToConstant: 120),

            stackView.topAnchor.constraint(
                equalTo: characterImageView.topAnchor),
            stackView.leadingAnchor.constraint(
                equalTo: characterImageView.trailingAnchor,
                constant: 18),
            
            watchEpisodesButton.topAnchor.constraint(
                equalTo: stackView.bottomAnchor,
                constant: 12),
            watchEpisodesButton.leadingAnchor.constraint(
                equalTo: stackView.leadingAnchor),
            watchEpisodesButton.widthAnchor.constraint(
                equalToConstant: 148),
            watchEpisodesButton.heightAnchor.constraint(
                equalToConstant: 35),
            
            locationImageView.topAnchor.constraint(
                equalTo: watchEpisodesButton.bottomAnchor,
                constant: 12),
            locationImageView.leadingAnchor.constraint(
                equalTo: watchEpisodesButton.leadingAnchor),
            
            nameLocationLabel.topAnchor.constraint(
                equalTo: watchEpisodesButton.bottomAnchor,
                constant: 10),
            nameLocationLabel.leadingAnchor.constraint(
                equalTo: locationImageView.trailingAnchor,
                constant: 7),
        
            lifeStatusLabel.topAnchor.constraint(
                equalTo: characterImageView.topAnchor),
            lifeStatusLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -24),
        ])
    }
}

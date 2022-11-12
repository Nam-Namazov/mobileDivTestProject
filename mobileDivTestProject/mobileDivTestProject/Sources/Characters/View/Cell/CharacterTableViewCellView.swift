//
//  CharacterTableViewCellView.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/11/22.
//

import UIKit

final class CharacterTableViewCellView: UIView {
    
    private let shadowContainerView: UIView = {
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        let shadowPath0 = UIBezierPath(roundedRect: outerView.bounds, cornerRadius: 32)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 20
        layer0.shadowOffset = CGSize(width: 0, height: 10)
        layer0.bounds = outerView.bounds
        layer0.position = outerView.center
        outerView.layer.addSublayer(layer0)
        return outerView
    }()
    
    let characterImageView: UIImageView = {
        let characterImageView = UIImageView()
        characterImageView.clipsToBounds = true
        characterImageView.layer.cornerRadius = 40
        return characterImageView
    }()
    
    let aliveStatusLabel = TagLabel()
    
    let nameLabel: UILabel = {
        let label = UILabel(size: 21, isBold: true)
        label.adjustsFontSizeToFitWidth = true
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    let speciesLabel = UILabel(size: 14)
    
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
        return watchEpisodesButton
    }()
    
    let locationImageView: UIImageView = {
        let locationImageView = UIImageView()
        locationImageView.image = .location
        locationImageView.tintColor = UIColor.Theme.lightGray
        return locationImageView
    }()
    
    let locationLabel = UILabel(size: 14, textColor: UIColor.Theme.darkGray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(shadowContainerView)
        shadowContainerView.addSubview(characterImageView)
        addSubview(aliveStatusLabel)
        addSubview(nameLabel)
        addSubview(speciesLabel)
        addSubview(watchEpisodesButton)
        addSubview(locationImageView)
        addSubview(locationLabel)
    }
    
    private func configureLayout() {
        shadowContainerView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        aliveStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        watchEpisodesButton.translatesAutoresizingMaskIntoConstraints = false
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        aliveStatusLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            shadowContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            shadowContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            shadowContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            shadowContainerView.heightAnchor.constraint(equalToConstant: 120),
            shadowContainerView.widthAnchor.constraint(equalToConstant: 120),
            
            characterImageView.topAnchor.constraint(equalTo: shadowContainerView.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor),
            characterImageView.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor),
            
            aliveStatusLabel.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            aliveStatusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            nameLabel.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 18),
            nameLabel.trailingAnchor.constraint(equalTo: aliveStatusLabel.leadingAnchor, constant: -4),
            
            speciesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            speciesLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            watchEpisodesButton.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 12),
            watchEpisodesButton.leadingAnchor.constraint(equalTo: speciesLabel.leadingAnchor),
            watchEpisodesButton.widthAnchor.constraint(equalToConstant: 148),
            watchEpisodesButton.heightAnchor.constraint(equalToConstant: 35),
            
            locationImageView.topAnchor.constraint(equalTo: watchEpisodesButton.bottomAnchor, constant: 12),
            locationImageView.leadingAnchor.constraint(equalTo: watchEpisodesButton.leadingAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: watchEpisodesButton.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 7),
        ])
    }
}

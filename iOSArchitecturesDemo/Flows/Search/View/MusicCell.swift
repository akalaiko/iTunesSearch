//
//  MusicCell.swift
//  iOSArchitecturesDemo
//
//  Created by Tim on 07.06.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation


import UIKit

final class MusicCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 11.0)
        return label
    }()
    
    private(set) lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 10.0)
        return label
    }()
    
    private(set) lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: "play.circle")
        } else {
            // Fallback on earlier versions
        }
        return imageView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: MusicCellModel) {
        self.titleLabel.text = cellModel.title
        self.subtitleLabel.text = cellModel.subtitle
        self.ratingLabel.text = cellModel.rating
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.titleLabel, self.subtitleLabel, self.ratingLabel].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addTitleLabel()
        self.addSubtitleLabel()
        self.addRatingLabel()
        self.addMusicIcon()
    }
    
    private func addTitleLabel() {
        self.contentView.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addSubtitleLabel() {
        self.contentView.addSubview(self.subtitleLabel)
        NSLayoutConstraint.activate([
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4.0),
            self.subtitleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.subtitleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addRatingLabel() {
        self.contentView.addSubview(self.ratingLabel)
        NSLayoutConstraint.activate([
            self.ratingLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 4.0),
            self.ratingLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.ratingLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addMusicIcon() {
        self.contentView.addSubview(self.icon)
        NSLayoutConstraint.activate([
            self.icon.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4.0),
            self.icon.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20.0),
            self.icon.widthAnchor.constraint(equalToConstant: 40),
            self.icon.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
}

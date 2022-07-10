//
//  PersonTableViewCell.swift
//  KakaoProfile
//
//  Created by DaeSeong on 2022/07/09.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "PersonTableViewCell"
    
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "듀나"
        label.font = .systemFont(ofSize: 17, weight : .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let subLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "⛴포항항"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight : .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Funcs
    func render() {
        contentView.addSubview(profileImageView)
        profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 55).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        contentView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20).isActive = true
        
        contentView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 25).isActive = true
        subLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20).isActive = true
    }
    
    func configUI() {
        profileImageView.image = UIImage(named: "dora")
    }
}

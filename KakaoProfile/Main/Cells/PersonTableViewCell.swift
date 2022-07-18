//
//  PersonTableViewCell.swift
//  KakaoProfile
//
//  Created by DaeSeong on 2022/07/09.
//

import UIKit

class PersonTableViewCell: BaseTableViewCell {
    
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
        label.font = .systemFont(ofSize: 17, weight : .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let subLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 13, weight : .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
    //    stackView.spacing = 62
        return stackView
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Funcs
    override func render() {
        contentView.addSubview(profileImageView)
        profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14).isActive = true
        
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(subLabel)
        
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor,constant: 12).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -14).isActive = true

    }
    
    override func configUI() {
        
    }
    
    public func configure(info: Information) {
        // 셀 구성하기
        nameLabel.text = info.name
        subLabel.text = info.subTitle
        profileImageView.image = info.makeImage()
    }
}

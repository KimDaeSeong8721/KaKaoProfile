//
//  ImageLabelView.swift
//  KakaoProfile
//
//  Created by DaeSeong on 2022/07/09.
//

import UIKit

class ImageLabelView: UIView {
    
    // MARK: - Properties
    private let symbolImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textLabel : UILabel = {
        let label = UILabel()
        label.textAlignment =  .center
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    init(symbolName: String, textLabel : String){
        super.init(frame: .zero)
        self.symbolImageView.image = UIImage(named: symbolName)
        self.textLabel.text = textLabel
        self.translatesAutoresizingMaskIntoConstraints = false
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Funcs
    private func render() {
        
        addSubview(symbolImageView)
        symbolImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        symbolImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor,constant: 11).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: symbolImageView.leadingAnchor).isActive = true
    }
    
    
    
}

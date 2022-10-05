//
//  ImageLabelView.swift
//  KakaoProfile
//
//  Created by DaeSeong on 2022/07/09.
// ImageLabelView를 UIView로 설정했을때는 바깥 stackView에의해 찌그러져서 사이즈가 존재하지 않아서 버튼이 안눌림.

import UIKit



class ImageLabelView: UIStackView {


    // MARK: - Properties


    private let symbolImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let textLabel : UILabel = {
        let label = UILabel()
        label.textAlignment =  .center
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()
    
    init(symbolName: String, textLabel : String){
        super.init(frame: .zero)
        self.symbolImageView.image = UIImage(named: symbolName)
        self.textLabel.text = textLabel
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.alignment = .center
        self.spacing = 11
        self.isUserInteractionEnabled = true
        render()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    // MARK: - Funcs

    
    private func render() {
        self.addArrangedSubview(symbolImageView)
        self.addArrangedSubview(textLabel)
    }
    
    
    
}

//
//  ProfileViewController.swift
//  KakaoProfile
//
//  Created by DaeSeong on 2022/07/09.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    // MARK: - Properties
    
    var viewTranslation = CGPoint(x: 0, y: 0)
    var viewVelocity = CGPoint(x: 0, y: 0)
    
    private let dismissButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profileCloseBtn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dora")
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.layer.cornerRadius = 30
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "듀나"
        label.font = .systemFont(ofSize: 22, weight : .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    private let subLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "⛴포항항"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight : .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let horizontalLine : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Funcs
    override func render() {
        
        view.addSubview(dismissButton)
        dismissButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 40).isActive = true
        dismissButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        view.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 512).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 9).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7).isActive = true
        subLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(horizontalLine)
        horizontalLine.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 27).isActive = true
        horizontalLine.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        horizontalLine.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        horizontalLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        let first = ImageLabelView(symbolName: "profileTalkImg", textLabel: "나와의 채팅")
        let second = ImageLabelView(symbolName: "profileEditImg", textLabel: "프로필 편집")
        let third = ImageLabelView(symbolName: "profileStoryImg", textLabel: "카카오스토리")
        
        view.addSubview(first)
        first.widthAnchor.constraint(equalToConstant: 44).isActive = true
        first.heightAnchor.constraint(equalToConstant: 56).isActive = true
        first.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 31).isActive = true
        first.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 53).isActive = true
        
        view.addSubview(second)
        second.widthAnchor.constraint(equalToConstant: 44).isActive = true
        second.heightAnchor.constraint(equalToConstant: 56).isActive = true
        second.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 31).isActive = true
        second.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        view.addSubview(third)
        third.widthAnchor.constraint(equalToConstant: 44).isActive = true
        third.heightAnchor.constraint(equalToConstant: 56).isActive = true
        third.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 31).isActive = true
        third.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -53).isActive = true
    }
    
    override func configUI() {
        view.backgroundColor = .systemGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissButton.addTarget(self, action: #selector(didDismissButton), for: .touchUpInside)
        modalDismiss()
    }
    
    
    @objc private func didDismissButton(){
        dismiss(animated: true)
    }
    
    func modalDismiss() {
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }
    
    @objc func handleDismiss(_ sender: UIPanGestureRecognizer) {
        viewTranslation = sender.translation(in: view) // 뷰가 이동한 위치 저장
        viewVelocity = sender.velocity(in: view) //view가 이동한 방향 저장
        
        switch sender.state {
        case .changed:
            // 상하로 스와이프 할 때 위로 스와이프가 안되게 해주기 위해서 조건 설정
            if viewVelocity.y > 0 {
                UIView.animate(withDuration: 0.1, animations: {
                    self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
                })
            }
        case .ended:
            // 해당 뷰의 y값이 400보다 작으면(작게 이동 시) 뷰의 위치를 다시 원상복구하겠다. = 즉, 다시 y=0인 지점으로 리셋
            if viewTranslation.y < 400 {
                UIView.animate(withDuration: 0.1, animations: {
                    self.view.transform = .identity
                })
                // 뷰의 값이 400 이상이면 해당 화면 dismiss
            } else {
                dismiss(animated: true, completion: nil)
            }
            // 추가로 아래쪽 스와이프의 속도가 초당 300보다 크면 화면 dismiss
            if viewVelocity.y > 300 {
                dismiss(animated: true, completion: nil)
            }
            
        default:
            break
        }
    }
}

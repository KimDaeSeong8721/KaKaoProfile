//
//  MChangeViewController.swift
//  KakaoProfile
//
//  Created by DaeSeong on 2022/07/18.
//

import UIKit



class MChangeViewController: BaseViewController {

    // MARK: - Properties
    var delegate: MessageChangeDelegate?
    
    private let mainTitle: UILabel = {
        let label = UILabel()
        label.text = "상태 메시지 변경"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Placeholder"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var changeButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(changedTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func render() {
        view.addSubview(mainTitle)
        mainTitle.topAnchor.constraint(equalTo: view.topAnchor,constant: 73).isActive = true
        mainTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 14).isActive = true
        mainTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -14).isActive = true
        view.addSubview(textField)
        textField.topAnchor.constraint(equalTo: mainTitle.bottomAnchor,constant: 2).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 14).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -14).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        view.addSubview(changeButton)
        changeButton.topAnchor.constraint(equalTo: textField.bottomAnchor,constant: 76).isActive = true
        changeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 14).isActive = true
        changeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -14).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    override func configUI() {
        view.backgroundColor = .systemBackground
    }

    // MARK: - Funcs

    @objc func changedTapped() {
        delegate?.changeStatusMessage(content: textField.text ?? "")
        dismiss(animated: true)
    }
}

// MARK: - Delegate 프로토콜
protocol  MessageChangeDelegate {
    func changeStatusMessage(content: String)
}

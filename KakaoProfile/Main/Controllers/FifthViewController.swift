//
//  FifthViewController.swift
//  KakaoProfile
//
//  Created by DaeSeong on 2022/07/15.
//

import UIKit

class FifthViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

    }
    
    override func render() {
        
    }
    
    override func configUI() {
        configureNavBar()
        
    }
    func configureNavBar(){
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.text = "더보기"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }


}

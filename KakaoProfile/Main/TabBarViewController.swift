//
//  TabBarViewController.swift
//  KakaoProfile
//
//  Created by DaeSeong on 2022/07/15.
//

import UIKit

class TabBarViewController: UITabBarController {

    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 =  UINavigationController(rootViewController: StartViewController())
        let vc2 =  UINavigationController(rootViewController: SecondViewController())
        let vc3 =  UINavigationController(rootViewController: ThirdViewController())
        let vc4 =  UINavigationController(rootViewController: FourthViewController())
        let vc5 =  UINavigationController(rootViewController: FifthViewController())

        vc1.tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(named: "ic_unselected_person"),
                                      selectedImage: UIImage(named: "ic_selected_person"))
        vc2.tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(named: "ic_unselected_chat"),
                                      selectedImage: UIImage(named: "ic_selected_chat"))
        vc3.tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(named: "ic_unselected_hash"),
                                      selectedImage: UIImage(named: "ic_selected_hash"))
        vc4.tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(named: "ic_unselected_shop"),
                                      selectedImage: UIImage(named: "ic_selected_shop"))
        vc5.tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(named: "ic_unselected_more"),
                                      selectedImage: UIImage(named: "ic_selected_more"))
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: true)
    }
    

    

}

//
//  Information.swift
//  KakaoProfile
//
//  Created by DaeSeong on 2022/07/18.
//

import UIKit


struct Information {
    
    var imageName: String
    var name: String
    var subTitle: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
    
}

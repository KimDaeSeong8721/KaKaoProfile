//
//  BaseTableViewCell.swift
//  KakaoProfile
//
//  Created by DaeSeong on 2022/07/17.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Funcs
    // 레이아웃
    func render() {
        
    }
    // UI 구성
    func configUI() {
    }
}

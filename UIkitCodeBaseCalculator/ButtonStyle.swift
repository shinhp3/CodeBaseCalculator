//
//  ButtonStyle.swift
//  UIkitCodeBaseCalculator
//
//  Created by 신효범 on 6/29/24.
//

import UIKit

class ButtonStyle {
    static func makeButton(title: String, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = backgroundColor
        button.frame.size.height = 80
        button.frame.size.width = 80
        button.layer.cornerRadius = 40
        return button

    }
}

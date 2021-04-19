//
//  customButton.swift
//  CountOnMe
//
//  Created by antoine radice on 19/04/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
    }
    private func setUpUI() {
        self.layer.cornerRadius = 15
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowOpacity = 0.25
        self.titleEdgeInsets = .init(top: -2, left: 0, bottom: 0, right: 0)
    }
}

//
//  customText.swift
//  CountOnMe
//
//  Created by antoine radice on 19/04/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
import UIKit

class RoundedText: UITextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setUpUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
    }
    private func setUpUI() {
        self.layer.cornerRadius = 15
    }
}

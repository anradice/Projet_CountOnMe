//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    var model = SimpleCalc()
    private var alert: CustomAlertProtocol?
    

    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.delegate = self
        self.alert = CustomAlert()
        // Do any additional setup after loading the view.
    }

    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if model.expressionHaveResult {
            textView.text = ""
        }
        
        textView.text.append(numberText)
        model.updateText(textView.text)
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if model.canAddOperator {
            textView.text.append(" + ")
            model.updateText(textView.text)
        } else {
            alert?.createAlert(viewController: self, alert: .operators)
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if model.canAddOperator {
            textView.text.append(" - ")
            model.updateText(textView.text)
        } else {
            alert?.createAlert(viewController: self, alert: .operators)

        }
    }
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if model.canAddOperator {
            textView.text.append(" x ")
            model.updateText(textView.text)
        } else {
            alert?.createAlert(viewController: self, alert: .operators)
        }
    }

    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if model.canAddOperator {
            textView.text.append(" / ")
            model.updateText(textView.text)
        } else {
            alert?.createAlert(viewController: self, alert: .operators)
        }
    }

    @IBAction func tappedACButton(_ sender: UIButton) {
        textView.text = ""
        model.updateText(textView.text)
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard model.expressionIsCorrect else {
            alert?.createAlert(viewController: self, alert: .isCorrect)
            return
        }
        guard model.expressionHaveEnoughElement else {
            alert?.createAlert(viewController: self, alert: .newCalc)
            return
        }
        guard !model.divisionBy0 else {
            alert?.createAlert(viewController: self, alert: .divisionBy0)
            return
        }
        
        let operation = model.handleOperation()
        textView.text.append(" = \(operation)")
        model.updateText(textView.text)
    }
}


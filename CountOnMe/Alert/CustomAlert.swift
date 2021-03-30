//
//  CustomAlert.swift
//  CountOnMe
//
//  Created by antoine radice on 25/03/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
import UIKit

protocol CustomAlertProtocol {
    func createAlert(viewController: UIViewController, alert: AlertType)
}

enum AlertType {
    case newCalc, isCorrect, operators, divisionBy0
    var message: String {
        switch self {
        case .newCalc:
            return "Démarrez un nouveau calcul !"
        case .isCorrect:
            return "Entrez une expression correcte !"
        case .operators:
            return "Un operateur est déja mis !"
        case .divisionBy0:
            return "on ne peut pas diviser par 0 !"
        }
    }
}

class CustomAlert: CustomAlertProtocol {
    func createAlert(viewController: UIViewController, alert: AlertType) {
        let alertVC = UIAlertController(title: "Zéro!", message: alert.message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        viewController.present(alertVC, animated: true, completion: nil)
    }
}

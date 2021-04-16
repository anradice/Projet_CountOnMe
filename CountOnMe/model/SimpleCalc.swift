//
//  SimpleCalc.swift
//  CountOnMe
//
//  Created by antoine radice on 25/03/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

class SimpleCalc {
    var text: String = "1 + 1 = 2"
    var elements: [String] {
        return text.split(separator: " ").map { "\($0)" }
    }
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }

    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }

    var expressionHaveResult: Bool {
        return text.firstIndex(of: "=") != nil
    }
// check that there is no division by 0
    var divisionBy0: Bool {
        var temp = elements
        while temp.contains("/") {
            guard let index = temp.firstIndex(of: "/") else { return false }
            guard !(temp[index + 1] == "0") else { return true }
            temp[index] = String()
        }
        return false
    }
// Allows to update the text of the model when the user writes
    func updateText(_ text: String) {
        self.text = text
    }
// Allows to manage the priority in case of multiplication or division
    func divisionOrMulti(_ elements: [String]) -> [String] {
        var temp = elements
        while temp.contains("x") || temp.contains("/") {
            if let index = temp.firstIndex(where: {$0 == "x" || $0 == "/" }) {
                let operators = temp[index]
                guard let left = Float(temp[index - 1]) else { return [] }
                guard let right = Float(temp[index + 1]) else { return [] }
                let calcul: Float
                if operators == "x" {
                    calcul = left * right
                } else {
                    calcul = left / right
                }
                temp[index - 1] = String(calcul)
                temp.remove(at: index + 1)
                temp.remove(at: index)
            }
        }
        return temp
    }

    func handleOperation() -> String {
        var operationsToReduce = divisionOrMulti(elements)

        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Float(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Float(operationsToReduce[2])!

            let result: Float
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            default: fatalError("Unknown operator !")
            }

            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        return operationsToReduce.first!
    }
}

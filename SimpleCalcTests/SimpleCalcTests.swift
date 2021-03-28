//
//  SimpleCalcTests.swift
//  CountOnMeTests
//
//  Created by antoine radice on 28/03/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class SimpleCalcTest: XCTestCase {
    var simpleCalc: SimpleCalc!
    override func setUp() {
        simpleCalc = SimpleCalc()
    }
    
    override func tearDown() {
        simpleCalc = nil
    }
    
    func testGivenAddition_WhenTapEqual_ThenReturnCorrectResult() {
        simpleCalc.updateText("2 + 2")
        
        XCTAssertEqual(simpleCalc.handleOperation(), "4.0")
    }

    func testGivenSubstraction_WhenTapEqual_ThenReturnCorrectResult() {
        simpleCalc.updateText("3 - 2")
        
        XCTAssertEqual(simpleCalc.handleOperation(), "1.0")
    }

    func testGivenMultiplication_WhenTapEqual_ThenReturnCorrectResult() {
        simpleCalc.updateText("3 x 2")
        
        XCTAssertEqual(simpleCalc.handleOperation(), "6.0")
    }

    func testGivenDivision_WhenTapEqual_ThenReturnCorrectResult() {
        simpleCalc.updateText("6 / 2")
        
        XCTAssertEqual(simpleCalc.handleOperation(), "3.0")
    }

    func testGivenTextFinishWithPlus_WhenAddOperator_ThenError() {
        simpleCalc.updateText("2 + ")
        XCTAssertFalse(simpleCalc.canAddOperator)
        XCTAssertFalse(simpleCalc.expressionIsCorrect)
        XCTAssertFalse(simpleCalc.expressionHaveEnoughElement)
    }

    func testGivenTextFinishWithMinus_WhenAddOperator_ThenError() {
        simpleCalc.updateText("2 - ")
        XCTAssertFalse(simpleCalc.canAddOperator)
        XCTAssertFalse(simpleCalc.expressionIsCorrect)
        XCTAssertFalse(simpleCalc.expressionHaveEnoughElement)
    }

    func testGivenTextFinishWithMultiplicationOperator_WhenAddOperator_ThenError() {
        simpleCalc.updateText("2 x ")
        XCTAssertFalse(simpleCalc.canAddOperator)
        XCTAssertFalse(simpleCalc.expressionIsCorrect)
        XCTAssertFalse(simpleCalc.expressionHaveEnoughElement)
    }

    func testGivenTextFinishWithDivisionOperator_WhenAddOperator_ThenError() {
        simpleCalc.updateText("2 / ")
        XCTAssertFalse(simpleCalc.canAddOperator)
        XCTAssertFalse(simpleCalc.expressionIsCorrect)
        XCTAssertFalse(simpleCalc.expressionHaveEnoughElement)
    }

    func testGivendivisionBy0_WhenTapEqual_ThenError() {
        simpleCalc.updateText("2 / 0")
        
        XCTAssertTrue(simpleCalc.divisionBy0)
    }
    func testGivenExpressinHaveResult_WhenTapNumberButton_ThenError() {
        simpleCalc.updateText("2 + 2 = 4")
        XCTAssertTrue(simpleCalc.expressionHaveResult)
    }
    
}

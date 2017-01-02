//
//  ValidatorMandatoryTests.swift
//  EGFormValidator
//
//  Created by Evgeny Gushchin on 02/01/17.
//  Copyright © 2017 Evgeny Gushchin. All rights reserved.
//

import XCTest
@testable import EGFormValidator

class ValidatorMandatoryTests: XCTestCase {
    var vc: ValidatorViewController!
    var textField: UITextField!
    var placeholder: UILabel!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vc = ValidatorViewController()
        textField = UITextField()
        placeholder = UILabel()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidator0() {
        textField.text = ""
        vc.addValidatorMandatory(toControl: textField, errorPlaceholder: placeholder, errorMessage: "ERROR")
        XCTAssertFalse(vc.validate(), "Not a required field")
    }
 
    
    func testValidator1() {
        textField.text = nil
        vc.addValidatorMandatory(toControl: textField, errorPlaceholder: placeholder, errorMessage: "ERROR")
        XCTAssertFalse(vc.validate(), "Not a required field")
    }
    
    
    func testValidator2() {
        textField.text = " "
        vc.addValidatorMandatory(toControl: textField, errorPlaceholder: placeholder, errorMessage: "ERROR")
        XCTAssert(vc.validate(), "Field is not empty")
    }
    
    
    func testValidator3() {
        textField.text = "12345"
        vc.addValidatorMandatory(toControl: textField, errorPlaceholder: placeholder, errorMessage: "ERROR")
        XCTAssert(vc.validate(), "Field is not empty")
    }
}
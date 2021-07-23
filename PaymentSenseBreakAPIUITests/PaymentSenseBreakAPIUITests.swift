//
//  PaymentSenseBreakAPIUITests.swift
//  PaymentSenseBreakAPIUITests
//
//  Created by HariRamya on 19/07/2021.
//

import XCTest

class PaymentSenseBreakAPIUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppLoad() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCUIApplication().tables.staticTexts["Walter White"].tap()
        XCUIApplication().children(matching: .window).element(boundBy: 0).swipeDown()
    }
    
    func testLoadQuotes() throws {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        app.launch()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Title : Cat's in the Bag..."].press(forDuration: 0.7);/*[[".cells.staticTexts[\"Title : Cat's in the Bag...\"]",".tap()",".press(forDuration: 0.7);",".staticTexts[\"Title : Cat's in the Bag...\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        app.windows.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeDown()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Title : Pilot"].press(forDuration: 0.6);/*[[".cells.staticTexts[\"Title : Pilot\"]",".tap()",".press(forDuration: 0.6);",".staticTexts[\"Title : Pilot\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Pilot"]/*[[".cells.staticTexts[\"Pilot\"]",".staticTexts[\"Pilot\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeDown()
        
    }
    
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

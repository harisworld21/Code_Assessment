//
//  PaymentSenseBreakAPITests.swift
//  PaymentSenseBreakAPITests
//
//  Created by HariRamya on 19/07/2021.
//

import XCTest
@testable import PaymentSenseBreakAPI



class PaymentSenseBreakAPITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModel() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let vm = HomePageViewModel()
        let exp = XCTestExpectation(description: "Test service Calls")
        vm.makeAPICalls(completion: { res in
            XCTAssertNotNil(res)
            XCTAssertTrue(res.count == 3)
            exp.fulfill()
        })
        wait(for: [exp], timeout: 10.0)
    }
    
    func testViewSearchItem() throws {
        let vm = HomePageViewModel()
        let exp = XCTestExpectation(description: "Test service Call individual")
        vm.searchItemAPICall(item: "characters", hasCompleted: { res in
            XCTAssertTrue(res)
            XCTAssertNotNil(vm.tableItem)
            XCTAssert(vm.tableItem.count == 1, "Service Failed")
            exp.fulfill()
        })
        wait(for: [exp], timeout: 10.0)
    }
    
    func testLoadImage() throws {
        downloadImage(from: URL(string: "https://user-images.githubusercontent.com/19262501/126837632-4e6034d8-2206-4fe0-98c0-053e0cc77519.gif")!, completion: { image in
            XCTAssertNotNil(image)
        })
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

//
//  ListMakerTests.swift
//  ListMakerTests
//
//  Created by Harrison Stevens on 10/10/2016.
//  Copyright © 2016 Harrison Stevens. All rights reserved.
//

import XCTest

class ListMakerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        self.lister.add(item:"bread")
        self.lister.add(item: "butter")
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    var lister = Lister()
    func testAddItem() {
        XCTAssertEqual(self.lister.count, 2)
        self.lister.add(item: "ham")
        XCTAssertEqual(self.lister.count, 3)
    }
    
    func testGetInvalidIndex() {
        print(self.lister.count)
        XCTAssertEqual(self.lister.count, 2)
        do {
            _ = try lister.getItem(atIndex: 2)
            XCTFail()
        } catch ListError.outOfRange(let index){
            print("index\(index) is out of range")
            XCTAssertEqual(index, 2)
        }catch {
            XCTFail()
        }
    }

    

    
    
}

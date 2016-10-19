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
        Lister.sharedInstance.clearList()
        self.lister.add(item:"bread")
        self.lister.add(item: "butter")
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testAddItem() {
        let lister = Lister.sharedInstance
        XCTAssertEqual(lister.count, 2)
        lister.add(item: "ham")
        XCTAssertEqual(lister.count, 3)
    }
  
    
    
    func testGetHighInvalidIndex() {
         let lister = Lister.sharedInstance
        print(lister.count)
        XCTAssertEqual(lister.count, 2)
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
    
    
    func testGetLowInvalidIndex() {
         let lister = Lister.sharedInstance
        print(lister.count)
        XCTAssertEqual(lister.count, 2)
        do {
            _ = try lister.getItem(atIndex: -1)
            XCTFail()
        } catch ListError.outOfRange(let index){
            print("index\(index) is out of range")
            XCTAssertEqual(index, -1)
        }catch {
            XCTFail()
        }
    }
    
    func testGetvalidIndex() {
        let lister = Lister.sharedInstance
        print(lister.count)
        XCTAssertEqual(lister.count, 2)
        do {
            let item = try lister.getItem(atIndex: 1)
            XCTAssertEqual(item, "butter")
        } catch {
            XCTFail()
        }
    }
    
    func testRemoveInvalidIndex() {
        let lister = Lister.sharedInstance
        print(lister.count)
        XCTAssertEqual(lister.count, 2)
        do {
            try lister.remove(atIndex: 2)
            XCTFail()
            
        }
        catch ListError.outOfRange(let index){
            print("index\(index) is out of range")
            
        }
        catch {
            XCTFail()
        }
        
    }
    
    func testRemoveValidIndex() {
        let lister = Lister.sharedInstance
        print(lister.count)
        XCTAssertEqual(lister.count, 2)
        do {
            try lister.remove(atIndex: 0)
            XCTAssertEqual(lister.count, 1)
            print(lister.count)
            
        }
        catch ListError.outOfRange(let index){
            print("index\(index) is out of range")
            
        }
        catch {
            XCTFail()
        }
        
    }
    
    func testInvalidtoIndex() {
        let lister = Lister.sharedInstance
        print(lister.count)
        XCTAssertEqual(lister.count, 2)
        do {
            try lister.moveItem(fromIndex: 0 , toIndex: 3)
             XCTFail()
            
        }
        catch ListError.outOfRange(let index){
            print("index\(index) is out of range")
            
        }
        catch {
            XCTFail()
        }
        
    }
    
    func testInvalidfromIndex() {
        let lister = Lister.sharedInstance
        print(lister.count)
        XCTAssertEqual(lister.count, 2)
        do {
             try lister.moveItem(fromIndex: -1 , toIndex: 1)
             XCTFail()
            
            
        }
        catch ListError.outOfRange(let index){
            print("index\(index) is out of range")
            
        }
        catch {
            XCTFail()
        }
        
    }
    
    func testValidMoveIndexs() {
        let lister = Lister.sharedInstance
        print(lister.count)
        XCTAssertEqual(lister.count, 2)
        do {
            try lister.moveItem(fromIndex: 0 , toIndex: 1)
           // let index1 = 0
            //let index2 = 1
            //XCTAssertEqual(index1, "bread")
            //XCTAssertEqual(index2, "butter")
            
        }
        catch ListError.outOfRange(let index){
            print("index\(index) is out of range")
            
        }
        catch {
            XCTFail()
        }
        
    }
    
    func testValidInsertIndexs() {
        let lister = Lister.sharedInstance
        print(lister.count)
        XCTAssertEqual(lister.count, 2)
        do {
            try lister.insert(newElement: "Milk" , atIndex: 0)
            XCTAssertEqual(try lister.getItem(atIndex: 0), "Milk")
        }
        catch {
            XCTFail()
        }
        
    }
    
    func testInValidInsertIndexs() {
        let lister = Lister.sharedInstance
        print(lister.count)
        XCTAssertEqual(lister.count, 2)
        do {
             try lister.insert(newElement: "Milk" , atIndex: 3)
             XCTFail()
        }
        catch ListError.outOfRange(let index){
            print("index\(index) is out of range")
            
        }
        catch {
            XCTFail()
        }
        
    }
    
    
    
    
}

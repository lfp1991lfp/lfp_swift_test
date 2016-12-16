//
//  LfpClassTests.swift
//  lfp-hello-master
//
//  Created by lfp on 2016/12/16.
//  Copyright © 2016年 lfp. All rights reserved.
//

import XCTest

class LfpClassTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testClassField() {
        let person = Person(name: "lfp", age: 10)
        print("the result is \(person.onResult())")
    }
    
}
class Person {
    var name: String = "";
    var age: Int = 0;
    var sex: String = ""
    
    init(name: String, age: Int) {
        self.name = name;
        self.age = age;
    }
    
    
    func onResult() -> String {
        return "My name is \(name), age is \(age)"
    }
}

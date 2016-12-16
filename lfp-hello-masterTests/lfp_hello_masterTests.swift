//
//  lfp_hello_masterTests.swift
//  lfp-hello-masterTests
//
//  Created by lfp on 16/9/22.
//  Copyright © 2016年 lfp. All rights reserved.
//

import XCTest
@testable import lfp_hello_master

class lfp_hello_masterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        print("wo are setup")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let arrays = [
            "Prime": [1, 3, 5, 17, 9],
            "Fibnacci": [2, 4, 16, 8, 10]
        ]
        var largest = 0;
        var kindest = "first";
        //字典遍历,kind表示数组内部的key,numbers表示从最后一个字典对象开始遍历
        for (kind, numbers) in arrays {
            for number in numbers {
                if number > largest {
                    largest = number
                    kindest = kind
                }
            }
        }
        print("max is \(largest)")
        print("kind is \(kindest)")
    }
    
    func testNil() {
        let optionString: String? = nil;    //初始化是可选类型
        print(optionString == nil)
        
        var optionNilName: String? = nil;
        optionNilName = "hello world";
        var greeting = "World"
        if let name = optionNilName {
            greeting = "Hello \(name)"
        }
        print("greeting is \(greeting)")
        
        let nickName: String? = nil;
        let fullName: String = "Lfp";
        
        let info = "Hi \(nickName ?? fullName)"
        print("info is \(info)")
    }
    
    func testSwitch() {
        let type = "other color";
        var printType = "";
        switch type {
        case "red":
            printType = "red";
        case "blue":
            printType = "blue";
        case "green":
            printType = "green";
        case let color where color.hasSuffix("colors"):     //type给color赋值,再查后缀
            printType = "no color"
        case let other where other.hasPrefix("other"):
            printType = "no other color";
        default:
            printType = "default"    //default不能去掉,去掉会报错
        }
        print("select color is \(printType)");
    }
    
    func testFor() {
        var sum = 0;
        for i in 0..<4 {  //不包含上界
            sum += i;
        }
        print("sum is \(sum)")
        
        sum = 0;
        for i in 0...4 {   //包含上界
            sum += i;
        }
        print("sum is \(sum)")
    }
    
    func testBiBao() {
        print("result is \(biBao(person: "Lfp", eat: "apple"))");
        print("result is \(biBao1(person: "Lfp", age: 10))");
    }
    
    func biBao(person: String, eat: String) -> String {
        return "person is \(person) eat \(eat)"
    }
    
    func biBao1(person: String, age: Int) -> String {
        return "\(person) is age \(age)"
    }
    
    func testArrays() {
        let value = calculateStatistics(scores: [5, 4, 3])   //元祖式数组
        print("min is \(value.min)")
        print("max is \(value.max)")
        print("sum is \(value.sum)")
        //函数式数组
        print("the sum is \(sumOf(numbers: 5, 3))");
        print("the sum is \(sumOf())")
    }
    
    //测试函数嵌套
    func testNesting() {
        let one = nestFun()
        print("result is \(one(9))")
        let increment = nestArraysFun();
        print("result is \(increment(3, 2, 1))")  //因为返回类型是函数,4是作为返回函数的参数
    }
    
    //测试函数传递
    func testNestParams() {
        let number = [13, 15, 7, 19]
        //list和ondition前置声明
        if (hasAnyMatches(list: number, condition: lessThanTen)) {
            print("存在比10小的数字");
        } else {
            print("不存在比10小的数字")
        }
    }
    
    func testBiBaoMap() {
        let numbers = [20, 1, 13, 35, 36]
        let mappedNUmber = numbers.map({
            (number: Int) -> Int in
            var result = number % 2;
            if result == 1 {
                result = 0;
            } else {
                result = number
            }
            print("result is \(result)")
            return result
        })
        print("the result is \(mappedNUmber)");
        
        let mappedNumber = numbers.map({
            number in number % 2          //已知返回类型,可以忽略参数的类型和返回类型
        })
        print("the result is \(mappedNumber)");
        
        let sortedDescNumber = numbers.sorted(by: >)     //按降序排列
        print("The result is \(sortedDescNumber)")
        
        let sortedAscNumber = numbers.sorted(by: <)
        print("The result is \(sortedAscNumber)")     //按升序排列
    }
    
    func hasAnyMatches(list: [Int], condition:(Int) -> Bool) -> Bool {
        for item in list {
            print("item is \(item)")
            if (condition(item)) {
                return true
            }
        }
        return false
    }
    
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    
    func nestFun() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return number + 1;
        }
        return addOne
    }
    
    ///声明一个函数,返回类型是函数
    func nestArraysFun() -> ((Int...) -> Int) {
        func addOne(numbers: Int...) -> Int {
            var sum: Int = 0;
            for number in numbers {
                sum += number;
            }
            return sum;
        }
        return addOne
    }
    
    func sumOf(numbers: Int...) -> Int {
        var sum = 0;
        for number in numbers {
            sum += number;
        }
        if numbers.count > 0 {
            sum /= numbers.count
        }
        return sum;
    }
    
    func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
        var min = scores[0];
        var max = scores[0];
        var sum = 0;
        
        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score;
        }
        
        return (min, max, sum);
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

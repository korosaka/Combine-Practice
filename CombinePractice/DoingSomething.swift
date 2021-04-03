//
//  DoingSomething.swift
//  CombinePractice
//
//  Created by Koro Saka on 2021-04-03.
//

import Foundation
import Combine

class DoingSomething {
    
    init() {
        
        //MARK: 1. Just
        
        //MARK: original
//        let publisher = Just(100)
//
//        let subscriber = Subscribers.Sink<Int, Never>(receiveCompletion: { completion in
//            switch completion {
//            case .failure(let error):
//                print("Error happened!", error.localizedDescription)
//            case .finished:
//                print("Finish!")
//            }
//        },
//        receiveValue: { value in
//            print("value :\(value)")
//        })
//
//        publisher.subscribe(subscriber)
        
        
        //MARK: shorten
//        let cancelable1 = Just(999).sink(receiveCompletion: { completion in
//            switch completion {
//            case .failure(let error):
//                print("Error happened!", error.localizedDescription)
//            case .finished:
//                print("Finish!")
//            }
//        },
//        receiveValue: { value in
//            print("value :\(value)")
//        })
        
        //MARK: shortest
//        let cancelable2 = Just(777).sink(receiveValue: { value in
//            print("value :\(value)")
//        })
        
        //MARK: 2. assign & map
//        let testResult = TestResult(score: "0")
//
//        let cancelable3 = Just(100)
//            .map({ value in
//                return String(value)
//            })
//            .assign(to: \.score, on: testResult)
//
//        print("test score: \(testResult.score)")
        
        
        //MARK: 3. Notification Publisher
        let testResult = TestResult(score: 0)
        print("score1: \(testResult.score)")
        
        let cancelable = NotificationCenter.default.publisher(for: .finishCalc, object: nil)
            .map({ notification in
                return notification.userInfo?["result"] as? Int ?? 50
            })
            .assign(to: \.score, on: testResult)
        
        print("score2: \(testResult.score)")
        NotificationCenter.default.post(name: .finishCalc, object: nil, userInfo: ["result" : 90])
        print("score3: \(testResult.score)")
    }
    
}

class TestResult {
    var score: Int
    init(score: Int) {
        self.score = score
    }
}

extension Notification.Name {
    static let finishCalc = Notification.Name("finishCalc")
}

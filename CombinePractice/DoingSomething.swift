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
        //MARK: original
        let publisher = Just(100)
        
        let subscriber = Subscribers.Sink<Int, Never>(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print("Error happened!", error.localizedDescription)
            case .finished:
                print("Finish!")
            }
        },
        receiveValue: { value in
            print("value :\(value)")
        })
        
        publisher.subscribe(subscriber)
        
        
        //MARK: shorten
        let cancelable1 = Just(999).sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print("Error happened!", error.localizedDescription)
            case .finished:
                print("Finish!")
            }
        },
        receiveValue: { value in
            print("value :\(value)")
        })
        
        //MARK: shortest
        let cancelable2 = Just(777).sink(receiveValue: { value in
            print("value :\(value)")
        })
    }
}

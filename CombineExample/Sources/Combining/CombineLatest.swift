//
//  CombineLatest.swift
//  CombineExample
//
//  Created by 박기석 on 11/15/24.
//

import RxSwift
import Combine

final class CombineLatest: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    private let rxSubject1 = PublishSubject<Int>()
    private let rxSubject2 = PublishSubject<String>()
    
    private let subject1 = PassthroughSubject<Int, Never>()
    private let subject2 = PassthroughSubject<String, Never>()
    
    func test() {
        // Rx combineLatest
        _ = Observable.combineLatest(rxSubject1, rxSubject2)
            .subscribe(onNext: {
                debugPrint("RxSwift")
                debugPrint($0)
            })
        
        rxSubject1.onNext(1)
        rxSubject1.onNext(2)
        rxSubject2.onNext("a")
        rxSubject1.onNext(3)
        rxSubject2.onNext("b")
        rxSubject1.onNext(4)
        rxSubject1.onNext(5)
        rxSubject2.onNext("c")
        
        // Combine combineLatest
        subject1.combineLatest(subject2)
            .sink {
                debugPrint("Combine")
                debugPrint($0)
            }
            .store(in: &cancellables)
        
        subject1.send(1)
        subject1.send(2)
        subject2.send("a")
        subject1.send(3)
        subject2.send("b")
        subject1.send(4)
        subject1.send(5)
        subject2.send("c")
    }
}

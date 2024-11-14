//
//  Deferred.swift
//  CombineExample
//
//  Created by 박기석 on 11/14/24.
//

import RxSwift
import Combine

final class Deferred: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    private let rxSubject = PublishSubject<Int>()
    private let subject = PassthroughSubject<Int, Never>()
    
    func test() {
        // Rx Deferred
        let observable = Observable.deferred { [rxSubject] in rxSubject }
        
        _ = observable
            .subscribe(onNext: {
                debugPrint("RxSwift")
                debugPrint($0)
            })
        
        rxSubject.onNext(3)
        rxSubject.onCompleted()
        
        // Combine Deferred
        let publisher = Combine.Deferred { [subject] in subject }
        
        publisher
            .sink {
                debugPrint("Combine")
                debugPrint($0)
            }
            .store(in: &cancellables)
        
        subject.send(2)
        subject.send(completion: .finished)
    }
}

//
//  Error.swift
//  CombineExample
//
//  Created by 박기석 on 11/15/24.
//

import Foundation
import RxSwift
import Combine

final class ErrorTest: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx Error
        Observable.error(NSError(domain: "test", code: 1001))
            .subscribe(onNext: {
                debugPrint("RxSwift Next")
            }, onError: { error in
                debugPrint("RxSwift Error")
                debugPrint(error)
            }, onCompleted: {
                debugPrint("RxSwift Completed")
            }, onDisposed: {
                debugPrint("RxSwift Disposed")
            })
            .disposed(by: disposeBag)
        
        // Combine Error
        Fail(error: NSError(domain: "test", code: 1001))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    debugPrint("Combine Completed")
                case .failure(let failure):
                    debugPrint("Combine Error")
                    debugPrint(failure)
                }
            }, receiveValue: {
                debugPrint("Combine Next")
            })
            .store(in: &cancellables)
    }
}

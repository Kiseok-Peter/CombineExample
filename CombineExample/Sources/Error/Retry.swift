//
//  Retry.swift
//  CombineExample
//
//  Created by 박기석 on 11/18/24.
//

import Foundation
import RxSwift
import Combine

final class Retry: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx retry
        Observable.from([1, 2, 3, 4])
            .flatMap { value -> Observable<Int> in
                guard value != 3 else { return Observable.error(NSError(domain: "test", code: 1001)) }
                return .just(value)
            }
            .retry(1)
            .subscribe(onNext: {
                debugPrint("RxSwift Next")
                debugPrint($0)
            }, onError: { error in
                debugPrint("RxSwift Error")
                debugPrint(error)
            }, onCompleted: {
                debugPrint("RxSwift Completed")
            }, onDisposed: {
                debugPrint("RxSwift Disposed")
            })
            .disposed(by: disposeBag)
        
        // Combine retry
        [1, 2, 3, 4].publisher
            .tryMap { value in
                guard value != 3 else { throw NSError(domain: "test", code: 1001) }
                return value
            }
            .retry(1)
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
                debugPrint($0)
            })
            .store(in: &cancellables)
    }
}

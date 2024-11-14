//
//  NeverTest.swift
//  CombineExample
//
//  Created by 박기석 on 11/15/24.
//

import RxSwift
import Combine

final class NeverTest: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx Never
        Observable.never()
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
        
        // Combine Never
        Empty<Void, Error>(completeImmediately: false)
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

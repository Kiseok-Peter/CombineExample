//
//  EmptyTest.swift
//  CombineExample
//
//  Created by 박기석 on 11/15/24.
//

import RxSwift
import Combine

final class EmptyTest: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx Empty
        Observable.empty()
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
        
        // Combine Empty
        Combine.Empty<Void, Error>() // init(completeImmediately: Bool = true)
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

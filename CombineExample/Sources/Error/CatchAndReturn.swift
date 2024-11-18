//
//  CatchAndReturn.swift
//  CombineExample
//
//  Created by 박기석 on 11/18/24.
//

import Foundation
import RxSwift
import Combine

final class CatchAndReturn: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx catchAndReturn
        Observable.error(NSError(domain: "test", code: 1001))
            .catchAndReturn(1)
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
        
        // Combine catchAndReturn
        Fail(error: NSError(domain: "test", code: 1001))
            .replaceError(with: 1)
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

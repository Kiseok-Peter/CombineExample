//
//  Catch.swift
//  CombineExample
//
//  Created by 박기석 on 11/18/24.
//

import Foundation
import RxSwift
import Combine

final class Catch: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx catch
        Observable.error(NSError(domain: "test", code: 1001))
            .catch { error in
                Observable.from([1, 2, 3])
            }
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
        
        // Combine catch
        Fail(error: NSError(domain: "test", code: 1001))
            .catch { error in
                [1, 2, 3].publisher
            }
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
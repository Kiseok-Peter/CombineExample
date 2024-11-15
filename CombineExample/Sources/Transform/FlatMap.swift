//
//  FlatMap.swift
//  CombineExample
//
//  Created by 박기석 on 11/15/24.
//

import RxSwift
import Combine

final class FlatMap: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx flatMap
        Observable.just(1)
            .flatMap {
                Observable.just($0).map { $0 + 1 }
            }
            .subscribe(onNext: {
                debugPrint("RxSwift")
                debugPrint($0)
            })
            .disposed(by: disposeBag)
        
        // Combine flatMap
        Combine.Just(1)
            .flatMap {
                Combine.Just($0).map { $0 + 1 }
            }
            .sink {
                debugPrint("Combine")
                debugPrint($0)
            }
            .store(in: &cancellables)
    }
}

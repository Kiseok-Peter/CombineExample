//
//  Just.swift
//  CombineExample
//
//  Created by 박기석 on 11/14/24.
//

import RxSwift
import Combine

final class Just: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx just
        Observable.just(1)
            .subscribe(onNext: {
                debugPrint("RxSwift")
                debugPrint($0)
            })
            .disposed(by: disposeBag)
        
        // Combine just
        Combine.Just(1)
            .sink {
                debugPrint("Combine")
                debugPrint($0)
            }
            .store(in: &cancellables)
    }
}


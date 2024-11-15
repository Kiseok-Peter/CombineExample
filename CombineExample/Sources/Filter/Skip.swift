//
//  Skip.swift
//  CombineExample
//
//  Created by 박기석 on 11/15/24.
//

import RxSwift
import Combine

final class Skip: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx skip
        Observable.from([1, 2, 3, 4, 5])
            .skip(2)
            .subscribe(onNext: {
                debugPrint("RxSwift")
                debugPrint($0)
            })
            .disposed(by: disposeBag)
        
        // Combin skip
        [1, 2, 3, 4, 5].publisher
            .dropFirst(2)
            .sink {
                debugPrint("Combine")
                debugPrint($0)
            }
            .store(in: &cancellables)
    }
}

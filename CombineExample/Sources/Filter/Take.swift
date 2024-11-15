//
//  Take.swift
//  CombineExample
//
//  Created by 박기석 on 11/15/24.
//

import RxSwift
import Combine

final class Take: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx take
        Observable.from([1, 2, 3, 4, 5])
            .take(3)
            .subscribe(onNext: {
                debugPrint("RxSwift")
                debugPrint($0)
            })
            .disposed(by: disposeBag)
        
        // Combin take
        [1, 2, 3, 4, 5].publisher
            .prefix(3)
            .sink {
                debugPrint("Combine")
                debugPrint($0)
            }
            .store(in: &cancellables)
    }
}

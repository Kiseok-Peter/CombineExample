//
//  Filter.swift
//  CombineExample
//
//  Created by 박기석 on 11/15/24.
//

import RxSwift
import Combine

final class Filter: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx filter
        Observable.from([1, 2, 3])
            .filter { $0 % 2 == 1 }
            .subscribe(onNext: {
                debugPrint("RxSwift")
                debugPrint($0)
            })
            .disposed(by: disposeBag)
        
        // Combine filter
        [1, 2, 3].publisher
            .filter { $0 % 2 == 1 }
            .sink {
                debugPrint("Combine")
                debugPrint($0)
            }
            .store(in: &cancellables)
    }
}

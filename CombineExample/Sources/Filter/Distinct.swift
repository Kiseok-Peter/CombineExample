//
//  Distinct.swift
//  CombineExample
//
//  Created by 박기석 on 11/15/24.
//

import RxSwift
import Combine

final class Distinct: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx distinct
        Observable.from([1, 1, 2, 2, 1, 3])
            .distinctUntilChanged()
            .subscribe(onNext: {
                debugPrint("RxSwift")
                debugPrint($0)
            })
            .disposed(by: disposeBag)
        
        // Combine distinct
        [1, 1, 2, 2, 1, 3].publisher
            .removeDuplicates()
            .sink {
                debugPrint("Combine")
                debugPrint($0)
            }
            .store(in: &cancellables)
    }
}

//
//  From.swift
//  CombineExample
//
//  Created by 박기석 on 11/14/24.
//

import RxSwift
import Combine

final class From: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx from
        Observable.from([1, 2, 3])
            .subscribe(onNext: {
                debugPrint("RxSwift")
                debugPrint($0)
            })
            .disposed(by: disposeBag)
        
        // Combine from
        [1, 2, 3].publisher
            .sink {
                debugPrint("Combine")
                debugPrint($0)
            }
            .store(in: &cancellables)
    }
}

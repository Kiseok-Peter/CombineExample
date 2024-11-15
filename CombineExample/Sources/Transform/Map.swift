//
//  Map.swift
//  CombineExample
//
//  Created by 박기석 on 11/15/24.
//

import RxSwift
import Combine

final class Map: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx map
        Observable.just(1)
            .map { $0 + 1 }
            .subscribe(onNext: {
                debugPrint("RxSwift")
                debugPrint($0)
            })
            .disposed(by: disposeBag)
        
        // Combine map
        Combine.Just(1)
            .map { $0 + 1 }
            .sink {
                debugPrint("Combine")
                debugPrint($0)
            }
            .store(in: &cancellables)
    }
}

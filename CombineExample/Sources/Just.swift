//
//  Just.swift
//  CombineExample
//
//  Created by 박기석 on 11/14/24.
//

import RxSwift
import Combine

final class JustTest {
    let disposeBag = DisposeBag()
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Rx Just
        Observable.just(1)
            .subscribe(onNext: {
                debugPrint("RxSwift")
                debugPrint($0)
            })
            .disposed(by: disposeBag)
        
        // Combine Just
        Just(1)
            .sink {
                debugPrint("Combine")
                debugPrint($0)
            }
            .store(in: &cancellables)
    }
}


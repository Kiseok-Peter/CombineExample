//
//  ObserveOn.swift
//  CombineExample
//
//  Created by 박기석 on 11/18/24.
//

import Foundation
import RxSwift
import Combine

final class ObserveOn: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        Task(priority: .background) {
            // Rx observe on
            Observable.just(Void())
                .do(onNext: {
                    debugPrint("RxSwift")
                    debugPrint(Thread.isMainThread)
                })
                .observe(on: MainScheduler.asyncInstance)
                .subscribe(onNext: {
                    debugPrint("RxSwift")
                    debugPrint(Thread.isMainThread)
                })
                .disposed(by: disposeBag)
            
            // Combine observe on
            Combine.Just(Void())
                .handleEvents(receiveOutput: {
                    debugPrint("Combine")
                    debugPrint(Thread.isMainThread)
                })
                .receive(on: DispatchQueue.main)
                .sink {
                    debugPrint("Combine")
                    debugPrint(Thread.isMainThread)
                }
                .store(in: &cancellables)
        }
    }
}

//
//  MapError.swift
//  CombineExample
//
//  Created by 박기석 on 11/15/24.
//

import Foundation
import Combine

final class MapError: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Combine mapError
        Fail(error: NSError(domain: "test", code: 1001))
            .mapError {
                guard $0.code == 1001 else { return $0 }
                return NSError(domain: "test_2", code: 1010)
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    debugPrint("Combine Completed")
                case .failure(let failure):
                    debugPrint("Combine Error")
                    debugPrint(failure)
                }
            }, receiveValue: {
                debugPrint("Combine Next")
            })
            .store(in: &cancellables)
    }
}

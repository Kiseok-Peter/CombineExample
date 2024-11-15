//
//  ReplaceNil.swift
//  CombineExample
//
//  Created by 박기석 on 11/15/24.
//

import Combine

final class ReplaceNil: TestProtocol {
    var cancellables: [AnyCancellable] = []
    
    func test() {
        // Combine replaceNil
        [1, 2, nil, 3].publisher
            .replaceNil(with: -1)
            .sink { value in
                guard let value else { return }
                
                debugPrint("Combine")
                debugPrint(value)
            }
            .store(in: &cancellables)
    }
}

//
//  TestProtocol.swift
//  CombineExample
//
//  Created by 박기석 on 11/14/24.
//

import Foundation
import RxSwift
import Combine

protocol TestProtocol {
    var disposeBag: DisposeBag { get }
    var cancellables: [AnyCancellable] { get }
    
    func test()
}

private var disposeBagKey = "dispose_bag_key"
private var cancellablesKey = "cancellables_key"
extension TestProtocol {
    var disposeBag: DisposeBag {
        get {
            withUnsafePointer(to: &disposeBagKey) {
                objc_getAssociatedObject(self, $0) as? DisposeBag ?? DisposeBag()
            }
        }
        set {
            withUnsafePointer(to: &disposeBagKey) {
                objc_setAssociatedObject(self, $0, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}

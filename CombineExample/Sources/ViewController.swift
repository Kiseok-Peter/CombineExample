//
//  ViewController.swift
//  CombineExample
//
//  Created by 박기석 on 11/14/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        // Create
//        Just().test()
//        From().test()
//        Deferred().test()
//        NeverTest().test()
//        ErrorTest().test()
        
        // Transform
//        Map().test()
//        FlatMap().test()
        
        // Transform Combine
//        MapError().test()
//        ReplaceNil().test()
        
        // Filter
//        Filter().test()
//        Distinct().test()
//        Take().test()
        
        // Combining
//        CombineLatest().test()
        Merge().test()
    }
}

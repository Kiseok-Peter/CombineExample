//
//  ViewController.swift
//  CombineExample
//
//  Created by 박기석 on 11/14/24.
//

import UIKit

class ViewController: UIViewController {
    let test = Deferred()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
//        Just().test()
//        From().test()
//        Deferred().test()
//        NeverTest().test()
//        ErrorTest().test()
        Map().test()
    }
}

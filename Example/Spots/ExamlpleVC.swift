//
//  ExamlpleVC.swift
//  Spots_Example
//
//  Created by 许允是 on 2019/12/6.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import PublicProtocols
import Spots

class ExamlpleVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func method(_ sender: Any) {
        let imp = SpotsManager.shared.dequeueImpFor(ModuleA.self) as! ModuleA
        imp.methodA()
    }
    
    @IBAction func count(_ sender: Any) {
        let imp = SpotsManager.shared.dequeueImpFor(ModuleA.self) as! ModuleA
        print(imp.getCount())
    }
    
    @IBAction func obj(_ sender: Any) {
        let imp = SpotsManager.shared.dequeueImpFor(ModuleA.self) as! ModuleA
        print(imp.getObject())
    }
}

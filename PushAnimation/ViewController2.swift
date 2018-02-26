//
//  ViewController2.swift
//  PushAnimation
//
//  Created by UVIONICS on 26/02/18.
//  Copyright © 2018 Citta.ai. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonActionPop(_ sender: Any) {

        self.dismiss(animated: true, completion: nil)
    }

}

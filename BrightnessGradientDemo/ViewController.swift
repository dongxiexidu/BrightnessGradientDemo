//
//  ViewController.swift
//  BrightnessGradientDemo
//
//  Created by fashion on 2018/11/23.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func jumpQRVC(_ sender: Any) {
        let vc = QRCodeController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}


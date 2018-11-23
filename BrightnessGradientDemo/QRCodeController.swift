//
//  QRCodeController.swift
//  BrightnessGradientDemo
//
//  Created by fashion on 2018/11/23.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit

class QRCodeController: UIViewController {
    
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    DXBrightness.saveDefaultBrightness()
    DXBrightness.graduallySetBrightness(value: 0.8)
}
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    DXBrightness.graduallyResumeBrightness()
}

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "二维码"
        view.backgroundColor = UIColor.white
        addImageView()
    }
    
    func addImageView() {
        let imageV = UIImageView.init(image: UIImage.init(named: "qrcode"))
        imageV.frame = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        imageV.center = view.center
        view.addSubview(imageV)
    }
    
    


}

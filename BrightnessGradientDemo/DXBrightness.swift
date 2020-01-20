//
//  DXBrightness.swift
//  BrightnessGradientDemo
//
//  Created by fashion on 2018/11/23.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit


class DXBrightness: NSObject {
    
    fileprivate static var currentBrightness : CGFloat = 0
    fileprivate static var queue : OperationQueue!

    public class func saveDefaultBrightness() {
        currentBrightness = UIScreen.main.brightness
        notificationAppActive()
    }
    
    deinit {
        print("DXBrightness ---deinit")
        NotificationCenter.default.removeObserver(self)
    }
    
    private class func notificationAppActive(){
        NotificationCenter.default.addObserver(self, selector: #selector(willResignActive), name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    //成为激活状态，调高亮度
    @objc private class func didBecomeActive() {
        DXBrightness.graduallySetBrightness(value: 0.8)
    }
    //失去激活状态，快速恢复之前的亮度
    @objc private class func willResignActive() {
        DXBrightness.fastResumeBrightness()
    }
    
    public class func graduallySetBrightness(value : CGFloat) {
        if queue == nil {
            queue = OperationQueue.init()
            queue.maxConcurrentOperationCount = 1
        }
        queue.cancelAllOperations()
        let brightness : CGFloat = UIScreen.main.brightness
        let step : CGFloat = 0.005 * ((value > brightness) ? 1 : -1)
        let times : Int = Int(fabsf(Float((value - brightness)/0.005)))
        
        for i in 0...times {
            queue.addOperation {
                Thread.sleep(forTimeInterval: 1/180)
                DispatchQueue.main.async {
                    UIScreen.main.brightness = brightness + CGFloat(i) * step
                }
            }
        }
        
    }
    
    public class func graduallyResumeBrightness(){
        graduallySetBrightness(value: currentBrightness)
        // 当最大并发操作数为1时，操作是按顺序串行执行的，并且一个操作完成之后，下一个操作才开始执行
        queue.addOperation {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    public class func fastResumeBrightness(){
        if queue == nil {
            queue = OperationQueue.init()
            queue.maxConcurrentOperationCount = 1
        }
        queue.cancelAllOperations()
        queue.addOperation {
            DispatchQueue.main.async {
                UIScreen.main.brightness = currentBrightness
            }
        }
    }
}

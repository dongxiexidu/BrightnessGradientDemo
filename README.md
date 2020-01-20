# BrightnessGradientDemo

仿支付宝微信二维码界面屏幕亮度自动调亮,返回其他界面屏幕恢复原来亮度.
## usage
```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    DXBrightness.saveDefaultBrightness()
    DXBrightness.graduallySetBrightness(value: 0.8)
}
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    DXBrightness.graduallyResumeBrightness()
}
```

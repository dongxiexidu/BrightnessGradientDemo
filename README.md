# BrightnessGradientDemo
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

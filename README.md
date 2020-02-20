# Spots

![spotsstore_1024pt](https://github.com/xuyunshi/Spots/blob/master/Example/Spots/Images.xcassets/AppIcon.appiconset/spotsstore_1024pt.png)

## Example
```swift
SpotsManager.shared.registerImp(ModuleAImp(), for: ModuleA.self)

let imp = SpotsManager.shared.dequeueImpFor(ModuleA.self) as! ModuleA

imp.methodA()
```

# GENUI

The Genui is a tool for create uidesign of source code, aimed at making it easy implemented your code.

We’ve designed the package to make it really easy to create us elements for designed your interface.

***

## Table of Contents

* [**Overview**](README.md)
  * [About Packages](#about-packages)
  * [About Components](#about-components)
    * [ViewUI](#viewui)
    * [StepperUI](#stepperui)
    * [CheckboxUI](#checkboxui)
    * [SliderUI](#sliderui)
    * [SwitchUI](#switchui)
    * [Textfield](#textfield)
    * [Label](#label)
    * [RoundButtonGradient](#roundbuttongradient)

## About Packages

A package consists of Swift source files, including the `Package.swift` manifest file. The manifest file, or package manifest, defines the package's name and its contents using the PackageDescription module. A package has one or more targets. Each target specifies a product and may declare one or more dependencies.

***


## About Components


### ViewUI

```swift
var viewUI: ViewUI = ViewUI()
viewUI.height = UIScreen.main.bounds.height
viewUI.width = UIScreen.main.bounds.width
viewUI.radiusCorner = 50
viewUI.cornerRadiusBottomRight = false
viewUI.cornerRadiusTopRight = true
viewUI.cornerRadiusTopLeft = false
viewUI.cornerRadiusBottomLeft = true
viewUI.marginTop = 50
viewUI.marginRight = 30
viewUI.marginLeft = 30
viewUI.marginBottom = 20
viewUI.startColor = UIColor.blue
viewUI.endColor = UIColor.orange
self.view.addSubview(viewUI)
```

![HTPressableButton](https://github.com/risrael-1/Package_genui/blob/master/Sources/GENUI/ImagesDemo/exempleViewUI.png)


### StepperUI


You can implement the elements in the .xib like the example below

***

![HTPressableButton](https://github.com/risrael-1/Package_genui/blob/master/Sources/GENUI/ImagesDemo/exempleStepperUI.png)

***

![HTPressableButton](https://github.com/risrael-1/Package_genui/blob/master/Sources/GENUI/ImagesDemo/exempleStepperUI.gif)


### CheckboxUI

```swift
    let check = CheckBox(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    check.colorCheck = .blue
    check.isChecked = true
    check.colorUnCheck = .brown
    check.isImageFill = false
    self.view.addSubview(check)
```

![HTPressableButton](https://github.com/risrael-1/Package_genui/blob/master/Sources/GENUI/ImagesDemo/exempleCheckBoxUI.png)


### SliderUI

```swift
    let slider = SliderUI(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    slider.minValue = 0
    slider.maxValue = 60
    slider.sliderColor = .blue
    slider.marginLeft = 10.0
    slider.marginRight = 10.0
    slider.marginTop = 10
    slider.marginBottom = 50
    slider.height = 20
    slider.width = 50
    self.view.addSubview(slider)
```
![HTPressableButton](https://github.com/risrael-1/Package_genui/blob/master/Sources/GENUI/ImagesDemo/exempleSliderUI.png)


### SwitchUI

```swift
    let switchui = SwitchUI(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    switchui.switchColorOn = .brown
    switchui.switchColorOff = .red
    switchui.marginLeft = 10.0
    switchui.marginRight = 10.0
    switchui.marginTop = 10
    switchui.marginBottom = 50
    switchui.height = 20
    switchui.width = 50
    switchui.on = true
    switchui.off = false
    self.view.addSubview(switchui)
```

![HTPressableButton](https://github.com/risrael-1/Package_genui/blob/master/Sources/GENUI/ImagesDemo/exempleSwitchUI.png)

### Textfield

```swift
        var textfield = Textfield(frame: CGRect(x: 10, y: 10, width: 300, height: 400))
        textfield.text = "text »
        textfield.textfieldColor = UIColor.red
        textfield.placeholder = "placeholder"
        textfield.minimumFontSize = 12
        textfield.textColor = UIColor.blue
        self.view.addSubview(textfield)
```

![HTPressableButton](https://github.com/risrael-1/Package_genui/blob/master/Sources/GENUI/ImagesDemo/exempleTextfield.png)

[HTPressableButton](https://github.com/risrael-1/Package_genui/blob/master/Sources/GENUI/ImagesDemo/exempleTextfieldPlaceholder.png)


### Label

```swift
        var label = Label(frame: CGRect(x: 10, y: 10, width: 300, height: 400))
        label.text = "test"
        label.numberOfLines = 1
        label.textColor = UIColor.blue
        label.colorBackground = UIColor.red
        self.view.addSubview(label)
```

![HTPressableButton](https://github.com/risrael-1/Package_genui/blob/master/Sources/GENUI/ImagesDemo/exempleLabel.png)

### RoundButtonGradient

```swift
        var button = RoundButtonGradient(frame: CGRect(x: 10, y: 10, width: 300, height: 400))
        button.topGradientColor = UIColor.red
        button.cornerRadius = 20
        button.bottomGradientColor = UIColor.red
        button.imageBackground = UIImage.init(named: "image")
        button.position = .center
 
        self.view.addSubview(button)
```

![HTPressableButton](https://github.com/risrael-1/Package_genui/blob/master/Sources/GENUI/ImagesDemo/exempleRoundButtonGradient.png)

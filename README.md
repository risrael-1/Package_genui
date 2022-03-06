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
    * [SegmentedView](#segmentedview)

## About Packages

A package consists of Swift source files, including the `Package.swift` manifest file. The manifest file, or package manifest, defines the package's name and its contents using the PackageDescription module. A package has one or more targets. Each target specifies a product and may declare one or more dependencies.

***


## About Components


### ViewUI

```objective-c
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


### SegmentedView

after adding a view in your xib, You can use this implementation for the segmentedView

```objective-c
enum stepSegment: Int {
    case step1 = 0
    case step2 = 1
}

@IBOutlet weak var view: UIView!

private var segmentedViewController: SegmentedViewController!
var selectedSegment: stepSegment = .step1
```
***

```objective-c
var viewControllers: [UIViewController?] = []

let segmentedViewController = SegmentedViewController()

let stepOneViewController = StepOneViewController()
stepOneViewController.title = "step1"
viewControllers.append(stepOneViewController)

let stepTwoViewController = StepTwoViewController()
stepTwoViewController.title = "step2"
viewControllers.append(stepTwoViewController)


segmentedViewController.backgroundColor = UIColor.red
segmentedViewController.mode = .standAlone(color: UIColor.blue)

segmentedViewController.viewControllers = viewControllers.compactMap{$0}

let anim = self.addFullScreenChildViewController(segmentedViewController, in: self.viewTest)
anim()

self.segmentedViewController = segmentedViewController
self.setSelectedViewController()

```
***

```objective-c
private func setSelectedViewController() {
    self.segmentedViewController.setSelectedViewController(at: self.selectedSegment.rawValue)
}
```

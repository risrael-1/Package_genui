# GENUI

The Genui is a tool for create uidesign of source code, aimed at making it easy implemented your code.

We’ve designed the package to make it really easy to create us elements for designed your interface.

***

## Table of Contents

* [**Overview**](README.md)
  * [About Packages](#about-packages)
  * [About Components](#about-components)
    * [ViewUI](#viewui)

## About Packages

A package consists of Swift source files, including the `Package.swift` manifest file. The manifest file, or package manifest, defines the package's name and its contents using the PackageDescription module. A package has one or more targets. Each target specifies a product and may declare one or more dependencies.

***


## About Components


### ViewUI

```objective-c
var viewUI: ViewUI = ViewUI.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
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

# RMNibLoadedView

Support for views loaded from NIB/XIB files from code and interface builder.
Respects IBInspectable / IBDesignable options. Inspired by https://github.com/konoma/nib-loaded-views.


[![Version](https://img.shields.io/cocoapods/v/RMNibLoadedView.svg?style=flat)](http://cocoapods.org/pods/RMNibLoadedView)
[![License](https://img.shields.io/cocoapods/l/RMNibLoadedView.svg?style=flat)](http://cocoapods.org/pods/RMNibLoadedView)
[![Platform](https://img.shields.io/cocoapods/p/RMNibLoadedView.svg?style=flat)](http://cocoapods.org/pods/RMNibLoadedView)

![Alt Text](https://github.com/byzyn4ik/RMNibLoadedView/GIFs/demo.gif)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

RMNibLoadedView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RMNibLoadedView"
```
## Usage

Create a view subclass of RMNibLoadedView .If you want to view be watchen in storyboards add IB_DESIGNABLE tag before @inteface CustomView  :RMNibLoadedView.
Create  a xib which will have views. By default RMNibLoadedView loads xib with the class name in class bundle and using first view. You can customize it by changing nibName and nibViewIndex in interface builder or from code.

## Author

Maks Petrovsky, byzyn4ik@gmail.com

## License

RMNibLoadedView is available under the MIT license. See the LICENSE file for more info.

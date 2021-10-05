# ReactToOrientation

## A demo project

React to orientation is an `UIKit` demo project illustrating how we can detect device orientation changes and react to them accordingly.

## How it started

This demo project was originally created to help students and iOS developers understanding how the `UIViewController` life cycle works, particularly during the device rotation phase. 

Additionnally, this project helps to depictate a common misconception that we have among iOS developers which is that we should use the device orientation to define interface elements (e.g. text on UILabels) which depends on the actual interface orientation.

As an iOS developer, we should really make a difference between:

Device Orientation => Indicates the orientation of the physical device
Interface Orientation => Indicates the orientation of the interface displayed on the screen
There are many scenarios where those 2 values are mismatching such as:

- When you lock your screen orientation
- When you have your device flat

As a result, it is important to use the interface orientation as opposed to the device orientation.

_Stackoverflow_ question / response: https://stackoverflow.com/a/60577486/8780127

## Compatibility

The demo app is made both for iOS and iPadOS.

## How to use it

1. First you'll have to clone the repo and open the project in Xcode.
The project should be ready to run as it is except from the code sign-in that would need to be swapped with yours.

2. After having experimented on your phone the behavior with standard setting (`viewDidAppear` + `traitCollectionWillChange`), you can change the `lifecycleStepsUpdatingLabel` array to update the labels at different view lifecycle event.

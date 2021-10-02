# ReactToOrientation

## A demo project

React to orientation is a demo project illustrating how we can detect orientation changes and react to them accordingly. The app is currently made only for iOS and iPadOS.

## How to use it

1. First you'll have to clone the repo and open the project in Xcode.
The project should be ready to run as it is except from the code sign-in that would need to be swapped with yours.

2. After having experimented on your phone the behavior with standard setting (viewDidAppear + traitCollectionWillChange), you can change the 'lifecycleStepsUpdatingLabel' array to update the label at different view lifecycle event.

# FoodTracker
https://developer.apple.com/library/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson8.html

Food Tracker Learnings:
=====================

Change text of RETURN button

Stack View + auto layout + items of new constraints

Be specific where possible - IBAction - sender - UIButton instead of AnyObject

 MARK Keyword

Add bar buttons via code

Data persistence - NSCoding

Structures + static constants as a way of storing KEY values

required, convenience and designated initialisers
presentingViewController is UINavigationController - to distinguish between model and push presentation for the same view controller

Image View + ‘user interaction enabled’

The type of dismissal depends on the type of presentation. You’ll implement a check that determines how the current scene was presented when the user taps the Cancel button. If it was presented modally (using the Add button), it’ll be dismissed using dismissViewControllerAnimated(_:completion:). If it was presented with push navigation (using a table view cell), it will be dismissed by the navigation controller that presented it.

gesture recognition (views vs controls)

UITableViewController gives you access to variable tableView

understanding the prepareForSegue function call

intrinsicContentSize

using underscore i.e. for _ in 0..<5

The layoutSubviews method

Table view cell + selection field

Navigation Controllers -  navigation controller manages transitions backward and forward through a series of view controllers. The set of view controllers managed by a particular navigation controller is called its navigation stack. The first item added to the stack becomes the root view controller and is never popped off (removed from) the navigation stack. Because you’re using a navigation controller with a show segue, the backward navigation is handled for you, and a back button automatically appears in the meal scene. 

A modal view controller doesn’t get added to the navigation stack, so it doesn’t get a navigation bar from the meal list’s navigation controller. However, you want to keep the navigation bar to provide the user with visual continuity. To give the meal scene a navigation bar when presented modally, embed it in its own navigation controller.

An unwind segue moves backward through one or more segues to return the user to an existing instance of a view controller. You use unwind segues to implement reverse navigation. The next step in creating the unwind segue is to add an action method to the destination view controller (the view controller that the segue is going to). This method must be marked with the IBAction attribute and take a segue (UIStoryboardSegue) as a parameter. Because you want to unwind back to the meal list scene, you need to add an action method with this format to MealTableViewController.swift.

The enumerate() method

Unit Test Cases

nil coalescing operator (??) 

cool concept for setting RATINGS 

Update Constraints.

didset method

CTLR + I

setNeedsLayout()

failable and nonfailable initializers

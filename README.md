# UpperOS

![Image of UpperOS being used](/README-assets/upperos.gif)

This is it: Smoogy's first foray into low level, macOS Software Engineering.

This app simply takes a string and uppercases it, and then saves it to a log. No, not with Swift's `uppercased()` function - with an Objective-C framework that interfaces with a daemon, of course.

Here's a diagram:

![UpperOS flow diagram](/README-assets/UpperOS.png)

It starts with UpperOS, which is a SwiftUI macOS app. It passes a string to Relay - an Objective-C framework. Then, UpperXPC, a daemon that is communicated to via XPC, uppercases the string, and sends it back to Relay, which passes it onto UpperOS.

All in the name of self-improvement and education. :)

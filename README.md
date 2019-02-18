# SwiftDebugLog


[![CI Status](https://img.shields.io/travis/Dtroupe18/SwiftDebugLog.svg?style=flat)](https://travis-ci.org/Dtroupe18/SwiftDebugLog)
[![Version](https://img.shields.io/cocoapods/v/SwiftDebugLog.svg?style=flat)](https://cocoapods.org/pods/SwiftDebugLog)
[![License](https://img.shields.io/cocoapods/l/SwiftDebugLog.svg?style=flat)](https://cocoapods.org/pods/SwiftDebugLog)
[![Platform](https://img.shields.io/cocoapods/p/SwiftDebugLog.svg?style=flat)](https://cocoapods.org/pods/SwiftDebugLog)

Simple Swift Debug Logger inspired by [this medium post](https://medium.com/@sauvik_dolui/developing-a-tiny-logger-in-swift-7221751628e6)


## Purpose:

1. Global wrapping of the print function. All print statements will be removed at compile time unless your code is compiled in    Debug. **Debug printing in production can be done using:** ```Log.logProduction(error)```

2. Allows you to easily log errors that include the file name, line, and function name without additional typing. 


## Sample Output:

2019-02-17 15:29:25.627-0500 🐛🐛🐛🐛 [ViewController.swift] line: 25 logInProduction() -> This log always prints!

2019-02-17 15:29:25.633-0500 😡 [ViewController.swift] line: 33 trySomething() -> The item couldn’t be opened because the file name “” is invalid.

2019-02-17 15:29:25.633-0500 🕵 [ViewController.swift] line: 43 makeApiCall() -> ["userId": 1, "id": 1, "title": "delectus aut autem"]

2019-02-17 15:29:25.634-0500 ⚠️ [ViewController.swift] line: 48 doSomethingWith(optional:) -> Optional is nil!

2019-02-17 15:29:25.634-0500 🚨🚨 [ViewController.swift] line: 55 doSomethingReallyImportant(shouldCrash:) -> Crashing for some reason


## Code to create the above logging:

```swift
    func logInProduction() {
        // This should only be used when debugging in production!
        Log.logProduction("This log always prints!")
    }

    func trySomething() {
        do {
        // Something that might throw an error
            let _ = try String(contentsOfFile: "")
        } catch let error {
            Log.logError(error.localizedDescription)
        }
    }

    func makeApiCall() {
        let json: [String: Any] = [
            "userId": 1,
            "id": 1,
            "title": "delectus aut autem"
        ]

        Log.logDebug(json)
    }

    func doSomethingWith(optional: String?) {
        guard let string = optional else {
            Log.logWarning("Optional is nil!")
            return
        }
    }

    func doSomethingReallyImportant(shouldCrash: Bool) {
        if shouldCrash {
            Log.logSevere("Crashing for some reason")
            fatalError()
        }
    }
```


## Logging Levels

1. Error = 😡 
2. Debug = 🕵
3. Warning = ⚠️
4. Severe = 🚨🚨
5. Production = 🐛🐛🐛🐛


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

SwiftDebugLog is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftDebugLog'
```

or copy and paste [Log.swift](https://github.com/dtroupe18/SwiftDebugLog/blob/master/SwiftDebugLog/Classes/Log.swift) into your project! Using this method prevents you from having to `import SwiftDebugLog` in your files and it also globally wraps `print` into debug only.


## License

SwiftDebugLog is available under the MIT license. See the LICENSE file for more info.

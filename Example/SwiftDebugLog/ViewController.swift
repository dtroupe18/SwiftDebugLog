//
//  ViewController.swift
//  Log
//
//  Created by Dave Troupe on 2/17/19.
//  Copyright © 2019 Dave Troupe. All rights reserved.
//

import UIKit
import SwiftDebugLog

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        logInProduction()
        trySomething()
        makeApiCall()
        doSomethingWith(optional: nil)
        doSomethingReallyImportant(shouldCrash: true)
    }

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

        print("this string only prints in debug: \(string)")
    }

    func doSomethingReallyImportant(shouldCrash: Bool) {
        if shouldCrash {
            Log.logSevere("Crashing for some reason")
            fatalError()
        }
    }
}

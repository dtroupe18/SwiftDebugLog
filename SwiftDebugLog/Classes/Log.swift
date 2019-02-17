//
//  Log.swift
//
//  Copyright 2019 David Troupe
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
//  (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,
//  publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
//  FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  Inspired by: https://medium.com/@sauvik_dolui/developing-a-tiny-logger-in-swift-7221751628e6
//

import Foundation

public enum LogEvent: String {
    case error = "😡 "
    case debug = "🕵 "
    case warning = "⚠️ "
    case severe = "🚨🚨 "
    case production = "🐛🐛🐛🐛 "
}

public func print(_ object: Any) {
    #if DEBUG
    Swift.print(object)
    #endif
}

fileprivate func productionPrint(_ object: Any) {
    Swift.print(object)
}

public class Log {
    static var dateFormat = "yyyy-MM-dd HH:mm:ss.SSSZ"

    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }

    private static var isLoggingEnabled: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }

    public static func logError( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            print("\(Date().toString()) \(LogEvent.error.rawValue)[\(sourceFileName(filePath: filename))] line: \(line) \(funcName) -> \(object)")
        }
    }

    public static func logDebug( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            print("\(Date().toString()) \(LogEvent.debug.rawValue)[\(sourceFileName(filePath: filename))] line: \(line) \(funcName) -> \(object)")
        }
    }

    public static func logWarning( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            print("\(Date().toString()) \(LogEvent.warning.rawValue)[\(sourceFileName(filePath: filename))] line: \(line) \(funcName) -> \(object)")
        }
    }

    public static func logSevere( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            print("\(Date().toString()) \(LogEvent.severe.rawValue)[\(sourceFileName(filePath: filename))] line: \(line) \(funcName) -> \(object)")
        }
    }

    public static func logProduction( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        productionPrint("\(Date().toString()) \(LogEvent.production.rawValue)[\(sourceFileName(filePath: filename))] line: \(line) \(funcName) -> \(object)")
    }

    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}

internal extension Date {
    func toString() -> String {
        return Log.dateFormatter.string(from: self as Date)
    }
}

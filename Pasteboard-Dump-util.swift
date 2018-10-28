//
//  main.swift
//  PasteboardDump
//
//  Created by Shannon Lucas on 8/18/18.
//  Copyright © 2018 Pickles. All rights reserved.
//

import Foundation
import Cocoa

var delay: (Double) = 10
if CommandLine.argc < 2 {
    print("[*] Default delay is 10 seconds.")
} else if let arg: (Double) = (Double(CommandLine.arguments[1])) {
    delay = arg
    print("[*] Delay set to \(arg) seconds")
} else {
}

while true {
    Thread.sleep(until: Date(timeIntervalSinceNow: (Double(delay))))
    let pasteboard = NSPasteboard.general
    
    var clipboardItems: [String] = []
    for element in pasteboard.pasteboardItems! {
        if let str = element.string(forType: NSPasteboard.PasteboardType(rawValue: "public.utf8-plain-text")) {
            clipboardItems.append(str)
        }
    }
    
    for item in clipboardItems {
        print("\u{001B}[0;35m[*] Clipboard data: " + "\u{001B}[0;32m\(item as String)" + "\u{001B}[0;0m")
    }
}
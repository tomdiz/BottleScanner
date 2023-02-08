//
//  BottleScannerApp.swift
//  BottleScanner
//
//  Created by Thomas DiZoglio on 2/7/23.
//

import SwiftUI

@main
struct BottleScannerApp: App {

    @StateObject private var modelData = viewModelBottles()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}

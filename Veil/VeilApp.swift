//
//  VeilApp.swift
//  Veil
//
//  Created by Bennett Ferguson on 2026-11-10.
//

import SwiftUI

@main
struct VeilApp: App {
    var body: some Scene {
        MenuBarExtra("Veil" , systemImage: "eye.slash") {
            ContentView()
        }
        .menuBarExtraStyle(.window)
    }
}

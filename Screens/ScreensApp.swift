//
//  ScreensApp.swift
//  Screens
//
//  Created by Prathamesh Kowarkar on 06/10/20.
//

import SwiftUI

@main
struct ScreensApp: App {

    @ObservedObject var externalDisplayContent = ExternalDisplayContent()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(externalDisplayContent)
        }
    }

}

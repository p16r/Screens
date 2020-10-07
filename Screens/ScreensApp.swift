//
//  ScreensApp.swift
//  Screens
//
//  Created by Prathamesh Kowarkar on 06/10/20.
//

import Combine
import SwiftUI

@main
struct ScreensApp: App {

    @ObservedObject var externalDisplayContent = ExternalDisplayContent()

    private var screenDidConnectPublisher: AnyPublisher<UIScreen, Never> {
        NotificationCenter.default
            .publisher(for: UIScreen.didConnectNotification)
            .compactMap { $0.object as? UIScreen }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    private var screenDidDisconnectPublisher: AnyPublisher<UIScreen, Never> {
        NotificationCenter.default
            .publisher(for: UIScreen.didDisconnectNotification)
            .compactMap { $0.object as? UIScreen }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(externalDisplayContent)
                .onReceive(
                    screenDidConnectPublisher,
                    perform: screenDidConnect
                )
                .onReceive(
                    screenDidDisconnectPublisher,
                    perform: screenDidDisconnect
                )
        }
    }

    private func screenDidConnect(_ screen: UIScreen) {
        //  Coming soon…
        externalDisplayContent.isShowingOnExternalDisplay = true
    }

    private func screenDidDisconnect(_ screen: UIScreen) {
        //  Coming soon…
        externalDisplayContent.isShowingOnExternalDisplay = false
    }

}

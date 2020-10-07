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
    @State var additionalWindows: [UIWindow] = []

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
        let window = UIWindow(frame: screen.bounds)

        window.windowScene = UIApplication.shared.connectedScenes
            .first { ($0 as? UIWindowScene)?.screen == screen }
            as? UIWindowScene

        let view = ExternalView()
            .environmentObject(externalDisplayContent)
        let controller = UIHostingController(rootView: view)
        window.rootViewController = controller
        window.isHidden = false
        additionalWindows.append(window)
        externalDisplayContent.isShowingOnExternalDisplay = true
    }

    private func screenDidDisconnect(_ screen: UIScreen) {
        //  Coming soon…
        externalDisplayContent.isShowingOnExternalDisplay = false
    }

}

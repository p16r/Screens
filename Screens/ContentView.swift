//
//  ContentView.swift
//  Screens
//
//  Created by Prathamesh Kowarkar on 06/10/20.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var externalDisplayContent: ExternalDisplayContent

    var body: some View {
        NavigationView {
            Form {
                if externalDisplayContent.isShowingOnExternalDisplay == false {
                    Section(header: Text("Output")) {
                        Text(externalDisplayContent.string)
                    }
                }
                Section(header: Text("Input")) {
                    TextField("Text", text: $externalDisplayContent.string)
                }
            }
            .navigationTitle("Screens")
        }
    }

}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }

}

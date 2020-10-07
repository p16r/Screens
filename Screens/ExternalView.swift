//
//  ExternalView.swift
//  Screens
//
//  Created by Prathamesh Kowarkar on 07/10/20.
//

import SwiftUI

struct ExternalView: View {

    @EnvironmentObject var externalDisplayContent: ExternalDisplayContent

    var body: some View {
        Text(externalDisplayContent.string)
    }

}

struct ExternalView_Previews: PreviewProvider {

    static var previews: some View {
        ExternalView()
    }

}

//
//  FlagView.swift
//  Plates
//
//  Created by Madison L.H. Wass on 6/11/24.
//  Copyright © 2024 Madison L.H. Wass. All rights reserved.
//

import FlagKit
import SwiftUI

struct FlagView: View {
    @State var country: String
    
    init(_ country: String) {
        self.country = country
    }
    
    var body: some View {
        #if os(macOS)
        Image(nsImage: Flag(countryCode: country)?.originalImage ?? Flag(countryCode: "LGBT")!.originalImage)
        #else
        Image(uiImage: Flag(countryCode: country)?.image(style: .roundedRect) ?? Flag(countryCode: "LGBT")!.image(style: .roundedRect))
        #endif
    }
}

#Preview {
    FlagView("US")
}

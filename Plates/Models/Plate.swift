//
//  Plate.swift
//  Plates
//
//  Created by Madison L.H. Wass on 6/11/24.
//  Copyright © 2024 Madison L.H. Wass. All rights reserved.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Plate {
    var base: Base
    var county: String
    var special: String
    var number: String
    var expiration: Date
    var remarks: String
    var sensitive: Bool
    var favorite: Bool
    @Attribute(.externalStorage) var images: [Data]?
    
    init(base: Base, county: String, special: String, number: String, expiration: Date, remarks: String, sensitive: Bool, favorite: Bool, images: [Data]? = nil) {
        self.base = base
        self.county = county
        self.special = special
        self.number = number
        self.expiration = expiration
        self.remarks = remarks
        self.sensitive = sensitive
        self.favorite = favorite
        self.images = images
    }
    
    @ViewBuilder
    func makeListItem() -> some View {
        HStack {
            if isNotPreview {
                FlagView(self.base.country)
            }
            
            VStack(alignment: .leading, content: {
                Text(self.number)
                    .font(.headline)
                
                HStack {
                    if isNotPreview && !self.base.state.isEmpty {
                        Text(self.base.state)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        Text(self.base.name)
                            .font(.subheadline)
                    }
                }
            })
            
            Spacer()
            
            if !self.special.isEmpty {
                Image(systemName: "s.circle.fill")
            }
            
            if self.favorite {
                Image(systemName: "star.fill")
                    .symbolRenderingMode(.multicolor)
            }
        }
    }
}

#Preview {
    let plate = Plate(base: .init(country: "US", state: "Ohio", name: "Sunrise in Ohio", yearOfFirstIssue: "2022"), county: "Licking", special: "CBJ", number: "ABC123", expiration: .distantPast, remarks: "", sensitive: false, favorite: true)
    
    return List {
        plate.makeListItem()
    }
}

//
//  Base.swift
//  Plates
//
//  Created by Madison L.H. Wass on 6/11/24.
//  Copyright © 2024 Madison L.H. Wass. All rights reserved.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Base {
    var country: String
    var state: String
    var name: String
    var yearOfFirstIssue: String
    
    @Relationship(deleteRule: .cascade) var plates: [Plate] = []
    
    init(country: String, state: String, name: String, yearOfFirstIssue: String) {
        self.country = country
        self.state = state
        self.name = name
        self.yearOfFirstIssue = yearOfFirstIssue
    }
    
    @ViewBuilder
    func makeListItem() -> some View {
        HStack {
            FlagView(self.country)
            
            VStack(alignment: .leading, content: {
                Text(self.name)
                    .font(.headline)
                
                HStack {
                    if !self.state.isEmpty {
                        Text(self.state)
                            .font(.subheadline)
                    }
                    
                    if !self.yearOfFirstIssue.isEmpty {
                        Text(self.yearOfFirstIssue)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
            })
            
            Spacer()
        }.badge(self.plates.count)
    }
}

#Preview {
    let base = Base(country: "US", state: "Ohio", name: "Sunrise in Ohio", yearOfFirstIssue: "2022")
    return List {
        base.makeListItem()
    }
}

//
//  BaseListView.swift
//  Plates
//
//  Created by Madison L.H. Wass on 6/11/24.
//  Copyright © 2024 Madison L.H. Wass. All rights reserved.
//

import SwiftData
import SwiftUI

struct BaseListView: View {
    @Query var bases: [Base]
    @State private var searchQuery: String = ""
    @State private var searchScope: SearchScope = .country
    
    var filteredBases: [Base] {
        if searchQuery.isEmpty {
            return bases
        } else {
            switch searchScope {
            case .country:
                return bases.filter({$0.country.contains(searchQuery)})
            case .state:
                return bases.filter({$0.state.contains(searchQuery)})
            case .base:
                return bases.filter({$0.name.contains(searchQuery)})
            case .number:
                return []
            }
        }
    }
    
    var body: some View {
        NavigationSplitView(sidebar: {
            List(filteredBases) { base in
                NavigationLink(destination: {
                    
                }, label: {
                    base.makeListItem()
                })
            }
            .navigationTitle("Bases")
            .searchable(text: $searchQuery)
            .searchScopes($searchScope, scopes: {
                Text("Country")
                    .tag(SearchScope.country)
                Text("State")
                    .tag(SearchScope.state)
                Text("Name")
                    .tag(SearchScope.base)
            })
        }, detail: {
            
        })
    }
}

#Preview {
    BaseListView()
}

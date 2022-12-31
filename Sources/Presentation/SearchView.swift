//
//  SearchView.swift
//  
//
//  Created by AkkeyLab on 2022/12/29.
//

@_exported import SwiftUI
import Domain

public struct SearchView: View {
    @ObservedObject var presenter = SearchPresenter() // TODO: DI
    @State var selectedCorporation: Corporation?

    public init() {}

    public var body: some View {
        NavigationSplitView {
            List(presenter.corporations, id: \.id, selection: $selectedCorporation) { corporation in
                NavigationLink(corporation.name, value: corporation)
            }
        } detail: {
            if let corporation = selectedCorporation {
                Text(corporation.name)
            } else {
                Text("Empty")
            }
        }
        .onAppear {
            presenter.searchCorporate(name: "AkkeyLab")
        }
    }
}

private struct SearchViewPreviews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

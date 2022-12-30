//
//  SearchView.swift
//  
//
//  Created by AkkeyLab on 2022/12/29.
//

@_exported import SwiftUI

public struct SearchView: View {
    @ObservedObject var presenter = SearchPresenter() // TODO: DI

    public init() {}

    public var body: some View {
        List {
            ForEach(presenter.corporations) {
                Text($0.name)
            }
        }
        .padding()
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

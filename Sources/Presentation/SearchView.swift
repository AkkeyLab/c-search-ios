//
//  SearchView.swift
//  
//
//  Created by AkkeyLab on 2022/12/29.
//

@_exported import SwiftUI
import Domain

public struct SearchView<Presenter: SearchPresenterProtocol>: View {
    @StateObject private var presenter: Presenter
    @State private var selectedCorporation: Corporation?

    public init(presenter: Presenter = SearchPresenter()) {
        // https://docs.swift.org/swift-book/LanguageGuide/Properties.html
        _presenter = StateObject(wrappedValue: presenter)
    }

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

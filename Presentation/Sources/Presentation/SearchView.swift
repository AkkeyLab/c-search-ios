//
//  SearchView.swift
//  
//
//  Created by AkkeyLab on 2022/12/29.
//

@_exported import SwiftUI

public struct SearchView: View {
    public init() {}

    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

private struct SearchViewPreviews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

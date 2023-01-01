//
//  SearchPresenter.swift
//  
//
//  Created by AkkeyLab on 2022/12/30.
//

import Domain

public protocol SearchPresenterProtocol: ObservableObject {
    var corporations: [Corporation] { get set }

    func searchCorporate(name: String)
}

final public class SearchPresenter: SearchPresenterProtocol {
    @Published public var corporations: [Corporation] = []

    private let useCase: SearchCorporateUseCaseProtocol

    public init(useCase: SearchCorporateUseCaseProtocol = SearchCorporateUseCase()) {
        self.useCase = useCase
    }

    public func searchCorporate(name: String) {
        Task.detached { [weak self] in
            guard let self = self else { return }

            do {
                let corporations = try await self.useCase.search(name: name)
                await MainActor.run {
                    self.corporations = corporations
                }
            } catch {
                self.corporations = []
            }
        }
    }
}

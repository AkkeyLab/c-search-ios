//
//  SearchPresenter.swift
//  
//
//  Created by AkkeyLab on 2022/12/30.
//

import Domain

final class SearchPresenter: ObservableObject {
    @Published var corporations: [Corporation] = []

    private let useCase: SearchCorporateUseCaseProtocol

    init(useCase: SearchCorporateUseCaseProtocol = SearchCorporateUseCase()) {
        self.useCase = useCase
    }

    func searchCorporate(name: String) {
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

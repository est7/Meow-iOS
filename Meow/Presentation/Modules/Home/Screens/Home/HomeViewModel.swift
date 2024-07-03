//
//  HomeViewModel.swfit.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/2.
//

import Foundation
import Foundation
import CombineExt
import Stinsen
import Combine
import Factory


struct HomePageState {
    var keyword: String = ""
    var articles: [Article] = []
}

enum HomePageInput {
    case fetchData
    case showDetail(Article)
}

class HomeViewModel: ViewModel {
    
    @Published
    var state: HomePageState = HomePageState.init()
    
    let fetchDataStream = PassthroughRelay<Void>()
    private var cancellables = Set<AnyCancellable>()
    
    @RouterObject
    var router: HomeCoordinator.Router?
    
    //    @Injected(\.fetchHomePageUseCase)
    //    var fetchHomePageUseCase
    
    init() {
        initData()
    }
    
    func initData() {
        //        let fetchingArticles = fetchDataStream
        //            .prefix(1)
        //            .withUnretained(self)
        //            .flatMap { base, _ in
        //                base.fetchHomePage(keyword: "Apple")
        //            }
        //
        //        let searchingArticles = $state
        //            .map(\.keyword)
        //            .removeDuplicates()
        //            .dropFirst()
        //            .withUnretained(self)
        //            .flatMap { base, keyword in
        //                base.fetchHomePage(keyword: keyword)
        //            }
        //
        //        Publishers.Merge(fetchingArticles, searchingArticles)
        //            .assign(to: \.state.articles, on: self, ownership: .weak)
        //            .store(in: &cancellables)
    }
    
    private func fetchHomePage(keyword: String) -> AnyPublisher<[Article], Never> {
        //        fetchHomePageUseCase
        //            .execute(.init(keyword: keyword, page: 1, pageSize: 20))
        //            .map { $0.articles }
        //            .replaceError(with: [])
        //            .eraseToAnyPublisher()
        Just([Article]())
            .eraseToAnyPublisher()
    }
    
    func trigger(_ input: HomePageInput) {
        switch input {
        case .fetchData:
            fetchDataStream.accept()
        case .showDetail(let article):
            break
            //            router?.route(to: \.detail, article)
        }
    }
}

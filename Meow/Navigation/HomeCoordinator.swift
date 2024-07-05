//
//  HomeCoordinator.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/2.
//

import Foundation
import Stinsen
import SwiftUI

final class HomeCoordinator: NavigationCoordinatable {
    let stack = Stinsen.NavigationStack<HomeCoordinator>(initial: \HomeCoordinator.home)
    
    @Root
    var home = makeHomePage
    
        // @Route(.push)
        // var detail = makeHomePagePromptDetail
    
}

extension HomeCoordinator {
    func makeHomePage()->HomeScreen {
        HomeScreen(viewModel: AnyViewModel(HomeViewModel()))
    }
    
        // func makeHomePagePromptDetail(_ article: Article) -> PromptDetailScreen {
            // PromptDetailScreen(viewModel: AnyViewModel(PromptsDetailViewModel(article: article)))
        // }
}


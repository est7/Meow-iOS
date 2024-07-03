//
//  AppCoordinator.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/2.
//

import Foundation
import Stinsen
import SwiftUI

final class ChatCoordinator: NavigationCoordinatable {
    let stack = Stinsen.NavigationStack<ChatCoordinator>(initial: \ChatCoordinator.home)
    
    @Root
    var home = makeChatPage
    
    //    @Route(.push)
    //    var detail = makeChatDetailPage
    
}

extension ChatCoordinator {
    func makeChatPage()->ChatScreen {
        ChatScreen(viewModel: AnyViewModel(HomeViewModel()))
    }

    
}


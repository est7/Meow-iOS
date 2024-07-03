//
//  AppCoordinator.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/2.
//

import Foundation
import Stinsen
import SwiftUI

final class ProfileCoordinator: NavigationCoordinatable {
    let stack = Stinsen.NavigationStack<ProfileCoordinator>(initial: \ProfileCoordinator.home)
    
    @Root
    var home = makeProfilePage
    
    //    @Route(.push)
    //    var detail = makeSettingPage
    
}

extension ProfileCoordinator {
    func makeProfilePage()->ProfileScreen {
        ProfileScreen(viewModel: AnyViewModel(HomeViewModel()))
    }
    
    
}


//
//  AppCoordinator.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/2.
//

import Foundation
import Stinsen
import SwiftUI

final class AppCoordinator: TabCoordinatable {
  var child: Stinsen.TabChild = TabChild(
    startingItems: [
      \AppCoordinator.homePage,
      \AppCoordinator.chatPage,
      \AppCoordinator.profilePage,
    ])

  private var activeTab: Tab = .home {
    didSet {
      self.child.activeTab = activeTab.rawValue
    }
  }

  @ViewBuilder
  func customize(_ view: AnyView) -> some View {
    ZStack(alignment: .bottom) {
      view
      BottomNavigationBar(
        selectedTab: .init(
          get: {
            return Tab(rawValue: self.child.activeTab) ?? .home
          },
          set: { newValue in
            self.activeTab = newValue
          }
        )
      )
    }.ignoresSafeArea()
  }

  @Route(tabItem: makeHomeTabItem)
  var homePage = makeHomeCoordinator

  @Route(tabItem: makeChatTabItem)
  var chatPage = makeChatCoordinator

  @Route(tabItem: makeProfileTabItem)
  var profilePage = makeProfileCoordinator

  @ViewBuilder
  func makeHomeTabItem(isActive: Bool) -> some View {
    Label("Home", systemImage: "house")
  }

  @ViewBuilder
  func makeChatTabItem(isActive: Bool) -> some View {
    Label("Chat", systemImage: "message")
  }

  @ViewBuilder
  func makeProfileTabItem(isActive: Bool) -> some View {
    Label("Profile", systemImage: "person")
  }

  //    var searchPage = makeSearchCoordinator
  //    var settingPage = makeSettingCoordinator
  //    var splashPage = makeSplashCoordinator
  //    var loginPage = makeLoginCoordinator

}

extension AppCoordinator {
  func makeHomeCoordinator() -> NavigationViewCoordinator<HomeCoordinator> {
    .init(HomeCoordinator())
  }
  func makeChatCoordinator() -> NavigationViewCoordinator<ChatCoordinator> {
    .init(ChatCoordinator())
  }
  func makeProfileCoordinator() -> NavigationViewCoordinator<ProfileCoordinator> {
    .init(ProfileCoordinator())
  }

  //    func makeSearchCoordinator() -> NavigationViewCoordinator<SearchCoordinator> {
  //        .init(SearchCoordinator)
  //    }
  //    func makeSettingCoordinator() -> NavigationViewCoordinator<SettingCoordinator> {
  //        .init(SettingCoordinator)
  //    }
  //    func makeSplashCoordinator() -> NavigationViewCoordinator<SplashCoordinator> {
  //        .init(SplashCoordinator)
  //    }
  //
  //    func makeLoginCoordinator() -> NavigationViewCoordinator<LoginCoordinator> {
  //        .init(LoginCoordinator)
  //    }
}

enum Tab: Int {
  case home = 0
  case chat,profile
}

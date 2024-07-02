//
//  ViewModel.swfit.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/2.
//

import Foundation
import Combine

protocol ViewModel: ObservableObject where ObjectWillChangePublisher.Output == Void {
    associatedtype State
    associatedtype Input

    var state: State { get set }
    func trigger(_ input: Input)
}

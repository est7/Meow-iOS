//
//  UseCase.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/2.
//

import Foundation
import Combine

 protocol UseCase {
    associatedtype Input
    associatedtype Output
    
    func execute(_ input: Input) -> Output
}

extension UseCase where Input == Void {
     func execute() -> Output {
        execute(())
    }
}

 protocol PublisherUseCase {
    associatedtype Input
    associatedtype Output
    
    func execute(_ input: Input) -> AnyPublisher<Output, Error>
}

extension PublisherUseCase where Input == Void {
     func execute() -> AnyPublisher<Output, Error> {
        execute(())
    }
}

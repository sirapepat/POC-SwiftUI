//
//  MainReducer.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 30/4/2567 BE.
//

import Foundation
import Combine

final class MainReducer {
    func reduce(_ intent: MainIntent, count: Published<Int>.Publisher) -> AnyPublisher<String, Never> {
        count.map({ "\($0).00" })
            .eraseToAnyPublisher()
    }
    
    func reduce(_ intent: MainIntent, posts: Published<[Post]>.Publisher) -> AnyPublisher<[Post], Never> {
        posts.map({ $0 })
            .eraseToAnyPublisher()
    }
}

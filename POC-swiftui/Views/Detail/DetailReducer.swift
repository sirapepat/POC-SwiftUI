//
//  DetailReducer.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 30/4/2567 BE.
//

import Foundation
import Combine

final class DetailReducer {
    func reduce(_ intent: DetailIntent, count: Published<Int>.Publisher) -> AnyPublisher<String, Never> {
        count.map({ "\($0).00" })
            .eraseToAnyPublisher()
    }
    
    func reduce(_ intent: DetailIntent, posts: Published<[Post]>.Publisher) -> AnyPublisher<[Post], Never> {
        posts.map({ $0 })
            .eraseToAnyPublisher()
    }
}

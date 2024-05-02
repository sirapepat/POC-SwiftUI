//
//  HistoryStore.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 30/4/2567 BE.
//

import Foundation
import Combine

enum HistoryAction {
    case fetchPosts
    case setPosts([Post])
}

final class HistoryStore: BaseStore {
    // MARK: Instance
    static var shared: HistoryStore = .init()
    
    @Published var posts: [Post] = []
    
    private let apiService = APIService()
    
    func dispatch(action: HistoryAction) {
        switch action {
        case .fetchPosts:
            fetchPosts()
        case .setPosts(let posts):
            self.posts = posts
        }
    }
    
    private func fetchPosts() {
        dispatch(action: .setPosts([]))
        apiService.fetchPosts()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] posts in
                self?.dispatch(action: .setPosts(posts))
            })
            .store(in: &cancellables)
    }
}

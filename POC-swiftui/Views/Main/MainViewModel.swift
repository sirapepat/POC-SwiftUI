//
//  MainViewModel.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 30/4/2567 BE.
//

import Foundation
import SwiftUI

final class MainViewModel: BaseViewModel<MainIntent> {
    // MARK: State
    @Published private(set) var state: State = .init()
    
    // MARK: Stores
    private(set) var stores: Stores
    
    // MARK: Reducer
    private let reducer: MainReducer = .init()
    
    // MARK: Properties
    private var _intent: MainIntent = .idle
    
    // MARK: Initial
    init(stores: Stores = .init()) {
        self.stores = stores
    }
    
    // MARK: Overriden
    override func binding() {
        cancellables.inserts(
            reducer.reduce(_intent, count: stores.couter.$count)
                .assign(to: \.state.count, on: self),
            reducer.reduce(_intent, posts: stores.history.$posts)
                .assign(to: \.state.posts, on: self)
        )
    }
    
    override func dispatch(_ intent: MainIntent) {
        _intent = intent
        switch intent {
        case .increment:
            stores.couter.dispatch(action: .increment)
        case .increment100:
            stores.couter.dispatch(action: .increment100)
        case .decrement:
            stores.couter.dispatch(action: .decrement)
        case .fetchHistories:
            stores.history.dispatch(action: .fetchPosts)
        default:
            break
        }
    }
}

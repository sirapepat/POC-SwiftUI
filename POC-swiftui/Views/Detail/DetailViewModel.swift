//
//  DetailViewModel.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 30/4/2567 BE.
//

import Foundation

final class DetailViewModel: BaseViewModel<DetailIntent> {
    // MARK: State
    @Published private(set) var state: State
    
    // MARK: Stores
    private(set) var stores: Stores
    
    // MARK: Reducer
    private let reducer: DetailReducer = .init()
    
    // MARK: Properties
    private var _intent: DetailIntent = .idle
    
    // MARK: Initial
    init(
        post: Post,
        stores: Stores = .init()
    ) {
        self.state = .init(post: post)
        self.stores = stores
    }
    
    // MARK: Overriden
    override func binding() {
        cancellables.inserts(
            reducer.reduce(_intent, count: stores.couter.$count)
                .assign(to: \.state.count, on: self)
        )
    }
    
    override func dispatch(_ intent: DetailIntent) {
        _intent = intent
        switch intent {
        case .increment:
            stores.couter.dispatch(action: .increment)
        case .decrement:
            stores.couter.dispatch(action: .decrement)
        default:
            break
        }
    }
}

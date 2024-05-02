//
//  CouterStore.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 30/4/2567 BE.
//

import Foundation

enum CounterAction {
    case increment
    case increment100
    case decrement
}

final class CounterStore: BaseStore {
    // MARK: Instance
    static var shared: CounterStore = .init()
    
    @Published var count: Int = 0
    
    func dispatch(action: CounterAction) {
        switch action {
        case .increment:
            count += 1
        case .increment100:
            count += 100
        case .decrement:
            count -= 1
        }
    }
}

//
//  MainModel.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 30/4/2567 BE.
//

import Foundation

struct MainModel {
    struct State {
        var count: String = "0.00"
        var posts: [Post] = []
    }
    
    enum Intent: ViewIntent {
        case idle
        case increment
        case increment100
        case decrement
        case fetchHistories
    }
    
    struct Stores {
        var couter: CounterStore = .shared
        var history: HistoryStore = .shared
    }
}

extension MainViewModel {
    typealias State = MainModel.State
    typealias Stores = MainModel.Stores
}

typealias MainIntent = MainModel.Intent

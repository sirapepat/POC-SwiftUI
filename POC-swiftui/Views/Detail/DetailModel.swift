//
//  DetailModel.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 30/4/2567 BE.
//

import Foundation

struct DetailModel {
    struct State {
        var count: String = ""
        var post: Post
    }
    
    enum Intent: ViewIntent {
        case idle
        case increment
        case decrement
    }
    
    struct Stores {
        var couter: CounterStore = .shared
    }
}

extension DetailViewModel {
    typealias State = DetailModel.State
    typealias Stores = DetailModel.Stores
}

typealias DetailIntent = DetailModel.Intent

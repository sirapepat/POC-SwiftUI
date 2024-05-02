//
//  BaseStore.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 2/5/2567 BE.
//

import SwiftUI
import Combine

class BaseStore: ObservableObject {
    // MARK: Combines
    public var cancellables = Set<AnyCancellable>()
    
    // MARK: Initial
    public init() {}
}

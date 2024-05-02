//
//  AnyCancellable.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 30/4/2567 BE.
//

import Combine

public extension Set where Element == AnyCancellable {
    mutating func inserts(_ cancellables: AnyCancellable...) {
        cancellables.forEach({ self.insert($0) })
    }
}

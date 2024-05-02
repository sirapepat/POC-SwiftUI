//
//  BaseView.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 30/4/2567 BE.
//

import SwiftUI

public protocol BaseView {
    associatedtype Intent: ViewIntent
    associatedtype ViewModel: BaseViewModel<Intent>
    
    var viewModel: ViewModel { get }
    
    func dispatch(_ intent: Intent)
}

extension BaseView {
    func dispatch(_ intent: Intent) {
        viewModel.dispatch(intent)
    }
}

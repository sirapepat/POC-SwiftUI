//
//  BaseViewModel.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 30/4/2567 BE.
//

import SwiftUI
import Combine

protocol BaseViewModelProtocol {
    associatedtype Intent: ViewIntent
    
    func binding()
    func dispatch(_ intent: Intent)
}

public class BaseViewModel<Intent: ViewIntent>:
    ObservableObject,
    BaseViewModelProtocol
{
    // MARK: Typealias
    typealias Intent = Intent
    
    // MARK: Combines
    public var cancellables = Set<AnyCancellable>()
    
    // MARK: Initial
    public init() {
        binding()
    }
    
    // MARK: Overriden
    open func binding() {
        fatalError("binding() must be overriden in concrete implementations of BaseViewModel")
    }
    
    open func dispatch(_ intent: Intent) {
        fatalError("dispatch() must be overriden in concrete implementations of BaseViewModel")
    }
}

public protocol ViewIntent {}

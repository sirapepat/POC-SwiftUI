//
//  MainView.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 30/4/2567 BE.
//

import SwiftUI

struct MainView: BaseView, View {
    typealias Intent = MainIntent
    typealias ViewModel = MainViewModel
    
    @StateObject var viewModel: MainViewModel = .init()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Count: \(viewModel.state.count)")
                HStack {
                    Button("Increment") {
                        dispatch(.increment)
                    }
                    .padding()
                    Button("Increment +100") {
                        dispatch(.increment100)
                    }
                    .padding()
                    Button("Decrement") {
                        dispatch(.decrement)
                    }
                    .padding()
                }
                HStack {
                    Button("Fetch Posts") {
                        dispatch(.fetchHistories)
                    }
                    .padding()
                }
                List(viewModel.state.posts, id: \.id) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        NavigationLink(destination: DetailView(post: post)) {
                            Text(post.body)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Main")
        }
    }
}

#Preview {
    MainView()
}

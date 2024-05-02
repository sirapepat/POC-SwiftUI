//
//  DetailView.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 30/4/2567 BE.
//

import SwiftUI

struct DetailView: BaseView, View {
    typealias Intent = DetailIntent
    typealias ViewModel = DetailViewModel
    
    // MARK: Context
    var post: Post
    
    @StateObject var viewModel: DetailViewModel
    
    init(post: Post) {
        self.post = post
        _viewModel = StateObject(wrappedValue: DetailViewModel(post: post))
    }
    
    var body: some View {
        NavigationView {
            VStack(
                alignment: .leading,
                spacing: 16
            ) {
                Text(viewModel.state.post.title)
                    .padding(.horizontal, 16.0)
                    .font(.headline)
                Text(viewModel.state.post.body)
                    .padding(.horizontal, 16.0)
                    .font(.subheadline)
                Spacer()
                HStack {
                    Button("+") {
                        dispatch(.increment)
                    }
                    .padding()
                    Button("-") {
                        dispatch(.decrement)
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                Text("Updated count: \(viewModel.state.count)")
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationTitle("Detail")
    }
}

#Preview {
    DetailView(post: .init(id: 0, title: "Title", body: "Body"))
}

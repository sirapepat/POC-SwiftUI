//
//  APIService.swift
//  POC-swiftui
//
//  Created by Sira Lownoppakul on 30/4/2567 BE.
//

import Foundation
import Combine

// Model
struct Post: Decodable {
    let id: Int
    let title: String
    let body: String
}

// Service
final class APIService {
    func fetchPosts() -> AnyPublisher<[Post], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

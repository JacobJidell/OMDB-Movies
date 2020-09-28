//
//  NetworkManager.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-24.
//

import Foundation
import Combine

class NetworkManager {
    
    static let shared = NetworkManager()

    private let router = Router<MovieAPI>()

    func getMovie(by id: String) -> AnyPublisher<Movie, Error> {
        return router.execute(.movie(id: id), JSONDecoder())
    }

    func search(by title: String) -> AnyPublisher<Search, Error> {
        return router.execute(.search(title: title), JSONDecoder())
    }
}
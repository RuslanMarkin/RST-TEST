//
//  APIService.swift
//  RSTTur-Test
//
//  Created by Markin Ruslan on 14/05/2023.
//

import Foundation
import Combine

struct APIService {
    
    static var jsonDecoder = JSONDecoder()
    
    init() {}
    
    func fetch<Model: Decodable>(decoding: Model.Type) -> AnyPublisher<Model, HTTPError> {
        let url = URL(string: "https://rsttur.ru/api/base-app/map")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .assumeHTTP()
            .responseData()
            .decoding(type: Model.self, decoder: Self.jsonDecoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


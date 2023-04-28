//
//  NetworkManager.swift
//  Flickr Client App
//
//  Created by Yasin Ağbulut on 20.04.2023.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    
    func fetchImage(with url: String?, completion: @escaping (Data) -> Void) {
        if let urlString = url, let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    debugPrint(error)
                    return
                }
                if let data = data {
                    DispatchQueue.main.async {
                        completion(data)
                    }
                }
            }.resume()
        }
    }

}

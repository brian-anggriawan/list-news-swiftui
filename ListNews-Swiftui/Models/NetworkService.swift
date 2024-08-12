//
//  NetworkService.swift
//  ListNews-Swiftui
//
//  Created by Brian Anggriawan on 06/08/24.
//

import Foundation

class NetworkService: ObservableObject {
    @Published var newes = [News]()
    func getNews() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(ResultNews.self, from: safeData)
                            DispatchQueue.main.async {
                                self.newes = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                } else {
                    print(error?.localizedDescription ?? "Unknown error")
                }
            }
            task.resume() // Start the task
        }
    }
}

struct ResultNews: Decodable {
    let hits: [News]
}

struct News: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}

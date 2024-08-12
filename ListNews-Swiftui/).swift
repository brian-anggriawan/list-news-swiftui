//
//  ContentView.swift
//  ListNews-Swiftui
//
//  Created by Brian Anggriawan on 06/08/24.
//

import SwiftUI

struct Post: Identifiable {
    let id: String
    let title: String
}

let newses = [
    Post(id: "1", title: "Halo halo bandung"),
    Post(id: "2", title: "Halo halo bandung"),
    Post(id: "3", title: "Halo halo bandung"),
    Post(id: "4", title: "Halo halo bandung"),
    Post(id: "5", title: "Halo halo bandung"),
    Post(id: "6", title: "Halo halo bandung")
]

struct ContentView: View {
    var newtorkManager = NetworkService(
    var body: some View {
        NavigationView {
            List(newses) { news in
                NavigationLink(destination: DetailView(id: news.id)) {
                    Text(news.title)
                }
            }
            .navigationTitle("List News")
        }
    }
}

struct DetailView: View {
    let id: String
    
    var body: some View {
        Text(id)
            .font(.largeTitle)
            .navigationTitle(id)
            .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ContentView()
}

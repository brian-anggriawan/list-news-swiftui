//
//  ContentView.swift
//  ListNews-Swiftui
//
//  Created by Brian Anggriawan on 06/08/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkService()
    var body: some View {
        NavigationView {
            List(networkManager.newes) { news in
                NavigationLink(destination: DetailView(url: news.url ?? "www.youtube.com")) {
                    HStack {
                        Text(String(news.points))
                        Text(news.title)
                    }
                }
            }
            .navigationTitle("List News")
        }
        .onAppear {
            self.networkManager.getNews()
        }
    }
}


#Preview {
    ContentView()
}

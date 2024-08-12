//
//  DetailView.swift
//  ListNews-Swiftui
//
//  Created by Brian Anggriawan on 12/08/24.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url: String
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct WebView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}


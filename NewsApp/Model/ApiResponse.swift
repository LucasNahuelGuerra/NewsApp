//
//  ApiResponse.swift
//  NewsApp
//
//  Created by Lucas Nahuel Guerra on 07/07/2024.
//

import Foundation

struct ApiResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let name: String?
}

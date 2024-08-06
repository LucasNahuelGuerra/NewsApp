//
//  UsersModel.swift
//  NewsApp
//
//  Created by Lucas Nahuel Guerra on 08/07/2024.
//

import Foundation

struct UsersModel: Codable {
    let results: [Users]
}

struct Users: Codable {
    let gender: String
    let name: Names
    let location: Location
    let phone: String?
    let picture: Picture
}

struct Names: Codable {
    let first: String
    let last: String
}

struct Location: Codable {
    let street: Street
    let coordinates: Coordinates?
}

struct Street: Codable {
    let number: Int
    let name: String
}

struct Coordinates: Codable {
    let latitude: String
    let longitude: String
}

struct Picture: Codable {
    let large: String?
}

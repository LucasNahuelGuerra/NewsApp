//
//  UsersTableViewModel.swift
//  NewsApp
//
//  Created by Lucas Nahuel Guerra on 08/07/2024.
//

import Foundation

class UsersTableViewModel{
    let name: String
    let phone: String
    let location: String
    let imageURL: URL?
    let latitude: String
    let longitude: String
    var imageData: Data? = nil
    
    init(
        name: String,
        phone: String,
        location: String,
        imageURL: URL?,
        latitude: String,
        longitude: String
    ) {
        self.name = name
        self.phone = phone
        self.location = location
        self.imageURL = imageURL
        self.latitude = latitude
        self.longitude = longitude
    }
}

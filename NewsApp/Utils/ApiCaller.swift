//
//  ApiCaller.swift
//  NewsApp
//
//  Created by Lucas Nahuel Guerra on 07/07/2024.
//

import Foundation

final class ApiCaller {
    
    static let shared = ApiCaller()
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=6bccee13811549c3ba0a32f0acf353cf")
        
        static let searchURLString = "https://newsapi.org/v2/everything?from=2024-08-05&to=2024-08-06&sortBy=popularity&apiKey=6bccee13811549c3ba0a32f0acf353cf&q="
        
        static let usersURLString = URL(string: "https://randomuser.me/api/?results=50")
    }
    
    private init() {}
    
    //Fetch top news
    public func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        let  task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(ApiResponse .self, from: data)
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
    }
    
    //Search
    public func search(with query: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        let urlString = Constants.searchURLString + query
        guard let url = URL(string: urlString ) else {
            return
        }
        let  task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(ApiResponse .self, from: data)
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
    }
    
    //Fetch users
    
    public func getUsers(completion: @escaping (Result<[Users], Error>) -> Void) {
        
        guard let url = Constants.usersURLString else {
            return
        }
        let  task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(UsersModel .self, from: data)
                    completion(.success(result.results))
                }
                catch {
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
    }
}

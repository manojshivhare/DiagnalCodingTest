//
//  MovieModel.swift
//  DiagnalTest
//
//  Created by Manoj Shivhare on 19/05/20.
//  Copyright © 2020 Manoj Shivhare. All rights reserved.
//

import Foundation

struct MovieModel:Codable {
    let page:Page
}

struct Page:Codable {
    let pageTitle:String
    let totalContentItems:String
    let pageNum:String
    let pageSize:String
    let contentItems:ContentItems
    
    enum CodingKeys: String, CodingKey {
        case pageTitle = "title"
        case totalContentItems = "total-content-items"
        case pageNum = "page-num"
        case pageSize = "page-size"
        case contentItems = "content-items"
    }
}

struct ContentItems:Codable {
    let content:[Content]
}

struct Content:Codable {
    let movieName:String
    let moviePoster:String
    
    enum CodingKeys: String, CodingKey {
        case movieName = "name"
        case moviePoster = "poster-image"
    }
       
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        movieName = try values.decode(String.self, forKey: .movieName)
        moviePoster = try values.decode(String.self, forKey: .moviePoster)
    }
}

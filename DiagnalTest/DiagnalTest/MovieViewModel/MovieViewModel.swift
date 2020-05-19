//
//  MovieViewModel.swift
//  DiagnalTest
//
//  Created by Manoj Shivhare on 19/05/20.
//  Copyright © 2020 Manoj Shivhare. All rights reserved.
//

import Foundation
struct MovieViewModel {
    let movieName:String
    let moviePoster:String
    
    init(content:Content) {
        self.movieName = content.movieName
        self.moviePoster = content.moviePoster
    }
}

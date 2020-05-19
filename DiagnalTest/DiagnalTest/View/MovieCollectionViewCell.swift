//
//  MovieCollectionViewCell.swift
//  DiagnalTest
//
//  Created by Manoj Shivhare on 19/05/20.
//  Copyright © 2020 Manoj Shivhare. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
      
    @IBOutlet weak var movieNameLabel: UILabel!
    
    var dataModelDic: Content! {
        didSet {
            movieImageView.image = UIImage(named: self.dataModelDic.moviePoster ?? "placeholder_for_missing_posters")
            //set movie name
            self.movieNameLabel.text = self.dataModelDic.movieName
        }
    }
    
}
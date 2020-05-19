//
//  NetworkManager.swift
//  DiagnalTest
//
//  Created by Manoj Shivhare on 19/05/20.
//  Copyright © 2020 Manoj Shivhare. All rights reserved.
//

import Foundation
import UIKit

class ApiManager{
    
    static let shared = ApiManager()
    let session = URLSession(configuration: .default)
    var request : NSMutableURLRequest = NSMutableURLRequest()
    var activityIndicator : UIActivityIndicatorView?
    
    func getUserData(fileNameStr:String,view:UIView,_ complition: @escaping ([Content]?)->()) {
            
        if let path = Bundle.main.path(forResource: fileNameStr, ofType: "json") {
            do {
                let userData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let userArr = try? JSONDecoder().decode(MovieModel.self, from: userData).page.contentItems.content
                complition(userArr)
                
            } catch {
                // handle error
                print(error.localizedDescription)
            }
        }
    }
}

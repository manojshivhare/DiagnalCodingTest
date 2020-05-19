//
//  ViewController.swift
//  DiagnalTest
//
//  Created by Manoj Shivhare on 19/05/20.
//  Copyright © 2020 Manoj Shivhare. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var movieDataArr:[Content]?
    var isLoadingList:Bool?
    var pageNumber = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi(fileNameStr: "CONTENTLISTINGPAGE-PAGE\(pageNumber)")
        movieCollectionView.collectionViewLayout = createCollectionViewLayout()
    }
    
    func callApi(fileNameStr:String) {
        ApiManager.shared.getUserData(fileNameStr: fileNameStr) { (content) in
            //print(content as Any)
            self.movieDataArr?.removeAll()
            self.movieDataArr = content
            DispatchQueue.main.async {
                self.movieCollectionView.reloadData()
            }
        }
    }
    
    //MARK: Make Compositional Layout
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        // Define Item Size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1.0))
        
        
        // Create Item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Define Group Size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(160.0))
        
        // Create Group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [ item ])
        
        // Create Section
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 2.0, leading: 5.0, bottom: 2.0, trailing: 2.0)
        
        return UICollectionViewCompositionalLayout(section: section)
    }

    //call function for pagination
       func loadMoreData() {
           pageNumber = pageNumber + 1
           callApi(fileNameStr: "CONTENTLISTINGPAGE-PAGE\(pageNumber)")
       }
}

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return self.movieDataArr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCollIdentifier", for: indexPath) as! MovieCollectionViewCell
        cell.dataModelDic = self.movieDataArr![indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == self.movieDataArr!.count - 1 {  //numberofitem count
                loadMoreData()
            }
    }
}


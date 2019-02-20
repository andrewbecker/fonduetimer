//
//  ViewController.swift
//  fondueTimer
//
//  Created by Andy Becker on 2/2/19.
//  Copyright © 2019 Andy Becker. All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let allColors = ColorBank()

    let colors = [
        "#511849",
        "#900c3f",
        "#c70039",
        "#ff5733",
        "#ff8d1a",
        "#ffc300",
        "#eddd53",
        "#add45c",
        "#57c785",
        "#00baad",
        "#2a7b9b",
        "#3d3d6b",
        "#444444",
        "#FFFFFF",
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ident", for: indexPath)
        
        cell.layer.cornerRadius = 50
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor(hex: colors[indexPath.row])
        return cell
    }
    
    let reuseIdentifier = "ident"

    @IBOutlet weak var collView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collView.delegate = self
        collView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTimer"
        {
            let cell = sender as! UICollectionViewCell
            let color: UIColor = cell.backgroundColor!
            let destinatonVC = segue.destination as! TabBarViewController
            
            if let indexOfItem = allColors.colorList.index(where: { (item) -> Bool in
                return item.color == color
            }) {
                destinatonVC.specialColor = allColors.colorList[indexOfItem]
            }
            else {
                print("item not found")
            }
        
        }
    }
    
    
    
}


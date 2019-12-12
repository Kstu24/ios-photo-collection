//
//  PlanetsCollectionViewController.swift
//  Planets
//
//  Created by Kevin Stewart on 12/11/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PlanetsCollectionViewController: UICollectionViewController, PlanetSettingsDelegate {

    

    //MARK: - Properties
    let planetController = PlanetController()

    //MARK: - UICollectionDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planetController.planets.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as? PlanetCollectionViewCell else { return UICollectionViewCell()}
            
            let planet = planetController.planets[indexPath.item]
            
            cell.imageView.image = planet.image
            cell.planetLabel.text = planet.name
    
        return cell
    }
   //4. Adopt and conform to protocol stubs from delegate. Reload the collection view
    func shouldShowPlutoChanged() {
        self.collectionView.reloadData()
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSettings" {
            if let settingsVC = segue.destination as? SettingsViewController {
                settingsVC.delegate = self
                }
            }
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */


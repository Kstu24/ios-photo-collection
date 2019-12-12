//
//  SettingsViewController.swift
//  Planets
//
//  Created by Kevin Stewart on 12/11/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

//1. declare protocol and functions
protocol PlanetSettingsDelegate: class {
    func shouldShowPlutoChanged()
}

class SettingsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet var plutoSwitch: UISwitch!
    //2. create delegate property in delegator file
    weak var delegate: PlanetSettingsDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateViews()
    }
    //MARK: - Action
    
    @IBAction func changeShouldShowPluto(_ sender: UISwitch) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
        //3. call method on the delegate to show that pluto should have changed
        delegate?.shouldShowPlutoChanged()
    }
    
    private func updateViews() {
        let userDefaults = UserDefaults.standard
        plutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
 

}

extension String {
     static var shouldShowPlutoKey = "ShouldShowPluto"
 }

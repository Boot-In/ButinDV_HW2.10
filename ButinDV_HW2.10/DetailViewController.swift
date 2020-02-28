//
//  ViewController.swift
//  ButinDV_HW2.10
//
//  Created by Dmitriy Butin on 28.02.2020.
//  Copyright © 2020 Dmitriy Butin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    var countryDetail: Countryes!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel.text = "Название: \(countryDetail.name)\n Столица: \(countryDetail.capital)\n Регион: \(countryDetail.region)\n Суб. Регион: \(countryDetail.subregion)\n Население: \(countryDetail.population) чел."
    }

}


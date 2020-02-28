//
//  Model.swift
//  ButinDV_HW2.10
//
//  Created by Dmitriy Butin on 28.02.2020.
//  Copyright © 2020 Dmitriy Butin. All rights reserved.
//
//

struct Countryes: Decodable {
    let name: String
    let capital: String
    let region: String
    let subregion: String
    let population: Int
}

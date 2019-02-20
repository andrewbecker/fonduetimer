//
//  ColorBank.swift
//  fondueTimer
//
//  Created by Andy Becker on 2/15/19.
//  Copyright © 2019 Andy Becker. All rights reserved.
//

import UIKit

class ColorBank {
    var colorList = [ForkColor]()
    
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
    
    let tones = [
        tone.Dark,
        tone.Dark,
        tone.Light,
        tone.Light,
        tone.Light,
        tone.Light,
        tone.Light,
        tone.Light,
        tone.Light,
        tone.Light,
        tone.Light,
        tone.Dark,
        tone.Dark,
        tone.Light
    ]
    
    init() {
        
        for (index, color) in colors.enumerated() {
            colorList.append(ForkColor(forkColor: UIColor(hex: color), colorTone: tones[index]))
        }
        
    }
}



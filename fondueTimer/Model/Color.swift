//
//  Color.swift
//  fondueTimer
//
//  Created by Andy Becker on 2/15/19.
//  Copyright © 2019 Andy Becker. All rights reserved.
//

import UIKit

enum tone {
    case Light
    case Dark
}

class ForkColor {
    
    let color: UIColor
    let tone: tone
    
    init(forkColor: UIColor, colorTone: tone) {
        color = forkColor
        tone = colorTone
    }
}

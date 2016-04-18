//
//  Genre.swift
//  Wakey
//
//  Created by Richard Hsu on 4/18/16.
//  Copyright © 2016 Richard Hsu. All rights reserved.
//

import Foundation
import UIKit

struct Genre
{
    var title: String?
    var description: String?
    var link: String?
    var icon: UIImage?
    
    init(index: Int)
    {
        let musicLibrary = MusicLibrary().library
        let genreDictionary = musicLibrary[index]
        
        title = genreDictionary["title"]
        description = genreDictionary["description"]
        link = genreDictionary["link"]
        
        let iconName = genreDictionary["icon"]
        icon = UIImage(named: iconName!)
        
        
        
    }
    
}
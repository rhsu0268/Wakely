//
//  CurrentWeather.swift
//  Wakey
//
//  Created by Richard Hsu on 3/22/16.
//  Copyright © 2016 Richard Hsu. All rights reserved.
//

import Foundation

struct CurrentWeather
{
    let temperature: Int
    let humidity: Int
    let precipProbability: Int
    let summary: String
    
    init(weatherDictionary: [String: AnyObject])
    {
        temperature = weatherDictionary["temperature"] as! Int
        let humidityFloat = weatherDictionary["humidity"] as! Double
        humidity = Int(humidityFloat * 100)
        
        let precipFloat = weatherDictionary["precipProbability"] as! Double
        precipProbability = Int(precipFloat * 100)
        summary = weatherDictionary["summary"] as! String
        
    }
}
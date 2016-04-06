//
//  CurrentWeather.swift
//  Wakey
//
//  Created by Richard Hsu on 3/22/16.
//  Copyright © 2016 Richard Hsu. All rights reserved.
//

import Foundation
import UIKit

enum Icon: String
{
    // ten members for ten possible values
    case ClearDay = "clear-day"
    case ClearNight = "clear-night"
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Wind = "wind"
    case Fog = "fog"
    case Cloudy = "cloudy"
    case PartlyCloudyDay = "partly-cloudy-day"
    case PartlyCloudyNight = "partly-cloudy-night"
    
    // helper method
    func toImage() -> UIImage?
    {
        var imageName: String
        
        
        // match the value
        // pass in rawValue. If it matches, we get value
        // otherwise, it will not
        switch self
        {
            case .ClearDay:
                imageName = "clear-day.png"
            case .ClearNight:
                imageName = "clear-night.png"
            case .Rain:
                imageName = "rain.png"
            case .Snow:
                imageName = "snow.png"
            case .Sleet:
                imageName = "sleet.png"
            case .Wind:
                imageName = "wind.png"
            case .Fog:
                imageName = "fog.png"
            case .Cloudy:
                imageName = "cloudy.png"
            case .PartlyCloudyDay:
                imageName = "cloudy-day.png"
            case .PartlyCloudyNight:
                imageName = "cloudy-night.png"
        }

        
        return UIImage(named: imageName)
    }

}

struct CurrentWeather
{
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    var icon: UIImage? = UIImage(named: "default.png")
    
    init(weatherDictionary: [String: AnyObject])
    {
        temperature = weatherDictionary["temperature"] as? Int
        if let humidityFloat = weatherDictionary["humidity"] as? Double
        {
            humidity = Int(humidityFloat * 100)
        }
        else
        {
            humidity = nil
        }
        if let precipFloat = weatherDictionary["precipProbability"] as? Double
        {
            precipProbability = Int(precipFloat * 100)
        }
        else
        {
            precipProbability = nil
        }
        summary = weatherDictionary["summary"] as? String
        
        
        if let iconString = weatherDictionary["icon"] as? String,
            let weatherIcon: Icon = Icon(rawValue: iconString)
            {
                icon = weatherIcon.toImage()
            }
    
    }
    
    
    
    
   }
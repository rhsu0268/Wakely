//
//  ForecastService.swift
//  Wakey
//
//  Created by Richard Hsu on 3/30/16.
//  Copyright © 2016 Richard Hsu. All rights reserved.
//

import Foundation

// interact with the Forecast API
struct ForecastService
{
    
    let forecastAPIKey: String
    let forecastBaseURL: NSURL?
    
    // init method for APIKey and forecastBaseURL
    init(APIKey: String)
    {
        self.forecastAPIKey = APIKey
        forecastBaseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
    }
    
    /// completion handler that accepts a closure
    
    func getForecast(lat: Double, long: Double, completion: (CurrentWeather? -> Void))
    {
        // call download JSON method 
        // can't return  object from inside the closure unless if you implement a callback through a callback
        // check to see valid url and assign to constant
        if let forecastURL = NSURL(string: "\(lat),\(long)", relativeToURL: forecastBaseURL)
        {
            // create a NetworkOperation instance
            let networkOperation = NetworkOperation(url: forecastURL)
            
            // trailing closure
            // retrieve data 
            networkOperation.downloadJSONFromURL
            {
                // takes in jsonDictionary
                // parse contents of dictionary and create populated instance of current weather
                (let JSONDictionary) in
                let currentWeather = self.currentWeatherFromJSON(JSONDictionary)
                
                // assign to completion handler - bubbles it up to viewcontroller
                completion(currentWeather)
                
                    
            }
        }
        else
        {
            print("Could not construct a valid URL!")
        }
    }
    
    // optional dictionary is passed in
    // return type = option instance of CurrentWeather

    func currentWeatherFromJSON(jsonDictionary: [String: AnyObject]?) -> CurrentWeather? {
        
        // check that dictionary returns a non-nil for key currently
        
        // optional binding: make sure that the dictionary is non-nil value
        // If it does this, we cast to dictionary type. 
        // assign it to currentWeatherDictionary
        if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String:AnyObject] {
            
            // assign the currentWeatherDictionary as an argument of init method for the currentWeater struct as a resulting instance
            return CurrentWeather(weatherDictionary: currentWeatherDictionary)
        } else {
            print("JSON dictionary returned nil for 'currently' key")
            return nil
        }
    }
}
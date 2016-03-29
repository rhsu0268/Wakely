//
//  ViewController.swift
//  Wakey
//
//  Created by Richard Hsu on 3/21/16.
//  Copyright © 2016 Richard Hsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?
    
    private let forecastAPIKey = "c6338dd9db43cd95c1ac429b5193b2fc"
    
    //let forecastURL = NSURL(string: "https://api.forecast.io/forecast/c6338dd9db43cd95c1ac429b5193b2fc/37.8267,-122.423")


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
        
        let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)
        
        // Data objet to fetch weather data
        let weatherData = try? NSData(contentsOfURL: forecastURL!, options: [])
        print(weatherData)
        
        
        /*
        if let plistPath = NSBundle.mainBundle().pathForResource("CurrentWeather", ofType: "plist"),
    
            let weatherDictionary = NSDictionary(contentsOfFile: plistPath),
        let currentWeatherDictionary = weatherDictionary["currently"] as? [String: AnyObject]
        {
            let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
            
            currentTemperatureLabel?.text = "\(currentWeather.temperature)º"
            
            currentHumidityLabel?.text = "\(currentWeather.humidity)%"
            
            currentPrecipitationLabel?.text = "\(currentWeather.precipProbability)%"
            
        }
        */
        
        // Use NSURL Session API to fetch data
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        
        // NSURLRequest object
        let request = NSURLRequest(URL: forecastURL!)
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            print(data)
        })
        
        dataTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


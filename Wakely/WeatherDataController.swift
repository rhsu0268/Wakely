//
//  ViewController.swift
//  Wakey
//
//  Created by Richard Hsu on 3/21/16.
//  Copyright © 2016 Richard Hsu. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherDataController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?
    
    @IBOutlet weak var currentWeatherIcon: UIImageView?
    
    
    @IBOutlet weak var currentWeatherSummary: UILabel?
    
    
    @IBOutlet weak var refreshButton: UIButton?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    
    private let forecastAPIKey = "c6338dd9db43cd95c1ac429b5193b2fc"
    
    //let forecastURL = NSURL(string: "https://api.forecast.io/forecast/c6338dd9db43cd95c1ac429b5193b2fc/37.8267,-122.423")

    let coordinate: (lat: Double, long: Double) = (37.8267, -122.423)
    
    var locationManager: CLLocationManager!
    var geoCoder: CLGeocoder!
    var placemark: CLPlacemark!
    
    var latitude: String!
    var longitude: String!
    
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Core Location Manager asks for GPS location
        self.locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        //geoCoder = CLGeocoder()
        //placemark = CLPlacemark()
        
        
        
        
      
        }
        
        /*
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
        
        let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)
        
        // Data objet to fetch weather data
        let weatherData = try? NSData(contentsOfURL: forecastURL!, options: [])
        print(weatherData)
        */
        
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
        /*
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        
        // NSURLRequest object
        let request = NSURLRequest(URL: forecastURL!)
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            print(data)
        })
        
        dataTask.resume()
        */
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func retrieveWeatherForecast()
    {
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        
        if (latitude == nil || longitude == nil)
        {
            let alertController = UIAlertController(title: "Error", message:
                "We cannot find your location!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else
        {
            // trailing closure 
            forecastService.getForecast(Double(latitude)!, long: Double(longitude)!)
            {
                (let currently) in
                if let currentWeather = currently
                {
                    // need to get back to main thread
                    // puts the action into the main queue
                    // update UI
                    dispatch_async(dispatch_get_main_queue())
                    {
                        // execute closure
                        // check that they exist before updating
                        if let temperature = currentWeather.temperature
                        {
                            self.currentTemperatureLabel?.text = "\(temperature)º"
                        }
                        
                        if let humidity = currentWeather.humidity
                        {
                            self.currentHumidityLabel?.text = "\(humidity)%"
                        }
                        
                        if let precipitation = currentWeather.precipProbability
                        {
                            self.currentPrecipitationLabel?.text = "\(precipitation)%"
                        }
                        
                        if let icon = currentWeather.icon
                        {
                            self.currentWeatherIcon?.image = icon
                        }
                        
                        if let summary = currentWeather.summary
                        {
                            self.currentWeatherSummary?.text = summary
                        }
                        
                        // stop animating
                        self.toggleRefreshAnimation(false)
                    }
                }
            }
        }
    }
    
    
    @IBAction func refreshWeather() {
        toggleRefreshAnimation(true)
        retrieveWeatherForecast()
    }
    
    func toggleRefreshAnimation(on: Bool)
    {
        refreshButton?.hidden = on
        
        if on
        {
            activityIndicator?.startAnimating()
        }
        else
        {
            activityIndicator?.stopAnimating()
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        locationManager.stopUpdatingLocation()
        print("An error occured!")
        print(error)
        
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //let location = locations.last as CLLocation!
        //let currentLocation : CLLocation = newLocation
        //latitude = "\(currentLocation.coordinate.latitude)"
        //longitude = "\(currentLocation.coordinate.longitude)"
        print("Inside locationManager")
        if let location = locations.first {
            print("Found user's location: \(location)")
            print("Latitude: \(location.coordinate.latitude)")
            print("Longitude: \(location.coordinate.longitude)")
            
            latitude = "\(location.coordinate.latitude)"
            longitude = "\(location.coordinate.longitude)"
        }
        
        retrieveWeatherForecast()
        
        let userLocation = CLLocation(latitude: Double(latitude)!, longitude: Double(longitude)!)
        print(userLocation)
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: {(placemarks, error) -> Void in
            print(userLocation)
            
            
            
            if placemarks!.count > 0 {
                let pm = placemarks![0] as CLPlacemark
                print(pm.locality)
                self.cityNameLabel?.text = pm.locality!
            }
            else {
                print("Problem with the data received from geocoder")
            }
        })
        
        
    }
    
    
    
}


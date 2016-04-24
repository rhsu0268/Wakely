//
//  HomeController.swift
//  Wakey
//
//  Created by Richard Hsu on 4/9/16.
//  Copyright © 2016 Richard Hsu. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    */
    
    /*
    @IBAction func showWeatherController(sender: AnyObject) {
        
        print("Going to showWeatherController")
        
        /*performSegueWithIdentifier("showWeatherDataController",   sender: sender)
        */
    }
    
    */
    
    
    @IBAction func showWeatherController(sender: AnyObject) {
        
        print("Going to WeatherCDataontroller")
        
        performSegueWithIdentifier("showWeatherDataController", sender: sender)
        

    }
    
    
    @IBAction func showTimerController(sender: AnyObject) {
        
        print("Going to Controller")
        
        performSegueWithIdentifier("showTimerController", sender: sender)

    }
    
    
    @IBAction func showMusicController(sender: AnyObject) {
        
        print("Going to Controller")
        
        performSegueWithIdentifier("showMusicController", sender: sender)

    }

}

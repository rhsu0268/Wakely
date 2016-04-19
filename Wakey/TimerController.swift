//
//  TimerViewController.swift
//  Wakey
//
//  Created by Richard Hsu on 4/11/16.
//  Copyright © 2016 Richard Hsu. All rights reserved.
//

import UIKit
import AVFoundation

class TimerController: UIViewController {
    
    
    @IBOutlet weak var userInputField: UITextField!

    @IBOutlet weak var timerCountDownLabel: UILabel!
    
    // create a timer
    var timer = NSTimer()
    
    // create a time interval
    var counter = 10
    
    // create an AVAudioPlayer
    var weatherSong = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //timerCountDownLabel.text = String(counter)
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    @IBAction func stopTimer(sender: UIButton) {
        
        timerCountDownLabel.text = "Timer Stopped!"
        timer.invalidate()
        
        // stop the song
        /*
        if weatherSong != nil
        {
            weatherSong.stop()
            weatherSong = nil
        }
        */
    }
    
    // method that is called when the timer fires
    func updateCounter(timer:NSTimer)
    {
        //let theDate = NSDate()
        if (counter > 0)
        {
            timerCountDownLabel.text = String(counter--)
        }
        else
        {
            timerCountDownLabel.text = "Wake up!"
            
            timer.invalidate()
            
            // play the song
            playSong("umbrella.mp3")
        }
    }

    
    @IBAction func startTimer(sender: UIButton) {
        
        let userTimeInput = self.userInputField.text!
        print(userTimeInput)
        
        if (userTimeInput == "")
        {
            let alertController = UIAlertController(title: "Error", message:
                "Please enter how long you want to sleep...", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else
        {
            print(userTimeInput)
            
            // set the counter
            counter = Int(userTimeInput)!
            
            // create a timer
            timerCountDownLabel.text = "Timer started!"
            //timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateCounter:"), userInfo: nil, repeats: true)
            
            //timer = NSTimer(fireDate: NSDate(timeIntervalSinceNow: 20), interval: 60.0, target: self, selector: Selector("playAlarm"), userInfo: nil, repeats: false)
           //NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode)
        }
        
    }
    
    
    @IBAction func resetTimer(sender: UIButton) {
        
        timer.invalidate()
        
        // reset the counter
        counter = 10
        timerCountDownLabel.text = "Timer restarted!"
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func playSong(songTitle: String)
    {
        let path = NSBundle.mainBundle().pathForResource(songTitle, ofType: nil)
        
        //var error:NSError?
        
        let url = NSURL(fileURLWithPath: path!)
        
        do
        {
            let song = try AVAudioPlayer(contentsOfURL: url)
            self.weatherSong = song
            
        }
        catch
        {
            
        }
        //let loadingTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1))
        
        self.weatherSong.play()
    }
    
    func playAlarm() {
        let path = NSBundle.mainBundle().pathForResource("umbrella.mp3", ofType: nil)
        
        //var error:NSError?
        
        let url = NSURL(fileURLWithPath: path!)
        
        do
        {
            let song = try AVAudioPlayer(contentsOfURL: url)
            weatherSong = song
            
        }
        catch
        {
            
        }
        
        weatherSong.play()
    }


    
    
    
   }

//
//  TimerViewController.swift
//  Wakey
//
//  Created by Richard Hsu on 4/11/16.
//  Copyright © 2016 Richard Hsu. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    
    @IBOutlet weak var userInputField: UITextField!

    @IBOutlet weak var timerCountDownLabel: UILabel!
    
    // create a timer
    var timer = NSTimer()
    
    // create a time interval
    var counter = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timerCountDownLabel.text = String(counter)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    @IBAction func stopTimer(sender: UIButton) {
        
        timerCountDownLabel.text = "Timer Stopped!"
        timer.invalidate()
    }
    
    // method that is called when the timer fires
    func updateCounter(timer:NSTimer)
    {
        //let theDate = NSDate()
        if (counter > 0)
        {
            timerCountDownLabel.text = String(counter--)
        }
    }

    
    @IBAction func startTimer(sender: UIButton) {
        
        // create a timer
        timerCountDownLabel.text = "Timer started!"
        //timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateCounter:"), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func resetTimer(sender: UIButton) {
    }
    
    
    
    
   }

//
//  MusicController.swift
//  Wakey
//
//  Created by Richard Hsu on 4/14/16.
//  Copyright © 2016 Richard Hsu. All rights reserved.
//

import UIKit

import AVFoundation

class MusicController: UIViewController {
    
    
    @IBOutlet weak var playedTimeLabel: UILabel!
    
    // create an AVAudioPlayer
    var weatherSong = AVAudioPlayer()
    
    var isPlaying = false
    
    var timer:NSTimer!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //trackTitle.text = "umbrella"
        
        let path = NSBundle.mainBundle().pathForResource("nature.mp3", ofType: nil)
        
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playOrPauseMusic(sender: UIButton) {
        
        if (isPlaying)
        {
            weatherSong.pause()
            isPlaying = false
        }
        else
        {
            weatherSong.play()
            isPlaying = true
            
            // incremeent timer
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
        }
    }
    
    func updateTime()
    {
        let currentTime = Int(weatherSong.currentTime)
        let minutes = currentTime / 60
        let seconds = currentTime - minutes * 60
        
        // update the playedTime label
        playedTimeLabel.text = NSString(format: "%02d:%02d", minutes, seconds) as String
    }
    
    
    @IBAction func stopMusic(sender: UIButton) {
        
        weatherSong.stop()
        weatherSong.currentTime = 0
        isPlaying = false
    }
    

}

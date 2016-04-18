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
    
    @IBOutlet weak var genreImageView0: UIImageView!
    @IBOutlet weak var genreImageView1: UIImageView!
    @IBOutlet weak var genreImageView2: UIImageView!
    @IBOutlet weak var genreImageView3: UIImageView!
    
    var genreArray: [UIImageView] = []
    
    
    @IBOutlet weak var playedTimeLabel: UILabel!
    
    // create an AVAudioPlayer
    var weatherSong = AVAudioPlayer()
    
    var isPlaying = false
    
    var timer:NSTimer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initalize the genreArray
        genreArray += [genreImageView0, genreImageView1, genreImageView2, genreImageView3]
        
        // iterate over genreArray
        for index in 0..<genreArray.count
        {
            let genre = Genre(index: index)
            let genreImageView = genreArray[index]
            
            genreImageView.image = genre.icon
            
            
        }
        
        // tapGestureRecognizer
        //let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
        //genreImageView0.userInteractionEnabled = true
        //genreImageView0.addGestureRecognizer(tapGestureRecognizer)

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
    
    /*
    func imageTapped(img: AnyObject)
    {
        // Your action
        print("Image is tapped")
    }
    */
    

    @IBAction func playGenre(sender: AnyObject) {
        print("Image is tapped")
        //let imgView = sender.view as! UIImageView
        
        
        let genreImageView = sender.view as! UIImageView
        
        let index = genreArray.indexOf(genreImageView)
        
        print(index!)
        
    }
    

}

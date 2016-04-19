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
    var currentSong = AVAudioPlayer()
    
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    
    @IBAction func pauseMusic(sender: UIButton)
    {
        currentSong.pause()
        isPlaying = false
    }
    
    func updateTime()
    {
        let currentTime = Int(currentSong.currentTime)
        let minutes = currentTime / 60
        let seconds = currentTime - minutes * 60
        
        // update the playedTime label
        playedTimeLabel.text = NSString(format: "%02d:%02d", minutes, seconds) as String
    }
    
    
    @IBAction func stopMusic(sender: UIButton) {
        
        currentSong.stop()
        currentSong.currentTime = 0
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
        
        print(index)
        
        switch (index!)
        {
            case 0:
                print("User selected 0")
                playGenreSong("nature.mp3")
            case 1:
                print("User selected 1")
                playGenreSong("spring.mp3")
            case 2:
                print("User selected 2")
                playGenreSong("ambient-music.mp3")
            case 3:
                print("User selected 3")
                playGenreSong("baa-baa-black-sheep.mp3")
            default :
                print( "default case")
        }
        
    }
    
    
    // function to play the song
    func playGenreSong(songTitle: String)
    {
        let path = NSBundle.mainBundle().pathForResource(songTitle, ofType: nil)
        
        //var error:NSError?
        
        let url = NSURL(fileURLWithPath: path!)
        
        do
        {
            let song = try AVAudioPlayer(contentsOfURL: url)
            currentSong = song
            
        }
        catch
        {
            
        }
        
        currentSong.play()
        isPlaying = true
        
        // incremeent timer
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
    }
}

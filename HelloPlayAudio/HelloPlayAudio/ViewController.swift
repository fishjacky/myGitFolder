//
//  ViewController.swift
//  HelloPlayAudio
//
//  Created by jacky on 2017/11/23.
//  Copyright © 2017年 jacky. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer:AVAudioPlayer?
    
    @IBAction func play(_ sender: UIButton) {
        audioPlayer?.stop();
        audioPlayer?.currentTime = 0.0;
        audioPlayer?.play();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //find sound path
//        if let path = Bundle.main.path(forResource: "Right", ofType: "mp3"){
//            //path to url
//            let url = URL(fileURLWithPath: path);
//            //make an audio player
//            do{
//                 audioPlayer = try AVAudioPlayer(contentsOf: url)
//                audioPlayer?.enableRate = true;
//                //audioPlayer?.rate = 2.0;
//                audioPlayer?.numberOfLoops = -1;
//            }catch{
//                print(error.localizedDescription);
//            }
//
//        }else{
//            print("No such file!")
//        }
        guard let path = Bundle.main.path(forResource: "Right", ofType: "mp3") else{
            print("No such file!")
            return
        }
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.enableRate = true;
            //audioPlayer?.rate = 2.0;
            audioPlayer?.numberOfLoops = -1;
        }catch{
            print(error.localizedDescription);
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


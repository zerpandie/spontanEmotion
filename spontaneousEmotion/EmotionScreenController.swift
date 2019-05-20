//  EmotionScreenController.swift
//  spontaneousEmotion
//
//  Created by Zorro Pandiangan on 20/05/19.
//  Copyright © 2019 Zorro Pandiangan. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class EmotionScreenController: UIViewController {
    
    var counterTap = 0
    var player: AVAudioPlayer?
    
    @IBOutlet weak var trianglePlayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//contoh audio
// AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))

        
    }
    
    
    @IBAction func triangleActions(_ sender: UIButton) {
        
        if counterTap == 0 {
            UIView.animate(withDuration: 1) {
                self.trianglePlayButton.transform = CGAffineTransform(rotationAngle: 90)
            }
            counterTap = counterTap + 1
        }
            
            else if counterTap == 1 {
            UIView.animate(withDuration: 1) {
                self.trianglePlayButton.transform = CGAffineTransform(rotationAngle: 180)
            }
            // Buat menghitung tap ke berapa
            counterTap = counterTap + 1
        }
            else if counterTap == 2 {
            UIView.animate(withDuration: 1) {
                self.trianglePlayButton.setImage(UIImage(named: "circle"), for: UIControl.State.normal)
            }
            counterTap = counterTap + 1
        }   else if counterTap == 3 {
            
            // elemen kejut nya
            playSound()
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate)) /* vibrate */
            counterTap = counterTap + 1
        }
            // pindahkan obyeknya ke kiri. Move X
            else if counterTap == 4 {
            UIView.animate(withDuration: 1)  {
                self.trianglePlayButton.setImage(UIImage(named: "segitiga"), for: UIControl.State.normal)
            }
            counterTap = counterTap + 1
        }
        
        // pindahkan obyeknya ke kanan dan ke bawah. Move X & Move Y
        else if counterTap == 5 {
             // isi koding nya
            UIView.animate(withDuration: 1) {
                self.trianglePlayButton.transform = CGAffineTransform(rotationAngle: 100)
            }
            counterTap = counterTap + 1
            
        }   else if counterTap == 6 {
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [.allowUserInteraction], animations: {
                self.trianglePlayButton.transform = CGAffineTransform(translationX: 80, y: 90)
            })
                counterTap = counterTap + 1
        }
        else if counterTap == 7 {
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [.allowUserInteraction], animations: {
                self.trianglePlayButton.transform = CGAffineTransform(scaleX: 4.5, y: 4)
            })
            counterTap = counterTap + 1
        }
            
        else if counterTap == 8 {
            //elemen kejut ke-2
            alarmShock()
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            counterTap = counterTap + 1
        }
            
        else    {
            
        }
        
        
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "suaraTeriak", withExtension: "mp3", subdirectory: "Sound") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playSound2()   {
        guard let url = Bundle.main.url(forResource: "bersin", withExtension: "mp3", subdirectory: "Sound") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func alarmShock()   {
        guard let url = Bundle.main.url(forResource: "alaram", withExtension: "mp3", subdirectory: "Sound") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
   /* UIView.animateKeyframes(withDuration: 5, delay: 0, animations: {
    // Add animations
    }, completion:{ _ in
    print("I'm done!")
    }) */
    
    
    //            UIView.animate(withDuration: 1, animations: {
    //                self.trianglePlayButton.transform = CGAffineTransform(scaleX: 2, y: 2)
    //            }, completion: { _ in
    //                UIView.animate(withDuration: 1, animations: {
    //                    self.trianglePlayButton.transform = CGAffineTransform(rotationAngle: 270)
    //                }, completion: { _ in
    //                    UIView.animate(withDuration: 1, animations: {
    //                        self.trianglePlayButton.transform = CGAffineTransform(scaleX: 3, y: 3)
    //                    }, completion: { _ in
    //                        UIView.animate(withDuration: 1, animations: {
    //                            self.trianglePlayButton.transform = CGAffineTransform(rotationAngle: 300)
    //                        }, completion: { _ in
    //                            print("I'm done!")
    //                        })
    //                    })
    //                })
    //            })
    //        })
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

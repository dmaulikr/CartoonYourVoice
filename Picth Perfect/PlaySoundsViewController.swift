//
//  PlaySoundsViewController.swift
//  Picth Perfect
//
//  Created by Ioannis Daratzikis on 25/10/15.
//  Copyright © 2015 Ioannis Daratzikis. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox
import iAd

class PlaySoundsViewController: UIViewController, ADBannerViewDelegate {
    
    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    
    var audioEngine: AVAudioEngine!
    var audioFile:AVAudioFile!
    
    var fastforward: Bool!
    var slowrewind: Bool!
    var normal: Bool!
    
    var picth: Float!
    
    @IBOutlet var adBannerView: ADBannerView!
    
    //iAd Interstitial
    //var interstitialAd:ADInterstitialAd = ADInterstitialAd()
    //var interstitialAdView: UIView = UIView()
    //var closeButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord,withOptions:AVAudioSessionCategoryOptions.DefaultToSpeaker)
        
        audioPlayer = try! AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine();
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
        
        fastforward = false
        slowrewind = false
        normal = false
        picth = 0.0
        
        //self.canDisplayBannerAds = true
        self.adBannerView!.delegate = self
        self.adBannerView!.hidden = true
        
        //close Button
        //closeButton = UIButton(frame: CGRect(x: 270, y:  25, width: 25, height: 25))
        //closeButton.setBackgroundImage(UIImage(named: "error"), forState: UIControlState.Normal)
        //closeButton.addTarget(self, action: Selector("close"), forControlEvents: UIControlEvents.TouchDown)
        
        //iAd Interstitial
        //loadInterstitialAd()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func PlaySlowSound(sender: UIButton) {
        slowrewind = true
        playAudioWithVariablePitch(picth)
    }
    
    @IBAction func PlayFastSound(sender: UIButton) {
        fastforward = true
        playAudioWithVariablePitch(picth)
    }
    
    @IBAction func StopSound(sender: UIButton) {
        audioEngine.stop()
    }
    
    @IBAction func PlaySoundPitch(sender: UISlider) {
        picth = sender.value
    }
 
    @IBAction func PlaySound(sender: UIButton) {
        normal = true
        playAudioWithVariablePitch(picth)
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        if(fastforward == true){
            changePitchEffect.rate = 2.0
        }else if(slowrewind == true){
            changePitchEffect.rate = 0.5
        }else if (normal == true){
            changePitchEffect.rate = 1.0
        }
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
    
        audioPlayerNode.play()
        
        fastforward = false
        slowrewind = false
        normal = false

    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.adBannerView!.hidden = false
        
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        
    }
    
        //iAd Interstitial
   // func loadInterstitialAd() {
   //     interstitialAd = ADInterstitialAd()
    //    interstitialAd.delegate = self
    //}
    
    //func interstitialAdWillLoad(interstitialAd: ADInterstitialAd!) {
        
   // }
    
   // func interstitialAdDidLoad(interstitialAd: ADInterstitialAd!) {
     //   interstitialAdView = UIView()
     //   interstitialAdView.frame = self.view.bounds
    //    view.addSubview(interstitialAdView)
        
     //   interstitialAd.presentInView(interstitialAdView)
     //   UIViewController.prepareInterstitialAds()
        
      //  interstitialAdView.addSubview(closeButton)
  //  }
    
   // func interstitialAdActionDidFinish(interstitialAd: ADInterstitialAd!) {
   //     interstitialAdView.removeFromSuperview()
  //  }
    
   // func interstitialAdActionShouldBegin(interstitialAd: ADInterstitialAd!, willLeaveApplication willLeave: Bool) -> Bool {
   //     return true
   // }
    
   // func interstitialAd(interstitialAd: ADInterstitialAd!, didFailWithError error: NSError!) {
    //    closeButton.removeFromSuperview()
    //    interstitialAdView.removeFromSuperview()
   // }
    
   // func interstitialAdDidUnload(interstitialAd: ADInterstitialAd!) {

  //  }

}

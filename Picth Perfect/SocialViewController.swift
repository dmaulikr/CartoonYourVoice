//
//  SocialViewController.swift
//  Picth Perfect
//
//  Created by Ioannis Daratzikis on 30/10/15.
//  Copyright © 2015 Ioannis Daratzikis. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openWebsite(sender: UIButton) {
        let websiteAddress = NSURL(string: "https://www.facebook.com/JohnDaratzikis")
        UIApplication.sharedApplication().openURL(websiteAddress!)
    }
    
    @IBAction func FBid(sender: UIButton) {
        let websiteAddress = NSURL(string: "https://www.facebook.com/JohnDaratzikis")
        UIApplication.sharedApplication().openURL(websiteAddress!)
    }
    
    @IBAction func Googleid(sender: UIButton) {
        let websiteAddress = NSURL(string: "https://plus.google.com/100273556309911096613/posts")
        UIApplication.sharedApplication().openURL(websiteAddress!)
    }
    
    @IBAction func Instaid(sender: UIButton) {
        let websiteAddress = NSURL(string: "https://instagram.com/ioannisdaratzikis/")
        UIApplication.sharedApplication().openURL(websiteAddress!)
    }
    
    @IBAction func Linkedin(sender: UIButton) {
        let websiteAddress = NSURL(string: "https://www.linkedin.com/profile/preview?locale=en_US&trk=prof-0-sb-preview-primary-button")
        UIApplication.sharedApplication().openURL(websiteAddress!)

    }
    
    @IBAction func Webid(sender: UIButton) {
        let websiteAddress = NSURL(string: "http://ioannisdaratzikis.com")
        UIApplication.sharedApplication().openURL(websiteAddress!)
    }
    
    @IBAction func Twitterid(sender: UIButton) {
        let websiteAddress = NSURL(string: "https://twitter.com/daratzikis")
        UIApplication.sharedApplication().openURL(websiteAddress!)
    }
    
    @IBAction func FBtapp(sender: UIButton) {
        let websiteAddress = NSURL(string: "https://www.facebook.com/tappgames/")
        UIApplication.sharedApplication().openURL(websiteAddress!)
    }
    
    @IBAction func Twittertapp(sender: UIButton) {
        let websiteAddress = NSURL(string: "https://twitter.com/Tapp_Games")
        UIApplication.sharedApplication().openURL(websiteAddress!)
    }
    
    @IBAction func Webtapp(sender: UIButton) {
        let websiteAddress = NSURL(string: "http://tapp-games.com")
        UIApplication.sharedApplication().openURL(websiteAddress!)
    }
    
    @IBAction func youtube(sender: UIButton) {
        let websiteAddress = NSURL(string: "https://www.youtube.com/channel/UCipN0fhWc_P2UO132dL-lwg")
        UIApplication.sharedApplication().openURL(websiteAddress!)
    }
    
    
}
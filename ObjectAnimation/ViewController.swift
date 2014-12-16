//
//  ViewController.swift
//  ObjectAnimation
//
//  Created by Administrator on 12/16/14.
//  Copyright (c) 2014 First IT World. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isSmallObject : Bool = true
    var btnObject = UIButton();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "small-object1") as UIImage?
        btnObject   = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        btnObject.frame = CGRectMake(20, 300, 60, 60)
        btnObject.setImage(image, forState: .Normal)
        btnObject.addTarget(self, action: "btnObjectTouched:", forControlEvents:.TouchUpInside)
        btnObject.addTarget(self, action: "wasDragged:event:", forControlEvents: UIControlEvents.TouchDragInside)
        self.view.addSubview(btnObject)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false);
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "app-bg.png"))
        self.cloudAnimationLoop();
        self.cloud2AnimationLoop();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    //////////////////////// function fade object to bigger and smaller ///////////////
    @IBAction func btnObjectTouched(sender: AnyObject) {
        if isSmallObject {
            isSmallObject = false;

            UIView.animateWithDuration(1.5,
                delay: 0,
                options: .CurveLinear & .AllowUserInteraction & .BeginFromCurrentState,
                animations: {
                    self.btnObject.frame = CGRectMake(self.view.frame.size.width - 150, 180, 130, 130)
                }, completion:{
                    (finished: Bool) in
                    let image = UIImage(named: "big-object") as UIImage?
                    self.btnObject.frame = CGRectMake(self.view.frame.size.width - 150, 180, 130, 130)
                    self.btnObject.setImage(image, forState: .Normal)
            })
            
        } else {
            isSmallObject = true;
            UIView.animateWithDuration(1.5,
                delay: 0,
                options: .CurveLinear & .AllowUserInteraction & .BeginFromCurrentState,
                animations: {
                     self.btnObject.frame = CGRectMake(20, 300, 60, 60)
                }, completion: {
                    (finished: Bool) in
                    let image = UIImage(named: "small-object1") as UIImage?
                    self.btnObject.frame = CGRectMake(20, 300, 60, 60)
                    self.btnObject.setImage(image, forState: .Normal)
            })
        }
    }
    
    /////////////////// function drag object to any position in screen //////////
    func wasDragged (buttn : UIButton, event :UIEvent)
    {
        if isSmallObject {
            var touch : UITouch = event.touchesForView(buttn)?.anyObject() as UITouch
            var previousLocation : CGPoint = touch .previousLocationInView(buttn)
            var location : CGPoint = touch .locationInView(buttn)
            var delta_x :CGFloat = location.x - previousLocation.x
            var delta_y :CGFloat = location.y - previousLocation.y
            buttn.center = CGPointMake(buttn.center.x + delta_x,
                buttn.center.y + delta_y);
        }
        
    }
    
    func cloudAnimationLoop(){
        let imageCloud1 = UIImage(named: "cloud1.png")
        let imageviewCloud1 = UIImageView(image:imageCloud1)
        imageviewCloud1.frame = CGRectMake(20, 60, 80, 70)
        self.view.addSubview(imageviewCloud1)
        self.view.sendSubviewToBack(imageviewCloud1)
        
        UIView.animateWithDuration(12.0,
            delay: 0,
            options: .CurveLinear & .AllowUserInteraction & .BeginFromCurrentState,
            animations: {
                imageviewCloud1.frame = CGRectMake(self.view.frame.size.width - 100, 60, 80, 70)
                
            }, completion:{
                (finished: Bool) in
                UIView.animateWithDuration(12.0,
                    delay: 0,
                    options: .CurveLinear & .AllowUserInteraction & .BeginFromCurrentState,
                    animations: {
                        imageviewCloud1.frame = CGRectMake(20, 60, 80, 70)
                        
                    }, completion:{
                        (finished: Bool) in
                        imageviewCloud1.removeFromSuperview()
                        self.cloudAnimationLoop();
                    }
                )
            }
        )
        
    }
    func cloud2AnimationLoop(){
        let imageCloud2 = UIImage(named: "cloud2.png")
        let imageviewCloud2 = UIImageView(image:imageCloud2)
        imageviewCloud2.frame = CGRectMake(-40, 140, 90, 70)
        self.view.addSubview(imageviewCloud2)
        self.view.sendSubviewToBack(imageviewCloud2)
        
        UIView.animateWithDuration(12.0,
            delay: 0,
            options: .CurveLinear & .AllowUserInteraction & .BeginFromCurrentState,
            animations: {
                imageviewCloud2.frame = CGRectMake(self.view.frame.size.width - 120, 140, 90, 70)
                
            }, completion:{
                (finished: Bool) in
                UIView.animateWithDuration(12.0,
                    delay: 0,
                    options: .CurveLinear & .AllowUserInteraction & .BeginFromCurrentState,
                    animations: {
                        imageviewCloud2.frame = CGRectMake(-40, 140, 90, 70)
                        
                    }, completion:{
                        (finished: Bool) in
                        imageviewCloud2.removeFromSuperview()
                        self.cloud2AnimationLoop();
                    }
                )
            }
        )
        
    }

    
}


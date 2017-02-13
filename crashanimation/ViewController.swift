//
//  ViewController.swift
//  crashanimation
//
//  Created by lotawei on 16/9/26.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIViewControllerTransitioningDelegate{

    @IBOutlet weak var aimage: UIImageView!
    @IBAction func show(_ sender: AnyObject) {
//        let   sec = ShowViewController()
//        
//        sec.transitioningDelegate = self
//        
//        self.present(sec, animated: true, completion: nil)
        
        
     
        
        UIView.animate(withDuration: 1, delay: 0, options: .repeat, animations:{
            
            self.aimage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            
            self.aimage.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            
        
        }, completion: nil)
        
        
        
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
           aimage.image  =  #imageLiteral(resourceName: "心里测试.jpeg")
        
        
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let   ani = SACCollapseAnimator()
        
        
        return ani
    }


}


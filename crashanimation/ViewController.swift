//
//  ViewController.swift
//  crashanimation
//
//  Created by lotawei on 16/9/26.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIViewControllerTransitioningDelegate{

    @IBAction func show(_ sender: AnyObject) {
        let   sec = ShowViewController()
        
        sec.transitioningDelegate = self
        
        self.present(sec, animated: true, completion: nil)
        
        
        
        
        
        
        
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let   ani = SACCollapseAnimator()
        
        
        return ani
    }


}


//
//  SACCollapseAnimator.swift
//  crashanimation
//
//  Created by lotawei on 16/9/26.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class SACCollapseAnimator: NSObject , UIViewControllerAnimatedTransitioning{
    //默认动画时间
    var   duration:Double = 2.0
    //碎片大小
    var   slidewidth:NSInteger  = 10
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //获取View
        let containerView = transitionContext.containerView;
        let fromView      = transitionContext.viewController(forKey: .from)?.view
        let  toView        = transitionContext.viewController(forKey: .to)?.view
        
        //截图
        let fromViewSnapshot = fromView?.snapshotView(afterScreenUpdates: false)
        
        //获取横、纵两轴的抽样点 抽样间隔为10
        let xSampleArray = NSMutableArray(capacity:0)
       
           let ySampleArray = NSMutableArray(capacity:0)
        let    wi = NSInteger.init((fromView?.bounds.size.width)!)
        let    he = NSInteger.init((fromView?.bounds.size.height)!)
        
        for   i in stride(from: 0, through: wi, by: self.slidewidth) {
            
              xSampleArray.add(i)
        }
        for   i in stride(from: 0, through: he, by: self.slidewidth) {
            
            ySampleArray.add(i)
        }

        
        //根据抽样点切割
        let snapshots = NSMutableArray(capacity: 0)
        for   q  in  xSampleArray{
            
            
            
            for   r  in  ySampleArray{
                 let snapshotRegion = CGRect(x: (q as! Int) , y: (r as! Int), width: self.slidewidth, height: self.slidewidth)
                
                 let snapshot      = fromViewSnapshot?.resizableSnapshotView(from: snapshotRegion, afterScreenUpdates: false, withCapInsets: UIEdgeInsets.zero)
                    snapshot?.frame        = snapshotRegion
                containerView.addSubview(snapshot!)
                snapshots.add(snapshot)
                
            }
        }
        
        
        //布置View
        containerView.addSubview(toView!)
        containerView.sendSubview(toBack: toView!)
        containerView.sendSubview(toBack: fromView!)
   
        //Collapse动画
        UIView.animate(withDuration: self.duration, delay: 0.1, options: .curveLinear, animations: { 
            for    view  in  snapshots{
                    let  v = view as! UIView
                
                    let  dx = self.randomRange(range: 100, offset: -100)
                   let   dy = self.randomRange(range: 100, offset: NSInteger(fromView!.frame.size.height))
                    v.frame  = v.frame.offsetBy(dx: dx, dy: dy)
                
                
            }
            }) { (_) in
                for    view  in  snapshots{
                    let  v = view as! UIView
                    
                    v.removeFromSuperview()
                    
                }
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }


    
    }
    




    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return    self.duration
    }
    
    func randomRange(range:NSInteger,offset:NSInteger) -> CGFloat {
        return   CGFloat(arc4random_uniform(UInt32(range))) + CGFloat(offset)
    }
    
    
    
}

//
//  ShowViewController.swift
//  crashanimation
//
//  Created by lotawei on 16/9/26.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    var amimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.amimage  = UIImageView(image:  UIImage( named:"砖石"))
        
        self.amimage.frame = CGRect(x: 0, y: 65, width: 375, height: 610)
        
        self.amimage.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.close)))
        view.addSubview(self.amimage)
        // Do any additional setup after loading the view.
    }
    func close(){
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

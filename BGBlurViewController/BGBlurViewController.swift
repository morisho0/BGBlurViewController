//
//  UIViewController+Blur.swift
//  BGBlurViewController
//
//  Created by Shota on 2016/07/19.
//  Copyright © 2016年 morisho0. All rights reserved.
//

import UIKit

public class BGBlurViewController: UIViewController {
    
    var srcImage: UIImage?
    var blurImage: UIImage?
    
    override public func loadView() {
        guard let window = UIApplication.sharedApplication().keyWindow else {
            super.loadView()
            return
        }
        
        UIGraphicsBeginImageContextWithOptions(UIScreen.mainScreen().bounds.size, false, 1.0)
        window.drawViewHierarchyInRect(window.frame, afterScreenUpdates: true)
        srcImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        super.loadView()
    }
    
    public func setBlur(blurRadius: CGFloat, tintColor: UIColor, deltaFactor: CGFloat) {
        guard let image = srcImage, let blurImage = image.applyBlurWithRadius(blurRadius, tintColor: tintColor, saturationDeltaFactor: deltaFactor) else {
            return
        }
        
        self.view.backgroundColor = UIColor(patternImage: blurImage)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        if let image = blurImage {
            self.view.backgroundColor = UIColor(patternImage: image)
        }
    }
    
}

//
//  PhotoTransition.swift
//  Facebook
//
//  Created by Amy Wu on 11/14/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        containerView.backgroundColor = UIColor(white: 0, alpha: 0)
        
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController
        let toViewController = toViewController as! PhotoViewController
        let toFrame = toViewController.imageView.frame

        
    //toViewController.imageView.frame = newsFeedViewController.selectedImageView.frame
        
    toViewController.view.alpha = 0
        
    
        
    UIView.animate(withDuration: duration, animations: {
        
        containerView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        
        newsFeedViewController.selectedImageView.frame = toViewController.imageView.frame
        toViewController.imageView.frame = toFrame
        
    toViewController.view.alpha = 1
    }) { (finished: Bool) -> Void in
    self.finish()
    }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
    
    fromViewController.view.alpha = 1
    UIView.animate(withDuration: duration, animations: {
        
        containerView.backgroundColor = UIColor(white: 0, alpha: 0)

    fromViewController.view.alpha = 0
    }) { (finished: Bool) -> Void in
    self.finish()

    }
    }


}

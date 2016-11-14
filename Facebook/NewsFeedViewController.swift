//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    var image: UIImage!
    var selectedImageView: UIImageView!
    var photoTransition: PhotoTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSize(width: 320, height: feedImageView.image!.size.height)
    }

    
    @IBAction func onImagePressed(_ sender: UITapGestureRecognizer) {
        
        selectedImageView = sender.view as! UIImageView
        
        performSegue(withIdentifier: "imageSegue", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //let fromViewController = segue.destination as! NewsFeedViewController
        //let toViewController = segue.destination as! PhotoViewController
        //var identifier = image.identifier
        
        let destinationViewController = segue.destination as! PhotoViewController
        destinationViewController.image = self.selectedImageView.image

        photoTransition = PhotoTransition()
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        
        destinationViewController.transitioningDelegate = photoTransition
        
        photoTransition.duration = 2.0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

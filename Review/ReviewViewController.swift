//
//  ReviewViewController.swift
//  Restaurante02
//
//  Created by CICE on 22/6/18.
//  Copyright © 2018 alegs0501. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    

    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        imageContainer.image = UIImage(named: restaurant.image)
        
        //Animate containerView, Initial state
        containerView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        closeButton.transform = CGAffineTransform.init(translationX: 100.0, y: 0)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //Spring Animation
        UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveEaseOut, animations: {
            self.containerView.transform = CGAffineTransform.identity
            self.closeButton.transform = CGAffineTransform.identity
        }, completion: nil)
        
        
       /* //Create basic animation ci¡ontainerView
        UIView.animate(withDuration: 0.8) {
            //Establish final state of animation
             self.containerView.transform = CGAffineTransform.identity
        }*/
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

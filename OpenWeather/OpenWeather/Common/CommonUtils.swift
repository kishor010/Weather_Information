//
//  CommonUtils.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 20/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//

import Foundation
import  UIKit


/* Show Progress Indicator */
func showProgressIndicator(view:UIView) {
    
    view.isUserInteractionEnabled = false
    
    // Create and add the view to the screen.
    let progressIndicator = ProgressIndicator(text: "Loading..")
    progressIndicator.tag = Helper.PROGRESS_INDICATOR_VIEW_TAG
    view.addSubview(progressIndicator)
}

/* Hide progress Indicator */
func hideProgressIndicator(view:UIView) {
    
    view.isUserInteractionEnabled = true
    
    if let viewWithTag = view.viewWithTag(Helper.PROGRESS_INDICATOR_VIEW_TAG) {
        viewWithTag.removeFromSuperview()
    }
}

//MARK:- Set Custom Navigation Bar
extension UINavigationController {
    
    func setCustomNavigation(title: String)  {
        
        self.navigationBar.isTranslucent = false
        self.navigationBar.shadowImage = UIImage()
        
        if #available(iOS 11.0, *) {
            self.navigationBar.prefersLargeTitles = true
            self.navigationBar.topItem?.largeTitleDisplayMode = .automatic
        } else {
            // Fallback on earlier versions
        }
        
        self.navigationBar.topItem?.title = title
    }
}

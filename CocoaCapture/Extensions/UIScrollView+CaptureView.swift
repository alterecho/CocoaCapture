//
//  UIScrollView+X.swift
//  CocoaCapture
//
//  Created by v.a.jayachandran on 20/9/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import UIKit

public extension UIScrollView {
    func createContentImage() throws -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: contentSize.width, height: contentSize.height)
        
        // ref to the original parent
        let originalSuperView = superview
        
        // save the original constraints for this scrollview
        let originalConstraints = superview?.constraints.filter {
            $0.firstItem === self || $0.secondItem === self
        }
        
        // save original frame
        let originalFrame = frame
        
        // add scrollview (this) to a remporary view to render
        let renderView = UIView(frame: rect)
        renderView.addSubview(self)
        frame = rect

        // get image from the temporary ScrollView
        let image = try renderView.createImage()
        
        // restore the original parent, state
        originalSuperView?.addSubview(self)
        if let originalConstraints = originalConstraints {
            originalSuperView?.addConstraints(originalConstraints)
        }
        frame = originalFrame
        
        return image
    }
}

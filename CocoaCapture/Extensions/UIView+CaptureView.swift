//
//  UIView+X.swift
//  CocoaCapture
//
//  Created by v.a.jayachandran on 17/9/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import UIKit

public extension UIView {
    func createImage() throws -> UIImage {
        let rect =  self.frame
        UIGraphicsBeginImageContext(rect.size)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            throw Error.failed(message: "unable to get context")
        }
        self.layer.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            throw Error.failed(message: "unable to create image from context")
        }
        UIGraphicsEndImageContext()
        return image
    }
}

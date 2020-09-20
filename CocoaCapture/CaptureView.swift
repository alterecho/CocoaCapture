//
//  CaptureView.swift
//  CocoaCapture
//
//  Created by v.a.jayachandran on 20/9/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import UIKit

public protocol CaptureView {
    func createImage() throws -> UIImage
}

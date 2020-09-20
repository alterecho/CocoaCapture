//
//  ViewController.swift
//  CocoaCaptureDemo
//
//  Created by v.a.jayachandran on 16/9/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import UIKit
import CocoaCapture

class ViewController: UIViewController {

    var imageView: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.black
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5)
            ]
        )
        imageView.backgroundColor = .gray
        
        
        testUIScrollView()
    }
    
    func testUIView() {
        let view = UIView()
        view.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        view.backgroundColor = .red
        
        do {
            imageView.image = try view.createImage()
        } catch {
            showError(error: error)
        }
    }
    
    func testUIScrollView() {
        let frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)
        let scrollView = UIScrollView(frame: frame)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: 1000, height: 1000.0)
        
//        view.addSubview(scrollView)
//        NSLayoutConstraint.activate([
//            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
        
        scrollView.backgroundColor = UIColor.yellow
        
        let cv = UIView()
        cv.frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0)
        cv.backgroundColor = UIColor.red
        scrollView.addSubview(cv)
        
        let cv2 = UIView()
        cv2.frame = CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0)
        cv2.translatesAutoresizingMaskIntoConstraints = false
        cv2.backgroundColor = UIColor.green
        scrollView.addSubview(cv2)
        
        NSLayoutConstraint.activate([
            cv2.topAnchor.constraint(equalTo: scrollView.topAnchor),
            cv2.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            cv2.widthAnchor.constraint(equalToConstant: 60.0),
            cv2.heightAnchor.constraint(equalToConstant: 60.0)
        ])
        
        do {
            imageView.image = try scrollView.createContentImage()
        } catch {
            showError(error: error)
        }

    }
    
    func showError(error: Error) {
        let alertVC = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .actionSheet)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alertVC.dismiss(animated: true, completion: nil)
        }))

    }

}


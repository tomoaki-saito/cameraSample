//
//  SimpleCameraViewController.swift
//  cameraSample
//
//  Created by tomoaki saito on 2015/06/23.
//  Copyright (c) 2015年 mikan. All rights reserved.
//

import UIKit

class SimpleCameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var cameraPicker: UIImagePickerController? = nil
    var imagePicker: UIImagePickerController? = nil
    let windowSize: CGSize = UIScreen.mainScreen().bounds.size
    
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        self.imageView.clipsToBounds = true

        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            self.cameraPicker = UIImagePickerController()
            self.cameraPicker?.sourceType = .Camera
            self.cameraPicker?.delegate = self
//            self.cameraPicker?.showsCameraControls = false
            let overlayView = OverlayView.instance()
            
            println(self.cameraPicker?.view.frame)
            println(cameraPicker?.preferredContentSize)
            println(cameraPicker?.toolbar.frame)
            println(cameraPicker?.cameraOverlayView?.frame)
            
            overlayView.frame = CGRectMake(0, cameraPicker!.toolbar.frame.size.height, cameraPicker!.toolbar.frame.size.width, self.cameraPicker!.preferredContentSize.height)
            self.cameraPicker?.cameraOverlayView = overlayView
        }
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            self.imagePicker = UIImagePickerController()
            self.imagePicker?.sourceType = .PhotoLibrary
            self.imagePicker?.delegate = self
            self.imagePicker?.allowsEditing = false
        }
    }

    @IBAction func cameraButtonPushed(sender: AnyObject) {
        if cameraPicker != nil {
            println(self.cameraPicker?.view.frame)
            println(cameraPicker?.preferredContentSize)
            println(cameraPicker?.toolbar.frame)
            self.presentViewController(self.cameraPicker!, animated:true, completion:nil)
        }
    }

    @IBAction func loadImageButtonTapped(sender: UIButton) {
        if imagePicker != nil {
            self.presentViewController(self.imagePicker!, animated: true, completion: nil)
        }
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}

//
//  CustomCameraViewController.swift
//  cameraSample
//
//  Created by tomoaki saito on 2015/06/23.
//  Copyright (c) 2015年 mikan. All rights reserved.
//

import UIKit
import AVFoundation

class CustomCameraViewController: UIViewController {
    var mySession : AVCaptureSession!
    var myDevice : AVCaptureDevice!
    var myImageOutput : AVCaptureStillImageOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCamera()
    }
    
    func configureCamera() -> Bool {
        mySession = AVCaptureSession()
        let devices = AVCaptureDevice.devices()
        for device in devices{
            if(device.position == AVCaptureDevicePosition.Back){
                myDevice = device as! AVCaptureDevice
            }
        }
        if self.myDevice == nil {
            return false
        }
        let videoInput = AVCaptureDeviceInput.deviceInputWithDevice(myDevice, error: nil) as! AVCaptureDeviceInput
        mySession.addInput(videoInput)
        myImageOutput = AVCaptureStillImageOutput()
        mySession.addOutput(myImageOutput)
        let myVideoLayer : AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.layerWithSession(mySession) as! AVCaptureVideoPreviewLayer
        myVideoLayer.frame = self.view.bounds
        myVideoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.view.layer.addSublayer(myVideoLayer)
        
        mySession.startRunning()
        
        let myButton = UIButton(frame: CGRectMake(0,0,120,50))
        myButton.backgroundColor = UIColor.redColor();
        myButton.layer.masksToBounds = true
        myButton.setTitle("撮影", forState: .Normal)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-50)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(myButton);
        return true
    }
    
    // ボタンイベント.
    func onClickMyButton(sender: UIButton){

        // ビデオ出力に接続.
        let myVideoConnection = myImageOutput.connectionWithMediaType(AVMediaTypeVideo)
        
        // 接続から画像を取得.
        self.myImageOutput.captureStillImageAsynchronouslyFromConnection(myVideoConnection, completionHandler: { (imageDataBuffer, error) -> Void in
            
            // 取得したImageのDataBufferをJpegに変換.
            let myImageData : NSData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageDataBuffer)
            
            // JpegからUIIMageを作成.
            let myImage : UIImage = UIImage(data: myImageData)!
            
            // アルバムに追加.
            UIImageWriteToSavedPhotosAlbum(myImage, self, nil, nil)
            
        })
    }
}


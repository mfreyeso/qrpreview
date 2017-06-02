//
//  ViewController.swift
//  PreviewQR
//
//  Created by Mario Reyes Ojeda on 1/06/17.
//  Copyright © 2017 Mario Reyes Ojeda. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var session: AVCaptureSession?
    var layer: AVCaptureVideoPreviewLayer?
    var qrFrame : UIView?
    var url : String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "QR Reader"
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do{
            let input = try AVCaptureDeviceInput(device: device)
            session = AVCaptureSession()
            session?.addInput(input)
            let metadata = AVCaptureMetadataOutput()
            session?.addOutput(metadata)
            
            metadata.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadata.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        }
        catch{
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


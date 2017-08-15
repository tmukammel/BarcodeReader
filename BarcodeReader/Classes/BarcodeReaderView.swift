//
//  BarcodeReaderView.swift
//  Pods
//
//  Created by Twaha Mukammel on 8/15/17.
//
//

import UIKit
import AVFoundation

@objc public protocol BarcodeReaderDelegate: NSObjectProtocol {
    func barcodeOutput(string: String?)
}

open class BarcodeReaderView: UIView, AVCaptureMetadataOutputObjectsDelegate {

    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var barcodeFrameLayer: CALayer?
    
    let supportedCodeTypes = [AVMetadataObjectTypeUPCECode,
                              AVMetadataObjectTypeCode39Code,
                              AVMetadataObjectTypeCode39Mod43Code,
                              AVMetadataObjectTypeCode93Code,
                              AVMetadataObjectTypeCode128Code,
                              AVMetadataObjectTypeEAN8Code,
                              AVMetadataObjectTypeEAN13Code,
                              AVMetadataObjectTypeAztecCode,
                              AVMetadataObjectTypePDF417Code,
                              AVMetadataObjectTypeQRCode]
    
    public var showBarcodeFrame: Bool = true
    
    public var delegate: BarcodeReaderDelegate? = nil
    
    public func startReader() {
        
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            captureSession = AVCaptureSession()
            
            captureSession?.addInput(input)
            
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = layer.bounds
            layer.addSublayer(videoPreviewLayer!)
            
            captureSession?.startRunning()
            
            if showBarcodeFrame == true {
                barcodeFrameLayer = CALayer()
                
                if let frameLayer = barcodeFrameLayer {
                    frameLayer.borderColor = UIColor.green.cgColor
                    frameLayer.borderWidth = 2
                    
                    layer.addSublayer(frameLayer)
                }
            }
            
        } catch {
            print(error)
            return
        }
        
    }
    
    // MARK: - AVCaptureMetadataOutputObjectsDelegate Methods
    
    public func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        if metadataObjects == nil || metadataObjects.count == 0 {
            barcodeFrameLayer?.frame = CGRect.zero
            
            delegate?.barcodeOutput(string: nil)
            
            return
        }
        
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if supportedCodeTypes.contains(metadataObj.type) {
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            barcodeFrameLayer?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                delegate?.barcodeOutput(string: metadataObj.stringValue)
            }
        }
    }

}

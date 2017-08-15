//
//  ViewController.swift
//  BarcodeReader
//
//  Created by tmukammel on 08/15/2017.
//  Copyright (c) 2017 tmukammel. All rights reserved.
//

import UIKit
import BarcodeReader

class ViewController: UIViewController, BarcodeReaderDelegate {
    
    @IBOutlet weak var barcodeReader: BarcodeReaderView!
    @IBOutlet weak var outputLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        barcodeReader.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        barcodeReader.startReader()
    }
    
    // MARK: - BarcodeReaderDelegate
    func barcodeOutput(string: String?) {
        outputLabel.text = string
    }
}


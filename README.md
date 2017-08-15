# BarcodeReader

[![CI Status](http://img.shields.io/travis/tmukammel/BarcodeReader.svg?style=flat)](https://travis-ci.org/tmukammel/BarcodeReader)
[![Version](https://img.shields.io/cocoapods/v/BarcodeReader.svg?style=flat)](http://cocoapods.org/pods/BarcodeReader)
[![License](https://img.shields.io/cocoapods/l/BarcodeReader.svg?style=flat)](http://cocoapods.org/pods/BarcodeReader)
[![Platform](https://img.shields.io/cocoapods/p/BarcodeReader.svg?style=flat)](http://cocoapods.org/pods/BarcodeReader)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Screenshots

<img src="https://dl.dropboxusercontent.com/s/jgl86lb7l2knk6b/BarcodeReaderScreenShot.PNG?dl=0" />

## Implementation

Simply create a UIView in interface builder and assign custom class BarcodeReaderView.

<img src="https://dl.dropboxusercontent.com/s/qzqp41of8rgjpob/BarcodeReaderViewClass.png?dl=0" />

Then

```swift
import UIKit
import BarcodeReader

class ViewController: UIViewController, BarcodeReaderDelegate {

    @IBOutlet weak var barcodeReader: BarcodeReaderView!
    @IBOutlet weak var outputLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        barcodeReader.delegate = self
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
```

## Installation

BarcodeReader is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BarcodeReader"
```

## Author

tmukammel, t.mukammel@aol.com

## License

BarcodeReader is available under the MIT license. See the LICENSE file for more info.

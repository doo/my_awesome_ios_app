//
//  ViewController.swift
//  MyAwesomeIOSApp
//
//  Created by Danil Voitenko on 31.08.21.
//

import UIKit
import ScanbotSDK

class ViewController: UIViewController {
    
    @IBOutlet private var scannedDocumentImageView: UIImageView?
    
    private var scannerViewController: SBSDKUIDocumentScannerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = SBSDKUIDocumentScannerConfiguration.default()
        self.scannerViewController = SBSDKUIDocumentScannerViewController.createNew(with: configuration,
                                                                                    andDelegate: self)
    }

    @IBAction func scanButtonDidTap(_ sender: UIButton) {
        if let scannerViewController = self.scannerViewController {
            self.present(scannerViewController, animated: true, completion: nil)
        }
    }
}

extension ViewController: SBSDKUIDocumentScannerViewControllerDelegate {
    func scanningViewController(_ viewController: SBSDKUIDocumentScannerViewController,
                                didFinishWith document: SBSDKUIDocument) {
        self.scannedDocumentImageView?.image = document.page(at: 0)?.documentImage()
    }
}


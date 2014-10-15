//
//  DouyoViewController.swift
//  Douyo
//
//  Created by mironal on 2014/10/15.
//  Copyright (c) 2014年 mironal. All rights reserved.
//

import UIKit

class DouyoViewController: UIViewController {
    
    var question: String?
    var positiveCount: Int = 0
    var negativeCount: Int = 0
    var isLock: Bool = false {
        didSet {
            
            if let button = resultButton {
                button.enabled = !isLock
            }
            if let button = lockButton {
                
                if isLock {
                    button.setTitle(NSLocalizedString("Unlock", comment: "comment"), forState: UIControlState.Normal)
                } else {
                    button.setTitle(NSLocalizedString("Lock", comment: "comment"), forState: UIControlState.Normal)
                }
            }
        }
    }

    @IBOutlet weak var douyoLabel: UILabel!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var lockButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = NSLocalizedString("どうよ？", comment: "comment")
        douyoLabel.text = question
        isLock = true
    }

    @IBAction func pushPositiveButton(sender: UIButton) {
        
        self.positiveCount = self.positiveCount + 1
    }
    
    @IBAction func pushNegativeButton(sender: UIButton) {
        
        self.negativeCount = self.negativeCount + 1
    }
    
    @IBAction func pushResultButton(sender: AnyObject) {
        
        let vc = ResultViewController.instanceateFromStoryboardWithQuestion(question, positiveCount: positiveCount, negativeCount: negativeCount)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func pushLockButton(sender: UIButton) {
        
        isLock = !isLock
    }

}

extension DouyoViewController {
    
    class func instanceateFromStoryboardWithQuestion(question: String?) -> DouyoViewController {
        
        let sb = UIStoryboard(name: "DouyoStoryboard", bundle: nil)
        let vc: DouyoViewController = sb.instantiateInitialViewController() as DouyoViewController
        
        vc.question = question
        
        return vc
    }
}

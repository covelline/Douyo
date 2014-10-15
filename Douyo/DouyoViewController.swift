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


    @IBOutlet weak var douyoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        douyoLabel.text = question
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
}

extension DouyoViewController {
    
    class func instanceateFromStoryboardWithQuestion(question: String?) -> DouyoViewController {
        
        let sb = UIStoryboard(name: "DouyoStoryboard", bundle: nil)
        let vc: DouyoViewController = sb.instantiateInitialViewController() as DouyoViewController
        
        vc.question = question
        
        return vc
    }
}

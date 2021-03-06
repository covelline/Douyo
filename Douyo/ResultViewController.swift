//
//  ResultViewController.swift
//  Douyo
//
//  Created by mironal on 2014/10/15.
//  Copyright (c) 2014年 mironal. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var question: String?
    var positiveCount: Int = 0 {
        didSet {
            
            if let label = positiveCountLabel {
                label.text = "\(positiveCount)"
            }
        }
    }
    var negativeCount: Int = 0 {
        didSet {
            
            if let label = negativeCountLabel {
                label.text = "\(negativeCount)"
            }
        }
    }
    @IBOutlet weak var questionLabelContainer: UIView!
    
    @IBOutlet weak var douyoConstantLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var positiveLabelContainer: UIView!
    @IBOutlet weak var positiveTitleLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var positiveCountLabel: UILabel!
    @IBOutlet weak var negativeCountLabel: UILabel!
    
    @IBOutlet weak var negativeTitleLabel: UILabel!
    @IBOutlet weak var negativeLabelContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = question
        positiveCountLabel.text = "\(positiveCount)"
        negativeCountLabel.text = "\(negativeCount)"
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = NSLocalizedString("結果", comment: "comment")
        
        self.view.backgroundColor = UIColor.baseColor()
        
        self.questionLabelContainer.backgroundColor = UIColor.lowColor()
        self.questionLabel.textColor = UIColor.baseColor()
        self.douyoConstantLabel.textColor = UIColor.baseColor()
        
        self.positiveLabelContainer.backgroundColor = UIColor.lowColor()
        self.positiveCountLabel.textColor = UIColor.baseColor()
        self.positiveTitleLabel.textColor = UIColor.baseColor()
        
        self.negativeLabelContainer.backgroundColor = UIColor.lowColor()
        self.negativeCountLabel.textColor = UIColor.baseColor()
        self.negativeTitleLabel.textColor = UIColor.lowColor()
        
        self.closeButton.tintColor = UIColor.baseColor()
        self.closeButton.backgroundColor = UIColor.lowColor()
    }
    
    @IBAction func pushClose(sender: AnyObject) {
        
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension ResultViewController {
    
    class func instanceateFromStoryboardWithQuestion(question: String?, positiveCount: Int, negativeCount: Int) -> ResultViewController {
        
        let sb = UIStoryboard(name: "ResultStoryboard", bundle: nil)
        let vc: ResultViewController = sb.instantiateInitialViewController() as ResultViewController
        
        vc.question = question
        vc.positiveCount = positiveCount
        vc.negativeCount = negativeCount
        
        return vc
    }
    
}

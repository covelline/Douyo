//
//  QuestionViewController.swift
//  Douyo
//
//  Created by mironal on 2014/10/15.
//  Copyright (c) 2014年 mironal. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var bottomSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var questionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillChangeFrame:", name: UIKeyboardWillChangeFrameNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textViewDidChange:", name: UITextViewTextDidChangeNotification, object: questionTextView)
        
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        questionTextView.becomeFirstResponder()
        updateQuestionButtonState()
    }
    
    func updateQuestionButtonState() {
        questionButton.enabled = countElements(questionTextView.text) > 0
    }
    
    // MARK: - Notification
    
    /*
    
    func keyboardWillChangeFrame(note aNote: NSNotification) {
    
    みたいに名前付き引数で宣言すると addObserver のとこで以下のエラーでクラッシュ
    
    [Douyo.QuestionViewController keyboardWillChangeFrame:]: unrecognized selector sent to instance 0x7993d590
    
    名前付き引数のメソッドってセレクタで取得できないの？
    
    */
    func keyboardWillChangeFrame(note: NSNotification) {
        
        if let userInfo = note.userInfo {
            
            let endFrame: CGRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()

            self.bottomSpaceConstraint.constant = endFrame.size.height + 20
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.view.setNeedsLayout()
            })
        }
    }
    
    func textViewDidChange(note: NSNotification) {
        
        updateQuestionButtonState()
    }
    
    // MARK: - Events
    
    @IBAction func pushQuestionButton(sender: UIButton) {
        
        let question = questionTextView.text
        let vc: DouyoViewController = DouyoViewController.instanceateFromStoryboardWithQuestion(question)
        
        let nav: UINavigationController = UINavigationController(rootViewController: vc)
        
        presentViewController(nav, animated: true, completion: nil)
    }
}



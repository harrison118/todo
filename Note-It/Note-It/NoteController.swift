//
//  NoteController.swift
//  Note-It
//
//  Created by Harrison Stevens on 25/10/2016.
//  Copyright © 2016 Harrison Stevens. All rights reserved.
//

import UIKit

class NoteController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var noteField: UITextView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    
    
    
    @IBAction func dismissKeyboard(_ sender : UIBarButtonItem ){
        self.textField.resignFirstResponder()
        self.noteField.resignFirstResponder()
    }
    
    public var noteID : Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton.tintColor = UIColor.clear
        self.textField.delegate = self
        self.noteField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
        
        if let id:Int = self.noteID {
            print("View did load \(id)")
            if let note:Note = try? Notes.sharedInstance.getNote(atIndex: id) {
            self.title = note.title
            self.textField.text = note.title
            self.noteField.text = note.text
            }

        // Do any additional setup after loading the view.
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Finished Editing the title")
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("Finished Editing the Note")
    }
    
    func keyboardWillShow(_ notification : NSNotification){
        print("Keyboard will Show")
        self.doneButton.tintColor = nil
        if let info = notification.userInfo {
            if let keyboardInfo = info[UIKeyboardFrameBeginUserInfoKey] as! NSValue? {
                let height:CGFloat = keyboardInfo.cgRectValue.height
                print("height is \(height)")
                print("bottom \(self.bottomConstraint.constant)")
                self.bottomConstraint.constant = height + 8
            }
        }
        
    }
    
    func keyboardWillHide(_ notification : NSNotification) {
        print("keyboard will Hide ")
        self.doneButton.tintColor = UIColor.clear
        self.bottomConstraint.constant = 8

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

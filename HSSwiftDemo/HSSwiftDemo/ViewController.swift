//
//  ViewController.swift
//  HSSwiftDemo
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contactUsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.viewController = self
        HelpshiftSupport.requestUnreadMessagesCount(false);
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.viewController = nil
    }
    
    @IBAction func onContactUs(_ sender: UIButton) {
        // showConversation API : allows a user to directly send feedback or start a new conversation.
        HelpshiftSupport.showConversation(self, with: nil)
    }
    
    @IBAction func getUnreadCount(_ sender: Any) {
        HelpshiftSupport.requestUnreadMessagesCount(true)
    }
    
    func updateBadgeCount(_ count: Int) {
        title = "Contact Us"
        if (count > 0) {
            title = "Contact Us (\(count))"
        }
        DispatchQueue.main.async {
            self.contactUsButton.setTitle (self.title, for: .normal)
        }
    }
    
}


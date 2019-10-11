//
//  AppDelegate.swift
//  HSSwiftDemo
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, HelpshiftSupportDelegate
{
    var window: UIWindow?
    var viewController: ViewController?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        // Override point for customization after application launch.

        HelpshiftCore.initialize(with: HelpshiftSupport.sharedInstance())

        let installConfigBuilder = HelpshiftInstallConfigBuilder()
        installConfigBuilder.enableAutomaticThemeSwitching = true
        // Replace the placeholder strings with your app's Helpshift install credentials
        HelpshiftCore.install(forApiKey: "<YOUR_API_KEY>",
                              domainName: "<YOUR_DOMAIN_NAME>",
                              appID: "<YOUR_APP_ID>",
                              with: installConfigBuilder.build())
        HelpshiftSupport.sharedInstance().delegate = self;
    }
    
    // The delegate will get fired every time the Helpshift session starts.
    func helpshiftSupportSessionHasBegun() {
        print("Helpshift session started");
    }
    
    // The delegate will get fired every time the Helpshift session ends.
    func helpshiftSupportSessionHasEnded() {
        print("Helpshift session ended");
    }
    
    // This delegate is the response to the requestUnreadMessagesCount: method. It provides the number of unread messages in the current conversation.
    func didReceiveUnreadMessagesCount(_ count: Int) {
        print("Received count: \(count)");
        // update the badge in the view controller
        if (viewController != nil) {
            viewController?.updateBadgeCount(count);
        }
    }
    
    // This delegate method is called when a Helpshift in-app notification is received and displayed.
    func didReceiveInAppNotification(withMessageCount count: Int) {
        print("In-app notification count : \(count)");
        // update the badge in the view controller
        if (viewController != nil) {
            viewController?.updateBadgeCount(count);
        }
    }
    
    //  The delegate will get fired every time the user starts a new conversation. The delegate method will receive the conversation message in it's arguments.
    func newConversationStarted(withMessage newMessage: String) {
        print("New conversation started with message: \(newMessage)");
    }
    
    // This delegates will get called every time a user replies to a conversation.
    func userRepliedToConversation(withMessage userReply: String){
        print("User replied to conversation with message : \(userReply)");
    }
    
    // This delegates will get called every time a user completes the customer satisfaction survey. The customer satisfaction survey is shown after an issue gets resolved.
    func userCompletedCustomerSatisfactionSurvey(_ rating: Int, withFeedback feedback: String) {
        print("User completed customer satisfaction survey with rating: \(rating) and feedback: \(feedback)");
    }
    
    // This delegate is called whenever the ongoing Conversation is resolved, rejected from the Dashboard, or archived.
    func conversationEnded() {
        print("Conversation is ended");
    }
}


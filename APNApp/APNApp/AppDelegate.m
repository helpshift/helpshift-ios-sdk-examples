#import "AppDelegate.h"
#import "HelpshiftCore.h"
#import "HelpshiftAll.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Install Helpshift
    [HelpshiftCore initializeWithProvider:[HelpshiftAll sharedInstance]];
    [HelpshiftCore installForApiKey:@"your_api_key"
                         domainName:@"your_domain_name"
                              appID:@"your_app_id"];
    
    // Register for push notifications
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        UIUserNotificationType notificationType = UIUserNotificationTypeBadge | UIUserNotificationTypeAlert;
        UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:notificationType categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        
    } else {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    }
    
    // Handle push notifications from Helpshift
    if (launchOptions != nil)
    {
        NSDictionary* userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (userInfo != nil && [[userInfo objectForKey:@"origin"] isEqualToString:@"helpshift"])
        {
            [HelpshiftCore handleRemoteNotification:userInfo withController:self.window.rootViewController];
        }
    }
    
    return YES;
}

- (void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [HelpshiftCore registerDeviceToken:deviceToken];
}

- (void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    // Handle push notifications from Helpshift
    if ([[userInfo objectForKey:@"origin"] isEqualToString:@"helpshift"]) {
        [HelpshiftCore handleRemoteNotification:userInfo withController:self.window.rootViewController];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Set application icon badge number to an appropriate value
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

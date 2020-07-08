#import "AppDelegate.h"
@import Helpshift;


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Install Helpshift
    HelpshiftInstallConfigBuilder *installConfigBuilder = [[HelpshiftInstallConfigBuilder alloc] init];
    // For more explanation, please visit https://developers.helpshift.com/ios/sdk-configuration/#disableAutomaticPushHandling
    installConfigBuilder.enableAutomaticThemeSwitching = YES;
    [HelpshiftCore initializeWithProvider:[HelpshiftSupport sharedInstance]];
    [HelpshiftCore installForApiKey:@"your_api_key"
                         domainName:@"your_domain_name"
                              appID:@"your_app_id"
                         withConfig:installConfigBuilder.build];
    
    // Register for push notifications
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert)
                          completionHandler:^(BOOL granted, NSError *_Nullable error) {
                              if(error) {
                                  NSLog(@"Error while requesting Notification permissions.");
                              }
                          }];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Set application icon badge number to an appropriate value
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}
#pragma mark Notification Delegates
- (void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [HelpshiftCore registerDeviceToken:deviceToken];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    if([[notification.request.content.userInfo objectForKey:@"origin"] isEqualToString:@"helpshift"]) {
        [HelpshiftCore handleNotificationWithUserInfoDictionary:notification.request.content.userInfo
                                                    isAppLaunch:false
                                                 withController:self.window.rootViewController];
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)(void))completionHandler {
    if([[response.notification.request.content.userInfo objectForKey:@"origin"] isEqualToString:@"helpshift"]) {
        [HelpshiftCore handleNotificationResponseWithActionIdentifier:response.actionIdentifier
                                                             userInfo:response.notification.request.content.userInfo
                                                    completionHandler:completionHandler];
    }
    completionHandler();
}


@end

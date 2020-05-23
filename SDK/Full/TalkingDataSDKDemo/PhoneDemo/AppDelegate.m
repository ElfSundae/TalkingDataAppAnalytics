//
//  AppDelegate.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/5/22.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import "AppDelegate.h"
#import "TalkingData.h"

@interface AppDelegate ()
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
    <UNUserNotificationCenterDelegate>
#endif

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    
    NSString *appAnalyticsAppId = @"DE40FB8A722D454B8981E2F842E6AAB6";
    NSString *appAnalyticsChannelId = @"AppStore";
    [TalkingData backgroundSessionEnabled];
    [TalkingData sessionStarted:appAnalyticsAppId withChannelId:appAnalyticsChannelId];
    
    
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 10.0f) {
        NSLog(@"TalkingData: Launch options :%@", launchOptions);
        [TalkingData handlePushMessage:launchOptions];
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0f) {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        UNAuthorizationOptions options = UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound;
        [center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
            NSLog(@"TalkingData: Request authorization completion granted is %@", granted ? @"YES" : @"NO");
        }];
#endif
    } else if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f) {
        UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    [application registerForRemoteNotifications];
    application.applicationIconBadgeNumber = 0;
    
    self.locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.distanceFilter = 10.0;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f) {
        [_locationManager requestWhenInUseAuthorization];
    }
    [_locationManager startUpdatingLocation];
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"TalkingData: Register for remote notifications with device token:%@", deviceToken);
    [TalkingData setDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"TalkingData: Fail to register for remote notifications with error:%@", error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"TalkingData: Receive remote notification:%@", userInfo);
    [TalkingData handlePushMessage:userInfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    NSLog(@"TalkingData: Receive silent notification:%@", userInfo);
    completionHandler(UIBackgroundFetchResultNewData);
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    NSDictionary *userInfo = notification.request.content.userInfo;
    NSLog(@"TalkingData: Present notification:%@", userInfo);
    [TalkingData handlePushMessage:userInfo];
    completionHandler(0);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler {
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    NSLog(@"TalkingData: Receive notification response:%@", userInfo);
    [TalkingData handlePushMessage:userInfo];
    completionHandler();
}
#endif

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"TalkingData: Update location:%@", locations);
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    NSLog(@"TalkingData: openURL:%@", url);
    if ([TalkingData handleUrl:url]) {
        return YES;
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    NSLog(@"TalkingData: openURL:%@", url);
    if ([TalkingData handleUrl:url]) {
        return YES;
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    NSLog(@"TalkingData: openURL:%@", url);
    if ([TalkingData handleUrl:url]) {
        return YES;
    }
    
    return YES;
}

@end

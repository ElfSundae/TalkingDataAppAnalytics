//
//  AppDelegate.m
//  Example
//
//  Created by Elf Sundae on 2020/05/23.
//  Copyright © 2020 https://0x123.com. All rights reserved.
//

#import "AppDelegate.h"
#import <TalkingDataAppAnalytics/TalkingDataAppAnalytics.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UIViewController alloc] init];
    [self.window makeKeyAndVisible];

    NSLog(@"%@", [UIDevice.currentDevice talkingDataDeviceIdentifier]);

    return YES;
}

@end

//
//  AppDelegate.h
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/5/22.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <
    CLLocationManagerDelegate,
    UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end


//
//  TDAAPageSecondViewController.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/5/22.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import "TDAAPageSecondViewController.h"
#import "TalkingData.h"

@implementation TDAAPageSecondViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [TalkingData trackPageBegin:@"新页面2"];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [TalkingData trackPageEnd:@"新页面2"];
}

@end

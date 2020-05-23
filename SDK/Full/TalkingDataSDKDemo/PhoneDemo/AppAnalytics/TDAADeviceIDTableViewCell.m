//
//  TDAADeviceIDTableViewCell.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2018/8/29.
//  Copyright © 2018年 TendCloud. All rights reserved.
//

#import "TDAADeviceIDTableViewCell.h"
#import "TalkingData.h"

@interface TDAADeviceIDTableViewCell ()

@property (weak, nonatomic) IBOutlet UITextField *deviceIDField;

@end

@implementation TDAADeviceIDTableViewCell

- (IBAction)showDeviceID {
    self.deviceIDField.text = [TalkingData getDeviceID];
}

@end

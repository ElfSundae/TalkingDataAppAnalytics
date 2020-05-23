//
//  TDAALocationTableViewCell.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/6/26.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import "TDAALocationTableViewCell.h"
#import "TalkingData.h"

@interface TDAALocationTableViewCell ()

@property (weak, nonatomic) IBOutlet UITextField *latitudeField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeField;

@end

@implementation TDAALocationTableViewCell

- (IBAction)setLocation:(UIButton *)sender {
    double latitude = [self.latitudeField.text doubleValue];
    double longitude = [self.longitudeField.text doubleValue];
    [TalkingData setLatitude:latitude longitude:longitude];
}

@end

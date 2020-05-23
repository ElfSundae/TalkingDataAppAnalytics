//
//  UIDevice+TalkingDataExtension.m
//  TalkingDataAppAnalytics
//
//  Created by Elf Sundae on 2020/05/23.
//  Copyright © 2020 https://0x123.com. All rights reserved.
//

#import "UIDevice+TalkingDataExtension.h"
#import "TalkingData.h"

@implementation UIDevice (TalkingDataExtension)

- (NSString *)talkingDataDeviceIdentifier
{
    return [TalkingData getDeviceID];
}

@end

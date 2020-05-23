//
//  TDAAStandardViewController.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/6/26.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import "TDAAStandardViewController.h"
#import "TalkingData.h"

@implementation TDAAStandardViewController

- (IBAction)placeOrder {
    TalkingDataOrder *order = [TalkingDataOrder createOrder:@"order01" total:2466400 currencyType:@"CNY"];
    [order addItem:@"A1660" category:@"手机" name:@"iPhone 7" unitPrice:538800 amount:2];
    [order addItem:@"MLH12CH" category:@"电脑" name:@"MacBook Pro" unitPrice:1388800 amount:1];
    [TalkingData onPlaceOrder:@"user01" order:order];
}
    
- (IBAction)payOrder {
    TalkingDataOrder *order = [TalkingDataOrder createOrder:@"order01" total:2466400 currencyType:@"CNY"];
    [order addItem:@"A1660" category:@"手机" name:@"iPhone 7" unitPrice:538800 amount:2];
    [order addItem:@"MLH12CH" category:@"电脑" name:@"MacBook Pro" unitPrice:1388800 amount:1];
    [TalkingData onOrderPaySucc:@"user01" payType:@"Apple Pay" order:order];
}
    
- (IBAction)viewItem {
    [TalkingData onViewItem:@"A1660" category:@"手机" name:@"iPhone 7" unitPrice:538800];
}
    
- (IBAction)addItem {
    [TalkingData onAddItemToShoppingCart:@"MLH12CH" category:@"电脑" name:@"MacBook Pro" unitPrice:1388800 amount:1];
}
    
- (IBAction)viewShoppingCart {
    TalkingDataShoppingCart *shoppingCart = [TalkingDataShoppingCart createShoppingCart];
    [shoppingCart addItem:@"A1660" category:@"手机" name:@"iPhone 7" unitPrice:538800 amount:2];
    [shoppingCart addItem:@"MLH12CH" category:@"电脑" name:@"MacBook Pro" unitPrice:1388800 amount:1];
    [TalkingData onViewShoppingCart:shoppingCart];
}


@end

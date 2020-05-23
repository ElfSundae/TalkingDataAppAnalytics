//
//  TDGeneralViewController.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/5/22.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import "TDGeneralViewController.h"

@interface TDGeneralViewController ()

@property (weak, nonatomic) IBOutlet UILabel *subject;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UITextView *detail;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UIButton *customize;

@end

@implementation TDGeneralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
    
    self.subject.text = [NSString stringWithFormat:@"　%@", _info[@"title"]];
    self.icon.image = [UIImage imageNamed:_info[@"name"]];
    self.detail.text = _info[@"detail"];
    BOOL selected = [_info[@"selected"] boolValue];
    if (selected) {
        self.status.text = @"当前SDK已选择此功能";
        self.status.textColor = [UIColor greenColor];
    } else {
        self.status.text = @"当前SDK未选择此功能";
        self.status.textColor = [UIColor redColor];
    }
    self.customize.hidden = selected;
}

- (void)tap:(id)sender{
    [self.view endEditing:YES];
}

- (IBAction)reapply:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://doc.talkingdata.com"]];
}

@end

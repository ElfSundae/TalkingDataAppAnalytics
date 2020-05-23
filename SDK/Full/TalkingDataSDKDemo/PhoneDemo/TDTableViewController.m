//
//  TDTableViewController.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/8/1.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import "TDTableViewController.h"

@interface TDTableViewController ()

@property (nonatomic) NSInteger showIndex;

@end

@implementation TDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _showIndex == section ? 1 : 0;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeSection:)];
    [view addGestureRecognizer:gesture];
    view.tag = section;
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    ((UITableViewHeaderFooterView *)view).backgroundView = [[UIView alloc] init];
    ((UITableViewHeaderFooterView *)view).backgroundView.backgroundColor = [UIColor clearColor];
}

#pragma mark - Gesture event

- (void)tap:(id)sender {
    [self.view endEditing:YES];
}

- (void)changeSection:(UIGestureRecognizer *)gesture {
    NSInteger tapIndex = gesture.view.tag;
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    if (_showIndex == -1) {
        _showIndex = tapIndex;
    } else if (_showIndex == tapIndex) {
        _showIndex = -1;
    } else {
        [indexSet addIndex:_showIndex];
        _showIndex = tapIndex;
    }
    [indexSet addIndex:tapIndex];
    
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}

@end

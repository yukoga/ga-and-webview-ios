//
//  FirstViewController.m
//  com.yukoga.ganalytics
//
//  Created by Yutaka Koga on 10/11/16.
//  Copyright © 2016 yukoga. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LOG(@"Here is FirstViewController's viewDidLoad.");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    LOG(@"Here is FirstViewController's viewDidAppear.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

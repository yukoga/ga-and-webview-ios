//
//  ThirdViewController.m
//  com.yukoga.ganalytics
//
//  Created by Yutaka Koga on 10/12/16.
//  Copyright © 2016 yukoga. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LOG(@"Here is ThirdViewController's viewDidLoad.");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    LOG(@"Here is ThirdViewController's viewDidAppear.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

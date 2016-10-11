//
//  SecondViewController.m
//  com.yukoga.ganalytics
//
//  Created by Yutaka Koga on 10/11/16.
//  Copyright © 2016 yukoga. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.secondWebView.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
    LOG(@"Here is SecondViewController's viewDidLoad.");
    NSString* urlString = @"http://storage.googleapis.com/ga-webview-bestpractice/webview-with-ga.html";
    NSURL* url = [NSURL URLWithString: urlString];
    NSURLRequest* myRequest = [NSURLRequest requestWithURL: url];
    [self.secondWebView loadRequest: myRequest];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    LOG(@"Here is SecondViewController's viewDidAppear.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)secondWebView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    if ([ request.URL.scheme isEqualToString:@"tracking" ]) {
        [self sendClickEvent: request];
        return NO;
    } else {
        if ([ request.URL.query containsString:@"tracking" ]) {
            [self sendClickLinks: request];
            return YES;
        } else {
            return YES;
        }
    }
}

- (void)sendClickEvent: (NSURLRequest *)request {
    if ([request.URL.host isEqualToString:@"clicktracker"]) {
        NSLog(@"Here is sendClickEvent. Invoke from JavaScript!! - %@", [self getEventLabel: request]);
    }
}

- (void)sendClickLinks: (NSURLRequest *)request {
    NSLog(@"Here is sendClickLinks. Invoke from JavaScript!! - %@", [self getEventLabel: request]);
}

- (NSMutableString *)getEventLabel: (NSURLRequest *)request {
    NSMutableString *eventLabel = [NSMutableString stringWithString: request.URL.host];
    if (![request.URL.path isEqual:NULL]) {
        [eventLabel appendString: request.URL.path];
    }
    if (![request.URL.query isEqual:NULL]) {
        [eventLabel appendString: request.URL.query];
    }

    return eventLabel;
}

@end

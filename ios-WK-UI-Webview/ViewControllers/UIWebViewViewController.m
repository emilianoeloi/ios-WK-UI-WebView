//
//  UIWebViewViewController.m
//  ios-WK-UI-Webview
//
//  Created by Emiliano Barbosa on 9/15/15.
//  Copyright © 2015 Bocamuchas. All rights reserved.
//

#import "UIWebViewViewController.h"

@interface UIWebViewViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation UIWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://html5test.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webview loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

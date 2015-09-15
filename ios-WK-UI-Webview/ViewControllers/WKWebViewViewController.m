//
//  WKWebViewViewController.m
//  ios-WK-UI-Webview
//
//  Created by Emiliano Barbosa on 9/15/15.
//  Copyright © 2015 Bocamuchas. All rights reserved.
//

#import "WKWebViewViewController.h"

@interface WKWebViewViewController () <WKNavigationDelegate>


@property (strong, nonatomic) IBOutlet WKWebView *wkWebView;

@end

@implementation WKWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    CGRect frameWebView = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+20, self.view.frame.size.width, self.view.frame.size.height-75);
    _wkWebView = [[WKWebView alloc] initWithFrame:frameWebView configuration:theConfiguration];
    _wkWebView.navigationDelegate = self;
    
    NSURL *url = [NSURL URLWithString:@"https://html5test.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_wkWebView loadRequest:request];
    [self.view addSubview:_wkWebView];
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

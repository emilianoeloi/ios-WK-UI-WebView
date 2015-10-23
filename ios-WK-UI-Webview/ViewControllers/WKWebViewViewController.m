//
//  WKWebViewViewController.m
//  ios-WK-UI-Webview
//
//  Created by Emiliano Barbosa on 9/15/15.
//  Copyright © 2015 Bocamuchas. All rights reserved.
//

#import "WKWebViewViewController.h"

@interface WKWebViewViewController () <WKNavigationDelegate, WKUIDelegate>


@property (strong, nonatomic) IBOutlet WKWebView *wkWebView;

@end

@implementation WKWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!NSClassFromString(@"WKWebView")) {
        UILabel *notSupport = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 200, 100)];
        [notSupport setText:@"Não Suportado"];
        [notSupport setTextColor:[UIColor redColor]];
        [self.view addSubview:notSupport];
    }
    
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    CGRect frameWebView = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+20, self.view.frame.size.width, self.view.frame.size.height-75);
    _wkWebView = [[WKWebView alloc] initWithFrame:frameWebView configuration:theConfiguration];
    _wkWebView.navigationDelegate = self;
    _wkWebView.UIDelegate = self;
    
    NSURL *url = [NSURL URLWithString:DEFAULT_URL];
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

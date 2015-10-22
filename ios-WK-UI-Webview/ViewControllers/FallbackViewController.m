//
//  FallbackViewController.m
//  ios-WK-UI-Webview
//
//  Created by Emiliano Barbosa on 10/22/15.
//  Copyright © 2015 Bocamuchas. All rights reserved.
//

#import "FallbackViewController.h"

@interface FallbackViewController()<UIWebViewDelegate, WKNavigationDelegate>

@property (strong, nonatomic) IBOutlet UIWebView<WIWebViewProvider> *webview;

@end

@implementation FallbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (NSClassFromString(@"WKWebView")) {
        WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
        
        CGRect frameWebView = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+20, self.view.frame.size.width, self.view.frame.size.height-75);
        _webview = [[WKWebView alloc] initWithFrame:frameWebView configuration:theConfiguration];
        [_webview setDelegateViews:self];
        [self.view addSubview:_webview];
        NSURL *url = [NSURL URLWithString:DEFAULT_URL];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webview loadRequest:request];
        return;
    }
    
    _webview.delegate = self;
    NSURL *url = [NSURL URLWithString:DEFAULT_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webview loadRequest:request];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

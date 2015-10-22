//
//  WKWebView+WIWebView.m
//  ios-WK-UI-Webview
//
//  Created by Emiliano Barbosa on 10/22/15.
//  Copyright © 2015 Bocamuchas. All rights reserved.
//

#import "WKWebView+WIWebView.h"

@implementation WKWebView (WIWebView)

-(void)setDelegateViews:(id<WKNavigationDelegate, WKUIDelegate>)delegatelView{
    [self setNavigationDelegate:delegatelView];
    [self setUIDelegate:delegatelView];
}

@end

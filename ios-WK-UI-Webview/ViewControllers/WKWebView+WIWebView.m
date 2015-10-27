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

-(BOOL)isFacebookLoginPage{
    return [self.URL.absoluteString rangeOfString:FACEBOOK_LOGIN_PAGE_PATTERN].location != NSNotFound;
}

-(BOOL)isFacebookForwardPage{
    return [self.URL.absoluteString rangeOfString:FACEBOOK_FORWARD_PAGE_PATTERN].location != NSNotFound;
}

-(void)forwardFacebook{
    NSArray *urlParts = [self.URL.absoluteString componentsSeparatedByString:FACEBOOK_FORWARD_STRING_TO_SPLIT];
    NSString *forwardUrl= [[urlParts[1] stringByReplacingOccurrencesOfString:@"+" withString:@" "] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *fURL = [NSURL URLWithString:forwardUrl];
    [self loadRequest:[NSURLRequest requestWithURL:fURL]];
}

@end

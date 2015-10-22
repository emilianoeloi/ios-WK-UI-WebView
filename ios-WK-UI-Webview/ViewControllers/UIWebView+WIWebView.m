//
//  UIWebView+WIWebView.m
//  ios-WK-UI-Webview
//
//  Created by Emiliano Barbosa on 10/22/15.
//  Copyright © 2015 Bocamuchas. All rights reserved.
//

#import "UIWebView+WIWebView.h"

@implementation UIWebView (WIWebView)

-(void)setDelegateViews:(id<UIWebViewDelegate>)delegatelView{
    [self setDelegate:delegatelView];
}


@end

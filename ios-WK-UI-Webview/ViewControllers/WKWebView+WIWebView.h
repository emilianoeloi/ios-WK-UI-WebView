//
//  WKWebView+WIWebView.h
//  ios-WK-UI-Webview
//
//  Created by Emiliano Barbosa on 10/22/15.
//  Copyright © 2015 Bocamuchas. All rights reserved.
//


@interface WKWebView (WIWebView) <WIWebViewProvider>

-(void)setDelegateViews:(id<WKNavigationDelegate, WKUIDelegate>)delegatelView;

@end

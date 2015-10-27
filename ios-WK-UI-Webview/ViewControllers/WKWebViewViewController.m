//
//  WKWebViewViewController.m
//  ios-WK-UI-Webview
//
//  Created by Emiliano Barbosa on 9/15/15.
//  Copyright © 2015 Bocamuchas. All rights reserved.
//

#import "WKWebViewViewController.h"

@interface WKWebViewViewController () <WKNavigationDelegate, WKUIDelegate>


@property (weak, nonatomic) IBOutlet UILabel *webviewText;
@property (strong, nonatomic) WKWebView *wkWebView;

@end

@implementation WKWebViewViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
        self.wkWebView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:theConfiguration];
        self.wkWebView.navigationDelegate = self;
        self.wkWebView.UIDelegate = self;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!NSClassFromString(@"WKWebView")) {
        UILabel *notSupport = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 200, 100)];
        [notSupport setText:@"Não Suportado"];
        [notSupport setTextColor:[UIColor redColor]];
        [self.view addSubview:notSupport];
        return;
    }
    
    [self.view addSubview:_wkWebView];
    [self.wkWebView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self.wkWebView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1 constant:-88];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:self.wkWebView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [self.view addConstraints:@[height, width]];
    
    [_wkWebView addObserver:self forKeyPath:@"loading" options:NSKeyValueObservingOptionNew context:nil];
    [_wkWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [_wkWebView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    
    
    NSURL *url = [NSURL URLWithString:DEFAULT_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_wkWebView loadRequest:request];
    [self.view addSubview:_wkWebView];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"loading"]) {
        NSLog(@"LOADING - URL: %@", _wkWebView.URL.absoluteString );
        NSLog(@"LOADING - IS FACEBOOK LOGIN: %@", [_wkWebView isFacebookLoginPage]?@"YES":@"NO");
    }
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        NSLog(@"ESTIMATED PROGRESS: %.02f", _wkWebView.estimatedProgress);
    }
    if ([keyPath isEqualToString:@"title"]) {
        NSLog(@"TITLE: %@", _wkWebView.title);
        _webviewText.text = _wkWebView.title;
    }
    
}

-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"WEBVIEW FAIL: %@", error.localizedDescription);
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"WEBVIEW FINISH - url: %@", webView.URL.absoluteString);
    NSLog(@"WEBVIEW FINISH - IS FACEBOOK FORWARD: %@", [webView isFacebookForwardPage]?@"YES":@"NO");
    if ([webView isFacebookForwardPage]) {
        [webView forwardFacebook];
    }
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    /// NSLog(@"DECIDE POLICY FOR NAVIGATION ACTION - NAVIGATION TYPE: %d - URL: %@", navigationAction.navigationType, navigationAction.request.URL.absoluteString);
    decisionHandler(WKNavigationActionPolicyAllow);
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    /// NSLog(@"DECIDE POLICY FOR NAVIGATION RESPONSE - URL: %@", navigationResponse.response.URL.absoluteString);
    decisionHandler(WKNavigationResponsePolicyAllow);
}

-(WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    NSLog(@"CREATE WEBVIEW WITH CONFIGURATION - isMainFrame: %@",navigationAction.targetFrame.isMainFrame?@"YES":@"NO");
    if (navigationAction.targetFrame == nil) {
//        [_wkWebView loadRequest:[FacebookHelper newRequestWithUrl:navigationAction.request.URL.absoluteString]];
        [self.wkWebView loadRequest:navigationAction.request];
        
    }
    return nil;
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

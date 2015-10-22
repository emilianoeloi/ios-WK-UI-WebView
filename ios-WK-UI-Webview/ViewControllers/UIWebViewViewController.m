//
//  UIWebViewViewController.m
//  ios-WK-UI-Webview
//
//  Created by Emiliano Barbosa on 9/15/15.
//  Copyright © 2015 Bocamuchas. All rights reserved.
//

#import "UIWebViewViewController.h"

@interface UIWebViewViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@property (nonatomic, assign) BOOL facebookShareOppened;
@property (nonatomic, assign) BOOL facebookBacking;

@end

@implementation UIWebViewViewController

-(BOOL)checkFacebookUrl:(NSString *)url{
    NSError* error = nil;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"(https://m.facebook.com/)(.+)(/dialog/feed)" options:0 error:&error];
    NSArray* matches = [regex matchesInString:url options:0 range:NSMakeRange(0, [url length])];
    
    return [matches count] > 0;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:DEFAULT_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webview loadRequest:request];
    _webview.delegate = self;
    _facebookShareOppened = NO;
    _facebookBacking = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    
    if (_facebookBacking && _facebookShareOppened) {
        if ([self checkFacebookUrl:request.URL.absoluteString]) {
            return YES;
        }else{
            return NO;
            _facebookShareOppened = NO;
        }
    }else if (!_facebookShareOppened && [request.URL.absoluteString rangeOfString:@"https://m.facebook.com/v2.1/dialog/feed?app_id"].location != NSNotFound) {
        _facebookShareOppened = YES;
        NSLog(@"\n\n\n %@ \n\n\n", request.URL.absoluteString);
    }
    
    
    return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    if (_facebookShareOppened &&
        [self checkFacebookUrl:webView.request.URL.absoluteString]) {
        NSLog(@"\n\n\n FACEBOOK CLOSE \n\n\n");
        [_webview goBack];
        _facebookBacking = YES;
    }
    NSLog(@"END");
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

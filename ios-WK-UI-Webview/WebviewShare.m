//
//  WebviewShare.m
//  ios-WK-UI-Webview
//
//  Created by Emiliano Barbosa on 9/28/15.
//  Copyright © 2015 Bocamuchas. All rights reserved.
//

#import "WebviewShare.h"

/// SocialNetwork
typedef NS_ENUM(int, SocialNetwork) {
    SocialNetworkUnknow = -1,
    SocialNetworkWhatsapp = 0,
    SocialNetworkFacebook = 1,
    SocialNetworkGPlus = 2,
    SocialNetworkPinterest = 3,
    SocialNetworkTwitter = 4
};

@interface WebviewShare()
@property (nonatomic, assign) BOOL tabOppened;
@end

@implementation WebviewShare

+(instancetype)sharedShare{
    static WebviewShare *webviewShare = nil;
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        webviewShare = [[self alloc]init];
    });
    return webviewShare;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        _tabOppened = NO;
    }
    return self;
}

-(BOOL)checkFacebookUrl:(NSString *)url{
    NSError* error = nil;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"(https://m.facebook.com/)(.+)(/dialog/feed)" options:0 error:&error];
    NSArray* matches = [regex matchesInString:url options:0 range:NSMakeRange(0, [url length])];
    
    return [matches count] > 0;
    
}

-(SocialNetwork) checkSocialNetworkWithUrl:(NSString *)url{
    if ([url rangeOfString:@"whatsapp://"].location != NSNotFound) {
        return SocialNetworkWhatsapp;
    }else if([url rangeOfString:@"m.facebook.com/v2.1/dialog/feed"].location != NSNotFound){
        return SocialNetworkFacebook;
    }else{
        return SocialNetworkUnknow;
    }
}

-(SocialNetwork)shouldStartLoadWithRequest:(NSURLRequest *)request{
    NSString *url = request.URL.absoluteString;
    SocialNetwork socialNetwork = [self checkSocialNetworkWithUrl:url];
    
    switch (socialNetwork) {
        case SocialNetworkFacebook:
            if (!_tabOppened) {
                _tabOppened = YES;
            }
            break;
        default:
            break;
    }
    
    return socialNetwork;
}

-(void)didFinishLoadWithRequest:(NSURLRequest *)request{
    NSString *url = request.URL.absoluteString;
    SocialNetwork socialNetwork = [self checkSocialNetworkWithUrl:url];
    
    switch (socialNetwork) {
        case SocialNetworkFacebook:
            if (_tabOppened) {
                _tabOppened = YES;
            }
            break;
        default:
            break;
    }
    
}

@end

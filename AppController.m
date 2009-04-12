//
//  AppController.m
//  CacheDemo
//
//  Created by Adam Thorsen on 4/11/09.
//  Copyright 2009 Owyhee Software, LLC. All rights reserved.
//

#import "AppController.h"
#import <WebKit/WebKit.h>


@implementation AppController

-(id)init
{
    self = [super init];
    if(nil != self)
    {
        [[NSURLCache sharedURLCache] setMemoryCapacity:0];
        [[NSURLCache sharedURLCache] setDiskCapacity:0];
    }
    return self;
}

-(void) awakeFromNib
{
    //here we set the cache model for the web view to not keep the cache in memory
    WebPreferences *prefs = [_webView preferences];
    [prefs setCacheModel:WebCacheModelDocumentViewer];
    [prefs setUsesPageCache:NO];
    [_webView setResourceLoadDelegate:self];
}

- (void)webView:(WebView *)sender resource:(id)identifier didReceiveResponse:(NSURLResponse *)response fromDataSource:(WebDataSource *)dataSource
{
    NSLog(@"response for path:%@\n%@", [[response URL] path], [response allHeaderFields]);
}

-(NSURLRequest *)webView:(WebView *)sender 
                 resource:(id)identifier 
                 willSendRequest:(NSURLRequest *)aRequest 
                 redirectResponse:(NSURLResponse *)redirectResponse 
                 fromDataSource:(WebDataSource *)dataSource
{
        NSURL * url = [aRequest URL];
        NSURLRequest * cachelessRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:100];
        return cachelessRequest;
}

-(void) refresh:(id)sender
{
    [self loadCurrentURL];
}

-(void) loadCurrentURL
{
    //Here we clear the shared url cache for good measure
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [[_webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[_urlBar stringValue]]]];
}

@end

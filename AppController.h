//
//  AppController.h
//  CacheDemo
//
//  Created by Adam Thorsen on 4/11/09.
//  Copyright 2009 Owyhee Software, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebView.h>

@interface AppController : NSObject {
    IBOutlet WebView * _webView;
    IBOutlet NSTextField * _urlBar;
}

@end

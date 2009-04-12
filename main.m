//
//  main.m
//  CacheDemo
//
//  Created by Adam Thorsen on 4/11/09.
//  Copyright Owyhee Software, LLC 2009. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"WebKitDeveloperExtras"];
    [defaults synchronize];
    [pool release];

    return NSApplicationMain(argc,  (const char **) argv);
}

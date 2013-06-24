//
//  HelloAppDelegate.m
//  HelloGL
//
//  Created by Hamdan Javeed on 2013-06-23.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "HelloAppDelegate.h"
#import "HelloGLView.h"

@interface HelloAppDelegate()

@end

@implementation HelloAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // create a GLKView
    HelloGLView *view = [[HelloGLView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // add the view to the window
    [self.window addSubview:view];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end

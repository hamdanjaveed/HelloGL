//
//  HelloAppDelegate.m
//  HelloGL
//
//  Created by Hamdan Javeed on 2013-06-23.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "HelloAppDelegate.h"

@interface HelloAppDelegate() <GLKViewDelegate>

@end

@implementation HelloAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // create an EAGLContext, contains all the info needed for iOS to draw using OpenGL
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    // create a GLKView
    GLKView *view = [[GLKView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // set the view to opaque to increase performance
    [view setOpaque:YES];
    // set the view's context and delegate
    [view setContext:context];
    [view setDelegate:self];
    // add the view to the window
    [self.window addSubview:view];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClearColor(0.898, 0.435, 0.239, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
}

@end

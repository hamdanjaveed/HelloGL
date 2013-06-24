//
//  HelloGLView.m
//  HelloGL
//
//  Created by Hamdan Javeed on 2013-06-23.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "HelloGLView.h"

@interface HelloGLView() <GLKViewDelegate> {
    EAGLContext *context;
}

@end

@implementation HelloGLView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // create an EAGLContext, contains all the info needed for iOS to draw using OpenGL
        context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
        // set the view to opaque to increase performance
        [self setOpaque:YES];
        // set the view's context and delegate
        [self setContext:context];
        [self setDelegate:self];
    }
    return self;
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClearColor(0.8, 0.4, 0.2, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
}

@end

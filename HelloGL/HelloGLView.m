//
//  HelloGLView.m
//  HelloGL
//
//  Created by Hamdan Javeed on 2013-06-23.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "HelloGLView.h"
#import <QuartzCore/QuartzCore.h>

@interface HelloGLView() <GLKViewDelegate> {
    EAGLContext *context;
}

@property (nonatomic) float currentRed;
@property (nonatomic, getter = isIncreasingRed) BOOL increasingRed;
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
        
        self.enableSetNeedsDisplay = NO;
        CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(render:)];
        [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return self;
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    if (self.isIncreasingRed) {
        self.currentRed += 0.01;
    } else {
        self.currentRed -= 0.01;
    }
    
    if (self.currentRed >= 1.0) {
        self.currentRed = 1.0;
        self.increasingRed = NO;
    }
    if (self.currentRed <= 0.0) {
        self.currentRed = 0.0;
        self.increasingRed = YES;
    }
    
    glClearColor(self.currentRed, 0.0, 0.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
}

- (void)render:(CADisplayLink *)displayLink {
    [self display];
}

@end

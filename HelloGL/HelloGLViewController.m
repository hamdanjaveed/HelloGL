//
//  HelloGLViewController.m
//  HelloGL
//
//  Created by Hamdan Javeed on 2013-06-23.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "HelloGLViewController.h"

@interface HelloGLViewController()
@property (strong, nonatomic) EAGLContext *context;

@property (nonatomic) float currentRed;
@property (nonatomic, getter = isIncreasingRed) BOOL increasingRed;
@end

@implementation HelloGLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    if (!self.context) {
        NSLog(@"Context was not created");
    }
    
    GLKView *view = (GLKView *)self.view;
    [view setContext:self.context];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClearColor(self.currentRed, 0.0, 0.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
}

- (void)update {
    if (self.isIncreasingRed) {
        self.currentRed += 1.0 * self.timeSinceLastUpdate;
    } else {
        self.currentRed -= 1.0 * self.timeSinceLastUpdate;
    }
    
    if (self.currentRed >= 1.0) {
        self.currentRed = 1.0;
        self.increasingRed = NO;
    }
    if (self.currentRed <= 0.0) {
        self.currentRed = 0.0;
        self.increasingRed = YES;
    }
}

@end

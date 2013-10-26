//
//  Camera.h
//  CameraStarter
//
//  Created by dasmer on 10/26/13.
//  Copyright (c) 2013 Columbia University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Camera : NSObject

- (id) initWithPreviewView: (UIView *) previewView;
- (void) startRunning;
- (void)stopRunning;

@end

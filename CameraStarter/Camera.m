//
//  Camera.m
//  CameraStarter
//
//  Created by dasmer on 10/26/13.
//  Copyright (c) 2013 Columbia University. All rights reserved.
//

#import "Camera.h"
@import AVFoundation;

@implementation Camera{
    AVCaptureSession *_captureSession;
    AVCaptureDevice *_videoDevice;
    AVCaptureDeviceInput *_videoInput;
    AVCaptureVideoPreviewLayer *_previewLayer;
    BOOL _running;
}


- (void)setupCaptureSession { // 1
    if (_captureSession) return;
    // 2
    _videoDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (!_videoDevice) {
        NSLog(@"No video camera on this device!"); return;
    }
    // 3
    _captureSession = [[AVCaptureSession alloc] init];
    // 4
    _videoInput = [[AVCaptureDeviceInput alloc] initWithDevice:_videoDevice error:nil];
    // 5
    if ([_captureSession canAddInput:_videoInput]) { [_captureSession addInput:_videoInput];
    }
    // 6
    _previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
}
- (id) initWithPreviewView: (UIView *) previewView{
    self = [super init];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        [self setupCaptureSession];
        
        
        _previewLayer.frame = previewView.bounds;
        [previewView.layer addSublayer:_previewLayer];
        
        
        
    }
    return self;
}





- (void)applicationWillEnterForeground:(NSNotification*)note {
    [self startRunning];
}
- (void)applicationDidEnterBackground:(NSNotification*)note {
    [self stopRunning];
}

- (void)startRunning {
    if (_running) return;
    [_captureSession startRunning];
    _running = YES;
    NSLog(@"start running called");
}


- (void)stopRunning {
    if (!_running) return;
    [_captureSession stopRunning];
    _running = NO;
}








@end

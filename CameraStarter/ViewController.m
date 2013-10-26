//
//  ViewController.m
//  CameraStarter
//
//  Created by dasmer on 10/26/13.
//  Copyright (c) 2013 Columbia University. All rights reserved.
//

#import "ViewController.h"
#import "Camera.h"

@interface ViewController ()
@property (strong,nonatomic) Camera *camera;
@end

@implementation ViewController{
    __weak IBOutlet UIView *_previewView;
}


- (void) awakeFromNib {
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.camera = [[Camera alloc] initWithPreviewView:_previewView];
    
    
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.camera startRunning];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.camera stopRunning];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end

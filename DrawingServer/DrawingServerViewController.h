//
//  DrawingServerViewController.h
//  DrawingServer
//
//  Created by BuG.BS on 12-8-4.
//  Copyright (c) 2012年 BuG.BS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawingServerAppDelegate.h"
#import "GestureView.h"
@interface DrawingServerViewController : UIViewController <GestureViewDelegate>
@property (weak, nonatomic) IBOutlet GestureView *gestureView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

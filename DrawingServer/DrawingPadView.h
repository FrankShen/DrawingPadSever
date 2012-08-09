//
//  DrawingPadView.h
//  DrawingServer
//
//  Created by BuG.BS on 12-8-8.
//  Copyright (c) 2012年 BuG.BS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface DrawingPadView : UIView
@property (nonatomic,strong) UIImage *curImage;
@property (nonatomic,strong) UIImage *newImage;
- (void)refreshImageWithNewImage:(UIImage *) newImage;
@end

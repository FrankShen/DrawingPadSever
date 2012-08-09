//
//  DrawingPadView.m
//  DrawingServer
//
//  Created by BuG.BS on 12-8-8.
//  Copyright (c) 2012年 BuG.BS. All rights reserved.
//

#import "DrawingPadView.h"

@implementation DrawingPadView
@synthesize curImage = _curImage;
@synthesize newImage = _newImage;
- (UIImage *)curImage
{
    if (!_curImage)
        _curImage = [[UIImage alloc] init];
    return _curImage;
}

-(UIImage *)newImage
{
    if(!_newImage)
        _newImage = [[UIImage alloc] init];
    return _newImage;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)refreshImageWithNewImage:(UIImage *) newImage
{
    self.newImage = newImage;
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    self.curImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self.curImage drawAtPoint:CGPointMake(0, 0)];
    [self.newImage drawAtPoint:CGPointMake(0, 0)];
    NSLog(@"refreshed");
}


@end

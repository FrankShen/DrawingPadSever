//
//  GestureView.h
//  DrawingServer
//
//  Created by BuG.BS on 12-8-4.
//  Copyright (c) 2012年 BuG.BS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GestureViewDelegate <NSObject>

- (void)doSegue:(NSString *)name;

@end

@interface GestureView : UIView
- (void)swipe:(UISwipeGestureRecognizer *)gesture;
@property (weak, nonatomic) id<GestureViewDelegate> delegate;
@end

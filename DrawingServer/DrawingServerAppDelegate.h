//
//  DrawingServerAppDelegate.h
//  DrawingServer
//
//  Created by BuG.BS on 12-8-4.
//  Copyright (c) 2012年 BuG.BS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCDAsyncSocket.h"

#define CONFIRM_CONNECTION_TAG 1000
#define START_TRANSPORT 1001
#define TRANSPORT_CONPLETE 1002
#define PULL_IMAGES 9999
#define DATA_LENTH 1004

@interface DrawingServerAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) GCDAsyncSocket *socket;

@property (strong, nonatomic) NSMutableArray *clientSocket;

@property (strong, nonatomic) NSMutableArray *imagePool;

@property (strong, nonatomic) NSMutableArray *dataLenth;

@end

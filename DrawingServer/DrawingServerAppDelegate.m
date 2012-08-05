//
//  DrawingServerAppDelegate.m
//  DrawingServer
//
//  Created by BuG.BS on 12-8-4.
//  Copyright (c) 2012年 BuG.BS. All rights reserved.
//

#import "DrawingServerAppDelegate.h"

@implementation DrawingServerAppDelegate

@synthesize socket = _socket;
@synthesize clientSocket = _clientSocket;
@synthesize imagePool = _imagePool;
@synthesize dataLenth = _dataLenth;
- (NSMutableArray *)clientSocket
{
    if (!_clientSocket)
        _clientSocket = [[NSMutableArray alloc] init];
    return _clientSocket;
}

- (NSMutableArray *)imagePool
{
    if (!_imagePool)
        _imagePool = [[NSMutableArray alloc] init];
    return _imagePool;
}

- (NSMutableArray *)dataLenth
{
    if (!_dataLenth)
        _dataLenth = [[NSMutableArray alloc] init];
    return _dataLenth;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

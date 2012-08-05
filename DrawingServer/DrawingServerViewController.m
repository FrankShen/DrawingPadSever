//
//  DrawingServerViewController.m
//  DrawingServer
//
//  Created by BuG.BS on 12-8-4.
//  Copyright (c) 2012年 BuG.BS. All rights reserved.
//

#import "DrawingServerViewController.h"

@interface DrawingServerViewController ()<GCDAsyncSocketDelegate>

@end

@implementation DrawingServerViewController
@synthesize gestureView;
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    DrawingServerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    self.gestureView.backgroundColor = [UIColor clearColor];
    self.gestureView.delegate = self;
    UISwipeGestureRecognizer *ges = [[UISwipeGestureRecognizer alloc] initWithTarget:self.gestureView action:@selector(swipe:)];
    ges.numberOfTouchesRequired = 2;
    ges.direction = UISwipeGestureRecognizerDirectionUp;
    [self.gestureView addGestureRecognizer:ges];
    
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidUnload
{
    [self setGestureView:nil];
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationLandscapeLeft;
}

- (void)doSegue:(NSString *)name
{
    [self performSegueWithIdentifier:name sender:self];
}

- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket
{
    NSLog(@"%@", [NSString stringWithFormat:@"Connected %@", newSocket.connectedHost]);
    DrawingServerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    [appDelegate.clientSocket addObject:newSocket];
    [appDelegate.dataLenth addObject:@0];
    NSMutableData *newData = [[NSMutableData alloc] init];
    [appDelegate.imagePool addObject:newData];
    
    ((GCDAsyncSocket *)[appDelegate.clientSocket lastObject]).delegate = self;
    [(GCDAsyncSocket *)[appDelegate.clientSocket lastObject] writeData:[[NSString stringWithFormat:@"%d",appDelegate.clientSocket.count-1] dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:CONFIRM_CONNECTION_TAG];
    [(GCDAsyncSocket *)[appDelegate.clientSocket lastObject] readDataWithTimeout:-1 tag:START_TRANSPORT];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    DrawingServerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if (tag == START_TRANSPORT){
        NSString *recieve = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSRange commaPos = [recieve rangeOfString:@","];
        int socketIdx = [[recieve substringToIndex:commaPos.location] intValue];
        NSLog(@"%@",[recieve substringFromIndex:commaPos.location+1]);
        [appDelegate.dataLenth replaceObjectAtIndex:socketIdx withObject:[NSNumber numberWithInt:[[recieve substringFromIndex:commaPos.location+1] intValue]]];
        [(NSMutableData *)[appDelegate.imagePool objectAtIndex:socketIdx] init];
        [(GCDAsyncSocket *)[appDelegate.clientSocket objectAtIndex:socketIdx] readDataWithTimeout:-1 tag:socketIdx];
    } else if (tag == TRANSPORT_CONPLETE){
        NSString *recieve = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        int socketIdx = [recieve intValue];
        //.....
        UIImage *image = [[UIImage alloc] initWithData:(NSData *)[appDelegate.imagePool objectAtIndex:socketIdx]];
        self.imageView.image = image;
        
        [(GCDAsyncSocket *)[appDelegate.clientSocket objectAtIndex:socketIdx] readDataWithTimeout:-1 tag:START_TRANSPORT];
    } else {
        [(NSMutableData *)[appDelegate.imagePool objectAtIndex:tag] appendData:data];
        
        NSLog(@"%d", ((NSMutableData *)[appDelegate.imagePool objectAtIndex:tag]).length);
        
        if (((NSMutableData *)[appDelegate.imagePool objectAtIndex:tag]).length != [(NSNumber *)[appDelegate.dataLenth objectAtIndex:tag] intValue])
            [(GCDAsyncSocket *)[appDelegate.clientSocket objectAtIndex:tag] readDataWithTimeout:-1 tag:tag];
        else{
            [(GCDAsyncSocket *)[appDelegate.clientSocket objectAtIndex:tag] writeData:[@"OK" dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:TRANSPORT_CONPLETE];
            [(GCDAsyncSocket *)[appDelegate.clientSocket objectAtIndex:tag] readDataWithTimeout:-1 tag:TRANSPORT_CONPLETE];
        }
    }
}

@end

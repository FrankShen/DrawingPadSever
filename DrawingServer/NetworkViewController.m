//
//  NetworkViewController.m
//  DrawingServer
//
//  Created by BuG.BS on 12-8-4.
//  Copyright (c) 2012年 BuG.BS. All rights reserved.
//

#import "NetworkViewController.h"
@interface NetworkViewController ()

@end

@implementation NetworkViewController
@synthesize postAddress;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setPostAddress:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationLandscapeLeft;
}

- (IBAction)openPortPressed:(id)sender
{
    NSError *err;
    DrawingServerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if (![appDelegate.socket acceptOnPort:[self.postAddress.text intValue] error:&err]){
        NSLog(@"%@",err.description);
    } else {
        NSLog(@"Start listening");
    }
}
@end

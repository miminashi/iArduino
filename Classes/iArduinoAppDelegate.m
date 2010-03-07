//
//  iArduinoAppDelegate.m
//  iArduino
//
//  Created by みみなし on 10/01/22.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "iArduinoAppDelegate.h"
#import "MainViewController.h"

@implementation iArduinoAppDelegate


@synthesize window;
@synthesize mainViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end

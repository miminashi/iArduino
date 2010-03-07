//
//  FlipsideViewController.m
//  iArduino
//
//  Created by みみなし on 10/01/22.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MainViewController.h"

@implementation FlipsideViewController

MainViewController *mainViewController;
@synthesize delegate;
@synthesize ipAddressUITextField;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
	//iarduinoAppDelegate = [[iArduinoAppDelegate alloc] init];
}


- (IBAction)done {
	mainViewController.ipAddressUITextField = ipAddressUITextField;
	[self.delegate flipsideViewControllerDidFinish:self];	
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}

- (IBAction)testButtonDidTouchDown
{
	[testButton setTitle:@"Testing..." forState:UIControlStateHighlighted];
	[testButton setTitle:@"Testing..." forState:UIControlStateNormal];
	
	NSString *ipAddress;
	ipAddress = [ipAddressUITextField text];
	NSLog(@"testButtonDidTouchDown %@", ipAddress);
	sockObj = [[SocketObject alloc] init];
	[sockObj openSocket:ipAddress port:10050];
	[sockObj sendString:@"0 0"];
	[sockObj closeSocket];
	[sockObj release];
	NSLog(@"testButtonDidTouchDown OK");
	
	[testButton setTitle:@"OK" forState:UIControlStateHighlighted];
	[testButton setTitle:@"OK" forState:UIControlStateNormal];
}

- (IBAction)hideKeyboard:(id)sender
{
	[ipAddressUITextField resignFirstResponder];
}


@end

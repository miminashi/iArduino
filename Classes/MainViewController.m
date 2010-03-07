//
//  MainViewController.m
//  iArduino
//
//  Created by みみなし on 10/01/22.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"


@implementation MainViewController

//@synthesize sockObj;
@synthesize ipAddressUITextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		NSLog(@"initWithNibName");
    }
    return self;
}

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	NSLog(@"viewDidLoad");
	sockObj = [[SocketObject alloc] init];
}


// Viewが表示されたときに実行されるらしい
- (void)viewDidAppear:(BOOL)animated {
	//FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	
	leftParam = 0;
	rightParam = 0;
	
	NSString *ipAddress;
	//ipAddress = [controller.ipAddressUITextField text];
	ipAddress = @"192.168.1.2";
	
	NSLog(@"viewDidAppear");
	
	[connectingActivityIndicator startAnimating];
	
	NSLog(@"IP Address: %@", ipAddress);
	
	if (ipAddress != NULL) {
		[sockObj openSocket:ipAddress port:10050];
		[sockObj sendString:@"0 0"];
		[connectionIndicator setImage:[UIImage imageNamed:@"connected.png"]];
		[connectingActivityIndicator stopAnimating];
		[leftForwardButton setEnabled:TRUE];
		[leftBackButton setEnabled:TRUE];
		[rightForwardButton setEnabled:TRUE];
		[rightBackButton setEnabled:TRUE];
	}
	
	//tcpQueue = [[NSOperationQueue alloc] init];
	//tcpOperation = [[TCPOperation alloc] init];
	//NSLog(@"tcpOperation.leftParam = %d", tcpOperation.leftParam);
	//[tcpQueue addOperation:tcpOperation];
	//[tcpOperation release];
}


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    NSLog(@"flipsideViewControllerDidFinish");
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {
	NSLog(@"showInfo");
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
	
	[leftForwardButton setEnabled:FALSE];
	[leftBackButton setEnabled:FALSE];
	[rightForwardButton setEnabled:FALSE];
	[rightBackButton setEnabled:FALSE];
	
	[connectingActivityIndicator startAnimating];
	[connectionIndicator setImage:[UIImage imageNamed:@"disconnected"]];
	
	[sockObj closeSocket];
	//[sockObj release];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// 画面方向をLandscapeLeftに固定する
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}


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
	//[tcpOperation release];
	[ipAddressUITextField release];
    [super dealloc];
}

- (void)sendValue
{
	NSString *stringValue = [[NSString stringWithFormat:@"%d", leftParam] stringByAppendingString:[NSString stringWithFormat:@" %d", rightParam]];
	NSLog(@"%@", stringValue);
	[sockObj sendString:stringValue];	
}

/////////////// 左前進ボタン //////////////

// 左前進ボタンが押されたとき
- (IBAction)leftForwardButtonPushed {
	NSLog(@"左前進ボタンが押されました");
	leftParam = 255;
	[self sendValue];
}

// 左前進ボタンが離されたとき
- (IBAction)leftForwardButtonReleased {
	NSLog(@"左前進ボタンが離されました");
	leftParam = 0;
	[self sendValue];
}

////////////////////////////////////////


/////////////// 左後退ボタン //////////////

// 左後退ボタンが押されたとき
- (IBAction)leftBackButtonPushed {
	NSLog(@"左後退ボタンが押されました");
	leftParam = -255;
	[self sendValue];
}

// 左後退ボタンが離されたとき
- (IBAction)leftBackButtonReleased {
	NSLog(@"左後退ボタンが離されました");
	leftParam = 0;
	[self sendValue];
}

////////////////////////////////////////


/////////////// 右前進ボタン //////////////

// 右前進ボタンが押されたとき
- (IBAction)rightForwardButtonPushed {
	NSLog(@"右前進ボタンが押されました");
	rightParam = 255;
	[self sendValue];
}

// 右前進ボタンが離されたとき
- (IBAction)rightForwardButtonReleased {
	NSLog(@"右前進ボタンが離されました");
	rightParam = 0;
	[self sendValue];
}

////////////////////////////////////////


/////////////// 右前進ボタン //////////////

// 右後退ボタンが押されたとき
- (IBAction)rightBackButtonPushed {
	NSLog(@"右後退ボタンが押されました");
	rightParam = -255;
	[self sendValue];
}

// 右後退ボタンが離されたとき
- (IBAction)rightBackButtonReleased {
	NSLog(@"右後退ボタンが離されました");
	rightParam = 0;
	[self sendValue];
}

////////////////////////////////////////


@end

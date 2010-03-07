//
//  FlipsideViewController.h
//  iArduino
//
//  Created by みみなし on 10/01/22.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#include "SocketObject.h"

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
	
	IBOutlet UITextField *ipAddressUITextField;
	IBOutlet UIButton *testButton;
	//iArduinoAppDelegate *iarduinoAppDelegate;
	SocketObject *sockObj;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
@property (nonatomic, retain) UITextField *ipAddressUITextField;
- (IBAction)done;
- (IBAction)testButtonDidTouchDown;
- (IBAction)hideKeyboard:(id)sender;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end


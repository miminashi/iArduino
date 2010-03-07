//
//  MainViewController.h
//  iArduino
//
//  Created by みみなし on 10/01/22.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "FlipsideViewController.h"
#import "SocketObject.h"
//#import "TCPOperation.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	//NSOperationQueue *tcpQueue;
	//TCPOperation *tcpOperation;
	SocketObject *sockObj;
	NSInteger leftParam;
	NSInteger rightParam;
	
	IBOutlet UIImageView *connectionIndicator;
	IBOutlet UIActivityIndicatorView *connectingActivityIndicator;
	
	IBOutlet UITextView *ipAddressUITextField;
	
	IBOutlet UIButton *leftForwardButton;
	IBOutlet UIButton *leftBackButton;
	IBOutlet UIButton *rightForwardButton;
	IBOutlet UIButton *rightBackButton;
}

//@property (readonly, retain) SocketObject *sockObj;
@property  (nonatomic, retain) UITextView *ipAddressUITextField;

// 設定画面の表示
- (IBAction)showInfo;

// あ
- (void)sendValue;

// 左前進ボタン
- (IBAction)leftForwardButtonPushed;
- (IBAction)leftForwardButtonReleased;

// 左後退ボタン
- (IBAction)leftBackButtonPushed;
- (IBAction)leftBackButtonReleased;

// 右前進ボタン
- (IBAction)rightForwardButtonPushed;
- (IBAction)rightForwardButtonReleased;

// 右後退ボタン
- (IBAction)rightBackButtonPushed;
- (IBAction)rightBackButtonReleased;

@end

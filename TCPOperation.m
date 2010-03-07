//
//  TCPOperation.m
//  iArduino
//
//  Created by みみなし on 10/01/28.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TCPOperation.h"


@implementation TCPOperation

@synthesize leftParam;
@synthesize rightParam;

- (void)main
{
	self.leftParam = 0;
	self.rightParam = 0;

	for(;;)
	{
		NSLog(@"leftParam = %d", self.leftParam);
		NSLog(@"rightParam = %d", self.rightParam);
		[NSThread sleepUntilDate:[[NSDate date] addTimeInterval:0.5]];
	}
}

- (void)hogehoge
{
	NSLog(@"hogehoge");
}

- (void)dealloc
{
	[super dealloc];
}

@end

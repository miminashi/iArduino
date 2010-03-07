//
//  SocketObject.m
//  iArduino
//
//  Created by みみなし on 10/02/15.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "SocketObject.h"

@implementation SocketObject

- (id)init
{
	NSObject *superId;
	superId = [super init];
	isOpen = NO;
	return superId;
}

- (void)openSocket:(NSString *)ipAddress port:(NSInteger)portNo
{
	if (isOpen == NO) {
		NSHost *host = [NSHost hostWithAddress:ipAddress];
		NSLog(@"NSHost OK");
		[NSStream getStreamsToHost:host port:portNo inputStream:&inputStream outputStream:&outputStream];
		NSLog(@"getStreamsToHost OK");
		[inputStream retain];
		[outputStream retain];
		[inputStream open];
		[outputStream open];
		
		isOpen = YES;		
	}
}

- (void)closeSocket
{
	if (isOpen == YES) {
		[inputStream close];
		[outputStream close];
		[inputStream release];
		[outputStream release];
		isOpen = NO;		
	}
}

- (void)sendString:(NSString *)string
{
	if (isOpen == YES) {
		NSString *eol = [NSString stringWithFormat:@"\r\n"];
		NSString *str = [string stringByAppendingString:eol];
		const uint8_t *rawstring = (const uint8_t *)[str UTF8String];
		[outputStream write:rawstring maxLength:strlen((char *)rawstring)];
		NSLog(@"outputStream OK");
	}
}

@end

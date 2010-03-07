//
//  SocketObject.h
//  iArduino
//
//  Created by みみなし on 10/02/15.
//  Copyright 2010 Apple Inc. All rights reserved.
//

@interface SocketObject : NSObject {
	NSInputStream *inputStream;
	NSOutputStream *outputStream;
	BOOL isOpen;
}

- (void)openSocket:(NSString *)ipAddress port:(NSInteger)portNo;
- (void)sendString:(NSString *)string;

@end

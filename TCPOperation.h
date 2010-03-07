//
//  TCPOperation.h
//  iArduino
//
//  Created by みみなし on 10/01/28.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCPOperation : NSOperation {
	NSInteger leftParam;
	NSInteger rightParam;
}

@property NSInteger leftParam;
@property NSInteger rightParam;

@end

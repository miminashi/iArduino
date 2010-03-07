//
//  iArduinoAppDelegate.h
//  iArduino
//
//  Created by みみなし on 10/01/22.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

@class MainViewController;

@interface iArduinoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end


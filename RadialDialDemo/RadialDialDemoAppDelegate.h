//
//  RadialDialDemoAppDelegate.h
//  RadialDialDemo
//
//  Created by Eytan Moudahi on 11-09-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RadialDialDemoViewController;

@interface RadialDialDemoAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet RadialDialDemoViewController *viewController;

@end

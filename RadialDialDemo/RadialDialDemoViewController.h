//
//  RadialDialDemoViewController.h
//  RadialDialDemo
//
//  Created by Eytan Moudahi on 11-09-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RadialDial;
@interface RadialDialDemoViewController : UIViewController {
    RadialDial *radialDial;
    BOOL isMovingDial;
}

@property (nonatomic, retain) IBOutlet RadialDial *radialDial;

-(IBAction)rotationValue:(id)sender;
@end

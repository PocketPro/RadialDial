//
//  RadialDialDemoViewController.m
//  RadialDialDemo
//
//  Created by Eytan Moudahi on 11-09-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RadialDialDemoViewController.h"
#import "RadialDial.h"

@implementation RadialDialDemoViewController
@synthesize radialDial;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [radialDial setFillColor:[UIColor colorWithRed:1.0 
                                             green:0.2 
                                              blue:0.0 
                                             alpha:1]];
    
    [radialDial setImage:[UIImage imageNamed:@"0eetI.jpg"]];
}

- (void)viewDidUnload
{
    [self setRadialDial:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)rotationValue:(id)sender
{
    CGFloat rotationInDegrees = ((UISlider*)sender).value;
    CGFloat radius = 100;
    CGPoint pageCenter = self.view.center;
    radialDial.center = CGPointMake(pageCenter.x + radius*cos(rotationInDegrees*M_PI/180), 
                                    pageCenter.y + radius*sin(rotationInDegrees*M_PI/180));
    [radialDial setRotation:((UISlider*)sender).value];
}

- (BOOL)shouldSnapToEndWhenAtAngle:(CGFloat)angle
{
    if (-135 <= angle && angle <= -90) 
    {
        return YES;
    }
    else if (-90 <= angle && angle <= -45)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (CGFloat)snapToEndWhenAtAngle:(CGFloat)angle
{
    if (-135 <= angle && angle <= -90) 
    {
        return -135;
    }
    else if (-90 <= angle && angle <= -45)
    {
        return -45;
    }
    else
    {
        return angle;
    }    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Check if the touch began in proximity to the dial
    UITouch *touch = [touches anyObject];
    if (touch.view == self.radialDial)
    {
        isMovingDial = TRUE;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    // Calculate the new angle based on position. Set the new position.
    if (isMovingDial) {        
        
        // Get reference values
        CGPoint touchLocation = [touch locationInView:self.view];
        CGPoint pageCenter = self.view.center;
        CGFloat dy = touchLocation.y - pageCenter.y;
        CGFloat dx = touchLocation.x - pageCenter.x;
        CGFloat radius = 100;        
        
        // Calculate the rotation value
        CGFloat rotationInDegrees = atan2(dy, dx)*180/M_PI;

        // Snap to guides or display normally
        if ([self shouldSnapToEndWhenAtAngle:rotationInDegrees]) {
            CGFloat newRotation = [self snapToEndWhenAtAngle:rotationInDegrees];
            radialDial.center = CGPointMake(pageCenter.x + radius*cos(newRotation*M_PI/180), 
                                            pageCenter.y + radius*sin(newRotation*M_PI/180));
            [radialDial setRotation:newRotation];
        }
        else {
            radialDial.center = CGPointMake(pageCenter.x + radius*cos(rotationInDegrees*M_PI/180), 
                                            pageCenter.y + radius*sin(rotationInDegrees*M_PI/180));
            [radialDial setRotation:rotationInDegrees];            
        }

    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touch.view == self.radialDial)
    {
        isMovingDial = FALSE;
    }    
}

- (void)dealloc {
    [radialDial release];
    [super dealloc];
}
@end

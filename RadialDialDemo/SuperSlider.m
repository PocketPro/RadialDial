//
//  SuperSlider.m
//  RadialDialDemo
//
//  Created by Eytan Moudahi on 11-09-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SuperSlider.h"

@implementation SuperSlider

@synthesize startIndex, currentIndex, endIndex;
@synthesize thumbView, backgroundView;
@synthesize flipThumbVertical, flipThumbHorizontal, thumbOffset;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [thumbView release];
    [backgroundView release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)loadView
{
    self.view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];
    self.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end





@implementation LineSlider

@synthesize startPoint, endPoint;

- (CGPoint) pointForIndex:(CGFloat)index
{
    // If startIndex, endIndex, startPoint, or EndPoint are not defined, this function
    // should raise an exception.
    
    // Ensure the index is within the bounds
    if (index <  self.startIndex)
        index = self.startIndex;
    else if (index > self.endIndex)
        index = self.endIndex;
    
    CGFloat stepRatio = (index - self.startIndex)/(self.endIndex - self.startIndex);
    CGFloat x = startPoint.x + (endPoint.x - startPoint.x) * stepRatio;
    CGFloat y = startPoint.y + (endPoint.y - startPoint.y) * stepRatio;
    
    return CGPointMake(x, y);
}

@end






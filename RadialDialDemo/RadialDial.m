//
//  RadialDial.m
//  RadialDialDemo
//
//  Created by Eytan Moudahi on 11-09-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RadialDial.h"

static inline double radians (double degrees) {return degrees * M_PI/180;}

@interface RadialDial()
- (void)drawUsingFillColorInRect:(CGRect)rect;
- (void)drawUsingImageInRect:(CGRect)rect;
@end

@implementation RadialDial

#pragma mark - Init/Dealloc

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //fillColor = [[UIColor blackColor] CGColor];
        //rotation = 0;
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - Drawing Methods

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    if (image)
    {
        [self drawUsingImageInRect:rect];
    }
    else
    {
        [self drawUsingFillColorInRect:rect];
    }
}

- (void)drawUsingFillColorInRect:(CGRect)rect
{
    CGContextRef c = UIGraphicsGetCurrentContext();
    self.backgroundColor = [UIColor clearColor];
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    CGContextAddLineToPoint(c, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    CGContextAddLineToPoint(c, CGRectGetMinX(rect), CGRectGetMidY(rect));
    CGContextAddLineToPoint(c, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    CGContextClosePath(c);
    CGContextSetFillColorWithColor(c, fillColor);
    CGContextFillPath(c);    
}

- (void)drawUsingImageInRect:(CGRect)rect
{
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextDrawImage(c, rect, image);
}

#pragma mark - Setter Methods
- (void)setImage:(UIImage*)newImage
{
    image = [newImage CGImage];
    [self setNeedsDisplay];
}

- (void)setRotation:(float)rotationInDegrees
{
    self.transform = CGAffineTransformMakeRotation(rotationInDegrees*M_PI/180);
}

- (void)setFillColor:(UIColor*)aNewFillColor
{
    fillColor = [aNewFillColor CGColor];
    [self setNeedsDisplay];
}

@end

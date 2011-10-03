//
//  RadialDial.h
//  RadialDialDemo
//
//  Created by Eytan Moudahi on 11-09-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadialDial : UIView
{
    CGColorRef fillColor;
    float rotation;
    CGImageRef image;
}

- (void)setRotation:(float)rotationInDegrees;
- (void)setFillColor:(UIColor*)aNewFillColor;
- (void)setImage:(UIImage*)newImage;

@end

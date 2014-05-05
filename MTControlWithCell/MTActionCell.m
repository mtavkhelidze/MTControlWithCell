//
//  MTActionCell.m
//  MTCellControl
//
//  Created by Misha Tavkhelidze on 04/05/2014.
//  Copyright (c) 2014 misha.tavkhelidze@gmail.com. All rights reserved.
//

#import "MTActionCell.h"
#import "MTCommon.h"

@implementation MTActionCell

- (NSSize)cellSize
{
    enter();
    NSSize s = self.controlView.bounds.size;
    return s;
}

- (NSUInteger)hitTestForEvent:(NSEvent *)event inRect:(NSRect)cellFrame ofView:(NSView *)controlView
{
    enter();
    return NSCellHitContentArea | NSCellHitTrackableArea;
}

- (BOOL)startTrackingAt:(NSPoint)startPoint inView:(NSView *)controlView
{
    enter();
    return YES;
}

- (BOOL)continueTracking:(NSPoint)lastPoint at:(NSPoint)currentPoint inView:(NSView *)controlView
{
    enter();
    return YES;
}

- (void)stopTracking:(NSPoint)lastPoint at:(NSPoint)stopPoint inView:(NSView *)controlView mouseIsUp:(BOOL)flag
{
    enter();
}

- (BOOL)trackMouse:(NSEvent *)theEvent inRect:(NSRect)cellFrame
            ofView:(NSView *)controlView untilMouseUp:(BOOL)flag
{
    enter();
    return [super trackMouse:theEvent inRect:cellFrame ofView:controlView untilMouseUp:flag];
}

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
    enter();
    [NSBezierPath strokeRect:cellFrame];
}

@end

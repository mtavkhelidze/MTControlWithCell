//
//  MTGenericControl.m
//
//  Created by Misha Tavkhelidze on 04/05/2014.
//  Copyright (c) 2014 misha.tavkhelidze@gmail.com. All rights reserved.
//

#import "MTGenericControl.h"
#import "MTActionCell.h"
#import "MTCommon.h"

@implementation MTGenericControl {
    MTActionCell *_cell;
    NSTrackingArea *_trackingArea;
}

#pragma mark Inits

+ (void)initialize
{
    enter();
    if(self == [MTGenericControl class]) {
        [self setCellClass:[MTActionCell class]];
    }
}

+ (Class)cellClass
{
    enter();
    return [MTActionCell class];
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        enter();
        _cell = [[MTActionCell alloc] init];
        // Cell other setup goes here or into awakeFromNib which is called next
        // (and if the control in in fact in the nib.
        [self setCell:_cell];
    }
    return self;
}

- (void)awakeFromNib
{
    enter();
}

#pragma mark Click

- (void)performClick:(id)sender
{
    enter();
}

#pragma mark Mouse

- (void)mouseDown:(NSEvent *)theEvent
{
    enter();
    // Remove line below (or don't override selector at all), if you want to handle the event all
    //by yourself and not by the target from nib
    [super mouseDown:theEvent];
}

- (void)mouseEntered:(NSEvent *)theEvent
{
    enter();
}

- (void)mouseExited:(NSEvent *)theEvent
{
    enter();
}

- (void)updateTrackingAreas
{
    if(_trackingArea == nil) {
        int opts = (NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways);
        
        _trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds
                                                     options:opts owner:self userInfo:nil];
        [self addTrackingArea:_trackingArea];
        return;
    }
    [self removeTrackingArea:_trackingArea];
}

#pragma mark Drawing

- (void)drawRect:(NSRect)dirtyRect
{
    NSBezierPath *p = [NSBezierPath bezierPathWithRect:self.bounds];
    [p setLineWidth:2.0];
    [p stroke];
    
    // a little gap of 1 pixel
    CGFloat w = self.bounds.size.width * 0.9;
    CGFloat h = self.bounds.size.height * 0.9;
    CGFloat gap = (w < h) ? w * 0.05 : h * 0.05;
    
    [_cell drawWithFrame:NSMakeRect(gap, gap, w, h) inView:self];
}

@end

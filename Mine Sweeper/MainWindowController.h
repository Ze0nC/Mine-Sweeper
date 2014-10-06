//
//  MainWindowController.h
//  Mine Sweeper
//
//  Created by Zhijin Chen on 8/17/13.
//  Copyright (c) 2013 Zhijin Chen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainWindowController : NSView
- (IBAction)buttonPressed:(id)sender;

- (void) initGameWithLevel:(NSString *) aLevel;

@end


@interface MineButton : NSButton {
    //SEL rightButtonAction;
}

@property (nonatomic) int xPosition,yPosition,content;
//- (MineButton *) initWithFrame:(NSRect) aRect XPosition:(int) x YPosition:(int) y;

@end


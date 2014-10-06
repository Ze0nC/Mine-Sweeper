//
//  MainWindowController.m
//  Mine Sweeper
//
//  Created by Zhijin Chen on 8/17/13.
//  Copyright (c) 2013 Zhijin Chen. All rights reserved.
//

#import "MainWindowController.h"

#import "MineSweeperModel.h"

#define blockSize 25

#define basicX 9
#define basicY 9
#define basicMine 10

#define middleX 16
#define middleY 16
#define middleMine 40

#define highX 30
#define highY 16
#define highMine 99

#define basicLevel @"basic"
#define middleLevel @"middle"
#define highLevel @"high"

@interface MainWindowController ()
@property (strong, nonatomic) NSMutableArray *arrayOfButtons;
@property (strong, nonatomic) MineSweeperModel *MSCore;
@end

@implementation MainWindowController

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	
    // Drawing code here.
}

@synthesize MSCore = _MSCore;
@synthesize arrayOfButtons;

- (MineSweeperModel *) MSCore
{
    if (!_MSCore) _MSCore = [[MineSweeperModel alloc] init];
    return _MSCore;
}

- (NSRect) calculateWindowRectWithNumberOfMineOnX:(int) x Y:(int) y
{
    int xSize = x * blockSize + 10;
    int ySize = y * blockSize + 120;
    
    return NSMakeRect(150, 150, xSize, ySize);
}

- (void) drawButtonsWithXSize:(int) x YSize:(int) y
{
    NSPoint origin = {5,5};
    NSRect aRect = NSMakeRect(5, 5, blockSize, blockSize);
    [[NSColor colorWithDeviceRed:0.6 green:0.6 blue:0.6 alpha:1] set];
    NSRectFill(NSMakeRect(0, 0, x*blockSize + 10, y*blockSize +10));
    for (int i = 1; i < x+1; i++)
    {
        aRect.origin.y = origin.y;
        for (int j = 1; j < y+1; j++)
        {
            //MineButton *aButton = [[MineButton alloc] initWithFrame:aRect XPosition:i YPosition:j];
            MineButton *aButton = [[MineButton alloc] initWithFrame:aRect];
            [aButton setTitle:@""];
            [aButton setTag:j*10+x];
            [aButton setAction:@selector(minePressed:)];
            [aButton setBezelStyle:NSShadowlessSquareBezelStyle];
            //[aButton setButtonType:NSMomentaryPushInButton];
            [self.arrayOfButtons addObject:aButton];
            //[[self.window contentView] addSubview:aButton];
            [self addSubview:aButton];
            
            aRect.origin.y = aRect.origin.y + blockSize;
//            //////
//            //MineButton *button = [[MineButton alloc] initWithFrame:aRect XPosition:i YPosition:j];            [self addSubview:button];
//            button.title=@"";
//            [button setTarget:self];
//            button.xPosition=j;
//            button.yPosition=i;
//            [button setBordered:YES];
//            [button setAction:@selector(minePressed:)];
//            [button setBezelStyle:NSShadowlessSquareBezelStyle];
//            //[mineButtonRow addObject:button];
//            ///////
        }
        aRect.origin.x = aRect.origin.x + blockSize;
    }
    self.needsDisplay = YES;
}

- (IBAction)minePressed:(MineButton *)sender
{
    //[sender setHidden:YES];
    //[sender setAlphaValue:1-sender.alphaValue];
    
    //[sender setTitle:[NSString stringWithFormat:@"%d,%d",sender.xPosition,sender.yPosition]];
    if ([self.MSCore checkIfIsMineAtX:sender.xPosition Y:sender.yPosition])
    {
        [sender setTitle:@"YES"];
    } else{
        [sender setTitle:@"NO"];
    }
    [sender setTitle:[NSString stringWithFormat:@"%d",[self.MSCore checkContentAtX:sender.xPosition Y:sender.yPosition]]];
    //[sender setTitle:[NSString stringWithFormat:@"%hhd",[self.MSCore checkIfIsMineAtX:sender.xPosition Y:sender.yPosition]]];
    NSLog(@"12313123132");
    [sender setBordered:NO];
    
}

- (void) initGameWithLevel:(NSString *) aLevel
{

    
    
    if ([aLevel isEqualToString:basicLevel])
    {
        //[self.window setContentSize:[self calculateWindowRectWithNumberOfMineOnX:basicX Y:basicY]];
        
        [self.window setFrame:[self calculateWindowRectWithNumberOfMineOnX:basicX Y:basicY] display:YES];
        [self drawButtonsWithXSize:basicX YSize:basicY];
        [self.MSCore generateMineMapWithXSize:basicX YSize:basicY numberOfMines:basicMine];
    
    }
}



- (IBAction)buttonPressed:(NSButton *)sender
{
    //[[self.window contentView] removeAllIndexes];
    for (int i = 0; i < [self.arrayOfButtons count]; i++)
    {
        NSLog(@"asd");
        [[self.arrayOfButtons objectAtIndex:i] removeFromSuperview];
    }
    self.arrayOfButtons = [NSMutableArray arrayWithCapacity:100];
    [self initGameWithLevel:basicLevel];
    
}

@end

@implementation MineButton
@synthesize xPosition, yPosition, content;

- (MineButton *) initWithFrame:(NSRect)aRect XPosition:(int) x YPosition:(int) y
{
    if (self = [super initWithFrame:aRect])
    {
        content = 0;
        xPosition = x;
        yPosition = y;
        NSLog(@"MineButton Inited At x:%d y:%d",x,y);
    }
    return (self);
} // init


@end

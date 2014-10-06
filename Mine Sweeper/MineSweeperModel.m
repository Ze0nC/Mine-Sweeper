//
//  MineSweeperModel.m
//  Mine Sweeper
//
//  Created by Zhijin Chen on 8/16/13.
//  Copyright (c) 2013 Zhijin Chen. All rights reserved.
//

//  Way to represent a block with an integer
//  content = numberOfMinesAroundIt + 10 * ifMarked + 20 * ifPressed
//  if numberOfMinesAroundIt = 9:
//      It is a MINE!


#import "MineSweeperModel.h"

@interface MineSweeperModel()

@property (nonatomic, strong) NSMutableArray *mineMap;
@property (nonatomic) int numberOfMines;
@property (nonatomic) int xSize;
@property (nonatomic) int ySize;

@end


@implementation MineSweeperModel

@synthesize mineMap;
@synthesize numberOfMines;
@synthesize xSize;
@synthesize ySize;


- (void) generateMineMapWithXSize:(int) x YSize:(int) y numberOfMines:(int) mine
{
    //read in variables
    self.xSize = x;
    self.ySize = y;
    self.numberOfMines = mine;
    //create empty map
    self.mineMap = [NSMutableArray arrayWithCapacity:x+2];
    
    for (int i = 0; i < xSize +2; i++)
    {
        [self.mineMap addObject:[NSMutableArray arrayWithCapacity:y+2]];
        for (int j = 0; j < ySize + 2; j++)
        {
            [[self.mineMap lastObject] addObject:[NSNumber numberWithInt:0]];
        }
    }
    //Spread mines
    for (int m = 0; m < mine; m++)
    {
        while (YES)
        {
            int randomX = arc4random_uniform(x)+1;
            int randomY = arc4random_uniform(y)+1;
            if (![self checkIfIsMineAtX:randomX Y:randomY])
            {
                [self setBlockAs:9 AtX:randomX Y:randomY];
                break;
            }
            
        }
    }
    //
    for (int i = 1; i < xSize + 1; i ++)
    {
        for (int j = 1; j < ySize + 1; j ++)
        {
            if (![self checkIfIsMineAtX:i Y:j])
            {
                int counter = 0;
                for (int a = -1; a < 2 ; a++)
                {
                    for (int b = -1; b < 2; b++)
                    {
                        if ([self checkIfIsMineAtX:i+a Y:j+b])
                        {
                            counter++;
                        }
                    }
                }
                [self setBlockAs:counter AtX:i Y:j];
            }
            
        }
    }
    
}
- (void) clickBlockAtX:(int) x Y:(int) y
{
    
}
- (void) markAtBlockAtX:(int) x Y:(int) y
{
    
}

- (void) setBlockAs:(int) content AtX:(int) x Y:(int) y
{
    [[self.mineMap objectAtIndex:x] replaceObjectAtIndex:y withObject:[NSNumber numberWithInt:content]];
}

- (BOOL) checkIfIsMineAtX:(int)x Y:(int)y
{
    if ([[[self.mineMap objectAtIndex:x] objectAtIndex:y] integerValue] % 10 == 9)
    {
        return YES;
    } else
    {
        return NO;
    }
}

- (int) checkContentAtX:(int) x Y:(int) y
{
    return [[[self.mineMap objectAtIndex:x] objectAtIndex:y] intValue];
}

@end

//
//  MineSweeperModel.h
//  Mine Sweeper
//
//  Created by Zhijin Chen on 8/16/13.
//  Copyright (c) 2013 Zhijin Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineSweeperModel : NSObject

- (void) generateMineMapWithXSize:(int) xSize YSize:(int) ySize numberOfMines:(int) mine;
- (void) clickBlockAtX:(int) x Y:(int) y;
- (void) markAtBlockAtX:(int) x Y:(int) y;
- (BOOL) checkIfIsMineAtX:(int) x Y:(int) y;
- (int) checkContentAtX:(int) x Y:(int) y;


                                                                               
@end

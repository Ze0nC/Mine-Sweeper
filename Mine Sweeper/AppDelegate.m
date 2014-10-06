//
//  AppDelegate.m
//  Mine Sweeper
//
//  Created by Zhijin Chen on 8/16/13.
//  Copyright (c) 2513 Zhijin Chen. All rights reserved.
//

#import "AppDelegate.h"
#import "MainWindowController.h"

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


@interface AppDelegate ()

@end

@implementation AppDelegate
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    //[self initGameWithLevel:basicLevel];
    [[MainWindowController alloc] initGameWithLevel:basicLevel];
    
}

@end
//
//  Menulet.m
//  SickBeardTaskbar
//
//  Created by Stian Drøbak on 24.09.12.
//  Copyright (c) 2012 Stian Drøbak. All rights reserved.
//

#import "Menulet.h"

@implementation Menulet
+ (NSStatusItem*)showMenuIcon
{
    NSStatusItem *statusItem;
    NSMenu        *theMenu;
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setImage:[NSImage imageNamed:@"idle-min"]];
    [statusItem setHighlightMode:YES];
    [statusItem setTitle:@"Hello"];
    [statusItem setEnabled:YES];
    [statusItem setToolTip:@"FUUU"];
    
    theMenu = [[NSMenu alloc] initWithTitle:@"MUU"];
    [theMenu addItemWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@"Q"];
    [statusItem setMenu:theMenu];
    return statusItem;
}
@end

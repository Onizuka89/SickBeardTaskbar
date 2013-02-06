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
    [statusItem setImage:[NSImage imageNamed:@"sick_beard_index"]];
    [statusItem setHighlightMode:YES];
    //[statusItem setTitle:@"Hello"];
    [statusItem setEnabled:YES];
    [statusItem setToolTip:@"Click for options"];
    
    theMenu = [[NSMenu alloc] initWithTitle:@"SBT"];
    [theMenu addItemWithTitle:@"Show Sick-Beard" action:@selector(openSickBeardPage:) keyEquivalent:@"A"];
    [theMenu addItemWithTitle:@"Edit" action:@selector(openSick) keyEquivalent:@"E"];
    [theMenu addItemWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@"Q"];
    [statusItem setMenu:theMenu];
    return statusItem;
}
@end
//
//  main.m
//  SickBeardTaskbar
//
//  Created by Stian Drøbak on 24.09.12.
//  Copyright (c) 2012 Stian Drøbak. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, char *argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, (const char **)argv);
}

--
--  SBTAppDelegate.applescript
--  SickBeardTaskbar
--
--  Created by Stian Drøbak on 24.09.12.
--  Copyright (c) 2012 Stian Drøbak. All rights reserved.
--

script SBTAppDelegate
	property parent : class "NSObject"
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened
        set statusBar to current application's Menulet's showMenuIcon()
        -- get file path some how
        set aFolder to ("/Applications/Sick-Beard/" as text)
        set prefix to ("python " as text)
        set postfix to ("SickBeard.py > /dev/null 2>&1 &" as text)
        set aScript to prefix&aFolder&postfix
        do shell script aScript
        -- set x to do shell script "ping google.com > /dev/null 2>&1 &"
	end applicationWillFinishLaunching_

    

	
    
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits
        try
            do shell script "kill `ps -ax | grep -e 'python .*sickbeard.py' | grep -v 'grep' | awk '{print $1}'`"
        on error
            display dialog "Unable to find and terminate process, it might not exist"
        end try
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script
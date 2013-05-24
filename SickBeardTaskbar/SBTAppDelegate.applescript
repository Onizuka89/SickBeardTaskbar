--
--  SBTAppDelegate.applescript
--  SickBeardTaskbar
--
--  Created by Stian Drøbak on 24.09.12.
--  Copyright (c) 2012 Stian Drøbak. All rights reserved.
--

script SBTAppDelegate
	property parent : class "NSObject"
    property statusBar : class "statusItem"
    property window_ : class "NSWindow"
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened
        set statusBar to current application's Menulet's showMenuIcon()
        -- get file path some how
        set aFolder to ("/Applications/Sick-Beard/" as text)
        set prefix to ("python " as text)
        set postfix to ("./SickBeard.py > /dev/null 2>&1 &" as text)
        set aScript to ("cd "&aFolder&" && "&prefix&postfix as text)
        -- switch when doing actual test, or release compilations
        do shell script aScript
        --set x to do shell script "ping google.com > /dev/null 2>&1 &"
	end applicationWillFinishLaunching_

    on openSickBeardPage_(sender)
        
        -- A test to prevent opening closed browser if one is open
        set aBrowser to ""
        if appIsRunning("Firefox")
            set aBrowser to "-a Firefox "
        else if appIsRunning("Safari")
            set aBrowser to "-a Safari "
        else if appIsRunning("Google Chrome")
            set aBrowser to "-a 'Google Chrome' "
        else if appIsRunning("Google Chrome Canary") then
            set aBrowser to "-a 'Google Chrome Canary' "
        end if
        set aPort to do shell script "grep -i 'web_port' /Applications/Sick-Beard/config.ini | sed s/'web_port = '//g"
        set aHost to do shell script "grep -i 'web_host' /Applications/Sick-Beard/config.ini | sed s/'web_host = '//g | sed s/'0.0.0.0'/'localhost'/"
        set prefix to "http://"
        set aCombiner to ":"
        set aCommand to "open "
        set runThis to aCommand & aBrowser & prefix & aHost & aCombiner & aPort
        do shell script runThis
    end
    
    on appIsRunning(appName)
        -- tell application "System Events" to (name of processes) contains appName
    end appIsRunning
    
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits
        try
            -- actual
            do shell script "kill `ps -ax | grep -e 'python .*SickBeard.py' | grep -v 'grep' | awk '{print $1}'`"
            -- debug
            -- do shell script "echo ''"
        on error
            display dialog "Unable to find and terminate process, it might not exist"
        end try
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script

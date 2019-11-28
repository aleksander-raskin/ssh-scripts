set hostnames to {"va1-p2-flnkm-01", "va1-p2-flnkm-02", "va1-p2-flnkw-01", "va1-p2-flnkw-02", "va1-p2-flnkw-03","va1-p2-flnkw-04",,"va1-p2-flnkw-05","va1-p2-flnkw-06"}

if application "iTerm" is running then
	tell application "iTerm"
		
        --creating new window
        create window with default profile
        delay 1

        --starting loop
        set num_hosts to count of hostnames
        set num_tabs to count of hostnames
        repeat with n from 1 to num_hosts

            --current tab
            tell current tab of current window
                select
                tell current session
                    write text "ssh " & (item n of hostnames) & ".ctcolo.dom"
                end tell
            end tell
            delay 1

            --creating new tab
            if num_tabs > 1 then
                tell current window
		        create tab with default profile
                set num_tabs to num_tabs - 1
	        end tell
            end if
        end repeat
	end tell
else
	activate application "iTerm"
end if

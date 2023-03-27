@echo off
set /A mobile_points=100
set /A desktop_points=150

set /A points_per_search=5

set mobile_user_agent="Mozilla/5.0 (Linux; U; Android 4.0.2; en-us; Galaxy Nexus Build/ICL53F) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30"
set desktop_edge_user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54"

set /A index=0
set /A total_points=%mobile_points%+%desktop_points%

setlocal enabledelayedexpansion
echo Closing any existing msedge windows bc it will mess with our user-agent headers shenanigans

:open_mobile_urls
taskkill /F /IM msEdge.exe
set urllist= 
FOR /L %%X IN (0,%points_per_search%,%mobile_points%) DO set urllist=!urllist! "https://www.bing.com/?q=%%X"
echo OPENING IN MOBILE MODE
start msedge --new-window --user-agent=%mobile_user_agent% %urllist%

:wait_for_pages_to_load
timeout 10
taskkill /F /IM msEdge.exe

:open_desktop_urls
set urllist= 
FOR /L %%X IN (%mobile_points%,%points_per_search%,%total_points%) DO set urllist=!urllist! "https://www.bing.com/?q=%%X"
echo OPENING IN DESKTOP MODE
start msedge --new-window --user-agent=%desktop_edge_user_agent% %urllist% 

:wait_for_pages_to_load
timeout 10
taskkill /F /IM msEdge.exe


:open_rewards
start msedge "https://rewards.bing.com/"

:exit
echo "DONE"!

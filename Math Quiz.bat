@echo off
if not exist scores mkdir scores
cd scores
chcp 65001 >nul
setlocal EnableDelayedExpansion
title Math Quiz
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Error; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Math Quiz', 'Dont forget to learn', [System.Windows.Forms.ToolTipIcon]::None)}"

echo.
echo [38;2;255;0;0m███╗   ███╗ █████╗ ████████╗██╗  ██╗     ██████╗ ██╗   ██╗██╗███████╗
echo [38;2;255;51;0m████╗ ████║██╔══██╗╚══██╔══╝██║  ██║    ██╔═══██╗██║   ██║██║╚══███╔╝
echo [38;2;255;102;0m██╔████╔██║███████║   ██║   ███████║    ██║   ██║██║   ██║██║  ███╔╝ 
echo [38;2;255;153;0m██║╚██╔╝██║██╔══██║   ██║   ██╔══██║    ██║▄▄ ██║██║   ██║██║ ███╔╝  
echo [38;2;255;204;0m██║ ╚═╝ ██║██║  ██║   ██║   ██║  ██║    ╚██████╔╝╚██████╔╝██║███████╗
echo [38;2;255;155;0m╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝     ╚══▀▀═╝  ╚═════╝ ╚═╝╚══════╝[0m
                                                                     
pause

echo
echo ⚠️[43mWARNING:[0m If your name contains \ / : * ? " < > | then the log file may have issues creating
set /p username="Your name: "
set /a correct=0 
set /a incorrect=0

cls

echo.
echo [38;2;255;0;0m███╗   ███╗ █████╗ ████████╗██╗  ██╗     ██████╗ ██╗   ██╗██╗███████╗
echo [38;2;255;51;0m████╗ ████║██╔══██╗╚══██╔══╝██║  ██║    ██╔═══██╗██║   ██║██║╚══███╔╝
echo [38;2;255;102;0m██╔████╔██║███████║   ██║   ███████║    ██║   ██║██║   ██║██║  ███╔╝ 
echo [38;2;255;153;0m██║╚██╔╝██║██╔══██║   ██║   ██╔══██║    ██║▄▄ ██║██║   ██║██║ ███╔╝  
echo [38;2;255;204;0m██║ ╚═╝ ██║██║  ██║   ██║   ██║  ██║    ╚██████╔╝╚██████╔╝██║███████╗
echo [38;2;255;155;0m╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝     ╚══▀▀═╝  ╚═════╝ ╚═╝╚══════╝

:q1
echo [31mWhat is 7 × 3?[0m
set /p ans1="Answer: "
if "%ans1%"=="" (
    echo ⚠️ Please enter a value.
    goto :q1
)
if "%ans1%"=="21" (
    echo ✅ Correct!
    set /a correct+=1
	set q1res=✅
	goto :q2
) else (
    echo ❌ Incorrect!
    set /a incorrect+=1
	set q1res=❌
	goto :q2
)

:q2
echo [32mWhat is 5 × 6?[0m
set /p ans2="Answer: "
if "%ans2%"=="" (
    echo ⚠️ Please enter a value.
    goto :q2
)
if "%ans2%"=="30" (
    echo ✅ Correct!
    set /a correct+=1
	set q2res=✅
	goto :q3
) else (
    echo ❌ Incorrect!
    set /a incorrect+=1
	set q2res=❌
	goto :q3
)

:q3
echo [33mWhat is 9 × 2?[0m
set /p ans3="Answer: "
if "%ans3%"=="" (
    echo ⚠️ Please enter a value.
    goto :q3
)
if "%ans3%"=="18" (
    echo ✅ Correct!
    set /a correct+=1
	set q3res=✅
	goto :q4
) else (
    echo ❌ Incorrect!
    set /a incorrect+=1
	set q3res=❌
	goto :q4
)

:q4
echo [35mWhat is 3 × 8[0m?
set /p ans4="Answer: "
if "%ans4%"=="" (
    echo ⚠️ Please enter a value.
    goto :q4
)
if "%ans4%"=="24" (
    echo ✅ Correct!
    set /a correct+=1
	set q4res=✅
	goto :end
) else (
    echo ❌ Incorrect!
    set /a incorrect+=1
	set q4res=❌
	goto :end
)

set "bar_correct="
for /L %%i in (1,1,%correct%) do set "bar_correct=!bar_correct!✅"

set "bar_incorrect="
for /L %%i in (1,1,%incorrect%) do set "bar_incorrect=!bar_incorrect!❌"

:end
echo.
echo %username%'s results:
set /a total=correct + incorrect
echo 🔢 Quiz Summary:


if %total%==0 (
    echo 📊 Accuracy: N/A (No questions attempted)
) else (
    set /a percent=correct*100/total
    echo 📊 Accuracy: %percent%
)

if %percent% leq 25 (
    set rating=🔼 Keep Practicing!
) else if %percent% leq 50 (
    set rating=☑️ Getting There!
) else if %percent% leq 75 (
    set rating=✅ Almost Solid!
) else if %percent% lss 100 (
    set rating=✨ Great Job!
) else (
    set rating=🎉 Perfect Score Awesome Work!
)
echo 📃Rating:%rating%
echo [41m➖ %incorrect% [0m !bar_incorrect!   [42m➕ %correct% [0m !bar_correct!
echo 🧠 Total attempted: %total%
echo 💾 Log file exported to "%username%'s_scores.csv" . 
echo 🎉 Thanks for playing!
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Math Quiz', 'Thanks for learning', [System.Windows.Forms.ToolTipIcon]::None)}"

set "logfile=%username%'s_scores.csv"

for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set "day=%%a"
    set "month=%%b"
    set "year=%%c"
)
for /f "tokens=1-2 delims=:." %%a in ("%time%") do (
    set "hour=%%a"
    set "min=%%b"
)

>>"%logfile%" echo ﻿
>>"%logfile%" echo ,,,,,,[%date% %time%] 1's Math Quiz Result
>>"%logfile%" echo 🌟 Rating: %rating%
>>"%logfile%" echo ,,,Results for each question:
>>"%logfile%" echo ,Incorrect/Correct
>>"%logfile%" echo Question 1,%q1res%
>>"%logfile%" echo Question 2,%q2res%
>>"%logfile%" echo Question 3,%q3res%
>>"%logfile%" echo Question 4,%q4res%
>>"%logfile%" echo Correct: %correct%,Incorrect: %incorrect%,Accuracy: %percent%,Total: %total%

pause >nul
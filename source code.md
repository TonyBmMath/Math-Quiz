## Here's the source code if you want to make your own quiz!
Language: batch (perfect for windows users, already the most popular operating system)

Note: lines starting with *::* are just comments to amke you understand, feel free to remove them
⚠️WARNING: Prevent overlapping enviroment variables
**Add to start: (replace "[your ascii banner here]" with ascii banner** (create it using this website: [Text to ASCII art generator (short as taag)](patorjk.com/software/taag))
```batch
@echo off
chcp 65001 >nul
:: Note: every part after this is optional except for setlocal EnableDelayedExpansion, set /a correct=0, set /a incorrect=0
if "%1"=="/v" (
    echo ---------------------------------------
    echo Quiz - Version Guide
    echo ---------------------------------------
    echo Description:
    echo   Test your [topic] skills in a fun quiz format.
    echo.
    echo Usage:
    echo   Quiz.bat           Starts the quiz
    echo   Quiz.bat /v     Displays this version guide
    echo.
	echo Version: v2.0
	pause >nul
  exit /b
)
if not exist scores mkdir scores
cd scores
title Math Quiz
setlocal EnableDelayedExpansion
echo ⚠️[43mWARNING:[0m If your name contains \ / : * ? " < > | then the log file may have issues creating
set /p username="Your name: "
set /a correct=0 
set /a incorrect=0
```

**Fill-in-the-blank**
```batch
:question
echo [41mQuestion 1:[0m What is 7 × 3?
set /p ans1="Answer: "
if "%ans1%"=="" (
    echo ⚠️ Please enter a value.
    goto :q1
)
:: replace "21" in the row below with your correct answer
if "%ans1%"=="21" (
    echo ✅ Correct!
    set /a correct+=1
	set q1res=✅
) else (
    echo ❌ Incorrect!
    set /a incorrect+=1
	set q1res=❌
)
```

**Multiple-choice**
```batch
:question
echo [41mQuestion 1:[0m What is 7 × 3?
echo 1) 27
echo 2) 54
echo 3) 11
echo 4) 21
echo 5) 34
choice /c 12345 ans1="Answer: "
set ans1=%errorlevel%
:: replace "4" in the row below with your correct choice
if "%ans1%"=="4" (
    echo ✅ Correct!
    set /a correct+=1
	set q1res=✅
) else (
    echo ❌ Incorrect!
    set /a incorrect+=1
	set q1res=❌
)
```

**Match**

IMPORTANT: add setlocal EnableDelayedExpansion before the question
```batch
setlocal EnableDelayedExpansion

echo Match the equations to their correct answers:
echo.
echo 1) 7 × 3        a) 3
echo 2) 12 ÷ 4       b) 21
echo 3) 9 + 6        c) 15
echo.

:: Question 1
echo What is the answer to 7 × 3?
echo a) 21
echo b) 3
echo c) 15
choice /c ABC /n /m "Choose the correct letter: "
set match1=!errorlevel!
if !match1! equ 1 set /a correct+=1
```

**Categorize**
```batch
setlocal EnableDelayedExpansion

title Math Categorization Quiz

echo Welcome to the Math Categorization Quiz!
echo --------------------------------------------
echo Categorize each expression:
echo A = Addition
echo S = Subtraction
echo M = Multiplication
echo.

:: Question 1
echo Question 1: What type of operation is 7 × 3?
echo A) Addition
echo S) Subtraction
echo M) Multiplication
choice /c ASM /n /m "Category: "
set q1=!errorlevel!
if "!q1!"=="3" (
    echo ✅ Correct!
    set /a correct+=1
) else (
    echo ❌ Incorrect!
)
```

**Labeling**
```batch
setlocal EnableDelayedExpansion

title Math Labeling Quiz (Grade 4)

echo 🧮 Label the parts of this expression: 8 + 4 = 12
echo.

:: Question 1 — First number
echo What is the first number?
echo 1) 6
echo 2) 7
echo 3) 8
echo 4) 9
choice /c 1234 /n /m "Choose: "
set label1=!errorlevel!

:: Evaluate
if "!label1!"=="3" set /a correct+=1
```

**Add to end:**
```batch
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

set "logfile=%username%'s_scores.csv"
>>"%logfile%" echo ﻿
>>"%logfile%" echo ,,,,,,[%date% %time%] %username%'s Math Quiz Result
>>"%logfile%" echo 🌟 Rating: %rating%
>>"%logfile%" echo ,,,Results for each question:
>>"%logfile%" echo ,Incorrect/Correct
>>"%logfile%" echo Question 1,%q1res%
>>"%logfile%" echo Question 2,%q2res%
>>"%logfile%" echo Question 3,%q3res%
>>"%logfile%" echo Question 4,%q4res%
>>"%logfile%" echo Correct: %correct%,Incorrect: %incorrect%,Accuracy: %percent%,Total: %total%,📃Rating:%rating%

echo [41m➖ %incorrect% [0m !bar_incorrect!   [42m➕ %correct% [0m !bar_correct!
echo 🧠 Total attempted: %total%
echo 💾 Log file exported to "%username%'s_scores.csv" . 
echo 🎉 Thanks for playing!
set /p openfile="Open file? [y/n]"
if "%openfile%"=="y" explorer %cd%\%username%'s_scores.csv
if "%openfile%"=="n" break
pause >nul
```

🎮 Offline Math Quiz Engine — Built in Batch
✅ No Ads | 💾 Local Logs | 🧠 Smart Feedback
🌐 Connect with us:
[YouTube](https://www.youtube.com/@LearnMathwithTonyBM)
[Facebook](https://www.facebook.com/LearnMathwithTonyBM)
[Google Classroom](https://classroom.google.com/c/NzgyNjIzNzA1MTYy?cjc=pou4ig4b)
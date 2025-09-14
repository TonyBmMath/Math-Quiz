---

### 🎮 **Purpose**
Create a fun little math quiz app in the Windows terminal using batch scripting. It tests the user on multiplication problems, tracks correct/incorrect answers, and logs results to a CSV file — all wrapped with a touch of visual flair.

---

### 🧩 **Key Functional Components**

#### 📁 Setup & Environment
- Creates a `scores` folder if it doesn’t exist and navigates into it.
- Sets UTF-8 encoding with `chcp 65001` for proper character rendering.
- Uses `setlocal EnableDelayedExpansion` to allow dynamic variable updates.
- Titles the command window **“Math Quiz”**.

#### 🛎️ Notifications
- **PowerShell Balloon Tip** pops up at the start and end to remind and thank the user.

#### 🎨 ASCII Branding
- Displays colorful ASCII art using ANSI escape codes to give a fun visual header.

#### 👤 User Input
- Prompts for user's name.
- Warns against problematic characters for filename safety.

#### ❓ Quiz Questions
- Asks four multiplication questions.
- Validates non-empty input.
- Tallies correct/incorrect answers.
- Assigns emojis based on response.

#### 📊 Summary & Scoring
- Calculates accuracy percentage.
- Dynamically builds emoji bars:
  - `✅` for correct answers
  - `❌` for incorrect answers
- Provides a rating (e.g., “✨ Great Job!” or “🔼 Keep Practicing!”)

#### 💾 Logging Results
- Creates a log file named after the user (e.g., `[username]'s_scores.csv`)
- Logs:
  - Date and time
  - Rating
  - Question-by-question results
  - Overall accuracy and counts

#### ⏹️ End of Script
- Pauses before exit.
- Plays a second PowerShell notification thanking the user.

---

### 🧠 Why It’s Cool
- Totally runnable from Windows Explorer — no extra tools needed.
- Great use of basic scripting logic and visual tricks.
- Motivational feedback + emoji-powered progress bar 🎯

---
quizziz will be shocked )joke(

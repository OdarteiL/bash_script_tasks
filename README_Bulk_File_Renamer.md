
# Bulk File Renamer (Bash Script)

## 📄 Description

This Bash script renames all files in a specified folder based on a consistent naming pattern.
The script allows the user to specify:
- A custom **prefix**
- Whether to include a **counter**
- Whether to include the **current date**

This is useful for organizing large numbers of files such as images, reports, or logs.

---

## 🛠️ How It Works

1. The script checks that exactly one argument (a folder path) is provided.
2. It validates that the folder exists.
3. The user is prompted to enter:
   - A **prefix** (e.g., `file_`)
   - Whether to include a **number counter** (e.g., `file_01`)
   - Whether to append the **current date** (e.g., `file_01_20250514`)
4. It renames all files in the folder while keeping their original extensions.

---

## 💻 Usage

### 1. Make the script executable
```bash
chmod +x bulk_file_renamer.sh
```

### 2. Run the script
```bash
./bulk_file_renamer.sh /path/to/your/folder
```

### 3. Example Interaction
```bash
Enter the prefix to use for renamed files (e.g., project_): report_
Include a counter in the filename? (y/n): y
Include today's date in the filename? (y/n): y
Renamed: image.jpg → report_01_20250514_.jpg
Renamed: notes.txt → report_02_20250514_.txt
```

---

## 🗂️ Output Example

**Before running the script:**

```
documents/
├── image.jpg
├── notes.txt
├── data.csv
```

**After renaming with prefix `report_`, counter, and date:**

```
documents/
├── report_01_20250514_.jpg
├── report_02_20250514_.txt
├── report_03_20250514_.csv
```

---

## ⚙️ Features

- 🧠 Smart file extension preservation
- 🔢 Optional auto-incrementing counters
- 📅 Optional date stamping
- 📂 Handles any file type

---

## ❗ Notes

- Files will be **overwritten** if names collide (use with caution).
- The script only affects **regular files**, not folders.
- Hidden files (e.g., `.env`, `.gitignore`) are **ignored by default**.

---

## 🙋 Author

**Name:** Alberto Odartei  
**Project:** Bash Scripting Assignment - Bulk File Renamer  
**Mentor/Reviewer:** [Fill this in if required]

---

## 🧠 Bonus Ideas

- Add support for dry-run (preview changes without renaming)
- Save a log of renamed files
- Add file-type filtering (e.g., rename only `.jpg` files)

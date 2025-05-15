
# Duplicate File Finder (Bash Script)

## 🔍 Description

This Bash script identifies **duplicate files** in a given directory by comparing their content using SHA-256 hashing.
It then provides an option to either **delete** or **move** those duplicates to a separate folder.

This is especially useful for cleaning up storage space or organizing large file collections where duplicates often occur.

---

## 🧠 How It Works

1. The script accepts a single argument: the path to the folder to scan.
2. It scans all files recursively using `find`.
3. For each file, it computes a SHA-256 hash of its content.
4. Files with identical hashes are flagged as duplicates.
5. The user is prompted to choose what to do with the duplicates:
   - **Delete them**
   - **Move them** to a folder named `Duplicates_Moved/`
   - **Skip** and leave all files unchanged

---

## 💻 Usage

### 1. Make the script executable

```bash
chmod +x duplicate_file_finder.sh
```

### 2. Run the script

```bash
./duplicate_file_finder.sh /path/to/your/folder
```

### 3. Example Interaction

```bash
🔁 Duplicate files found:
/home/user/Documents/copy1.jpg
/home/user/Documents/copy1 (1).jpg

Do you want to delete (d) or move (m) duplicates? (d/m/skip): m
Moved: /home/user/Documents/copy1 (1).jpg → /home/user/Documents/Duplicates_Moved/
```

---

## 📂 Output Example

**Original Folder:**

```
photos/
├── beach.jpg
├── beach (copy).jpg
├── document.txt
```

**After Running Script (Move Option):**

```
photos/
├── beach.jpg
├── document.txt
├── Duplicates_Moved/
│   └── beach (copy).jpg
```

---

## 🛠️ Features

- 📄 Content-based duplicate detection (not just filenames)
- 🔒 Uses secure hashing (`sha256sum`)
- 🧼 Option to delete or move duplicates
- 🔎 Recursively scans all files

---

## ⚠️ Notes

- Only **exact file content** matches are considered duplicates
- Duplicate filenames that are **not** identical in content will be **ignored**
- Moved files go to `Duplicates_Moved/` in the same directory
- You can safely run it multiple times

---

## 🙋 Author

**Name:** Alberto Odartei  
**Project:** Bash Scripting Assignment - Duplicate File Finder  
**Mentor/Reviewer:** [Fill in if needed]

---

## 💡 Bonus Ideas

- Add dry-run option to preview what will be deleted/moved
- Add logging to a report file
- Support skipping large files or filtering by extension


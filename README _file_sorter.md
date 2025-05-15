
# Automatic File Sorter (Bash Script)

## 📁 Description

This Bash script organizes files in a specified directory by sorting them into subfolders based on file type.
It helps keep directories clean and structured by automatically moving documents, images, videos, audio files, 
and all other file types into separate folders.

---

## 🚀 How It Works

When you provide a folder path to this script, it:

1. Checks that a valid folder path is provided.
2. Creates the following subfolders (if they don’t exist already):
   - `Documents/`
   - `Images/`
   - `Videos/`
   - `Audio/`
   - `Other/`
3. Iterates through each file in the folder.
4. Determines its type based on its extension.
5. Moves it to the correct subfolder.

---

## 🛠️ Requirements

This script runs on any Linux system with Bash installed. No additional dependencies are required.

---

## 💡 Usage Instructions

### 1. Make the script executable

```bash
chmod +x sort_files.sh
```

### 2. Run the script with the target directory as an argument

```bash
./sort_files.sh /path/to/your/folder
```

#### Example:

```bash
./sort_files.sh ~/Downloads/test_folder
```

This will create subfolders inside `test_folder` and move the files accordingly.

---

## 🗂️ File Type Mapping

| File Extension         | Target Folder |
|------------------------|---------------|
| .txt, .pdf, .doc, .docx| Documents     |
| .jpg, .jpeg, .png, .gif, .bmp | Images |
| .mp4, .mkv, .mov, .avi | Videos        |
| .mp3, .wav, .flac      | Audio         |
| All others             | Other         |

---

## 🧪 Output Example

Given the directory `~/Downloads/test_folder` containing mixed files:

```
test_folder/
├── report.pdf
├── song.mp3
├── movie.mp4
├── photo.jpg
├── script.sh
```

After running the script:

```
test_folder/
├── Documents/
│   └── report.pdf
├── Audio/
│   └── song.mp3
├── Videos/
│   └── movie.mp4
├── Images/
│   └── photo.jpg
├── Other/
│   └── script.sh
```

---

## 🙋 Author

**Name:** Alberto Odartei  
**Purpose:** Amalitech Bash Scripting Assignment  
**Mentor/Reviewer:** [Fill in if required]

---

## ✅ Notes

- Only processes regular files (ignores folders and symlinks).
- Will overwrite files with the same name in the destination.
- Hidden files are ignored by default (`.*`).

---

## 📅 Optional Extension Ideas

- Add support for recursive folder sorting.
- Create a log file of moved files.
- Allow a dry-run mode for previewing actions.
- Integrate with cron for scheduled sorting.

---

## 🧠 Tip

Use this script regularly to keep your Downloads or Desktop folder neat and organized!

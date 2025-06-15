# cursor-explorer-integration
# Open in Cursor - Right Click Menu for Windows

This repository shows how to add a **"Open in Cursor"** option to the right-click context menu in Windows File Explorer. It allows you to launch the [Cursor](https://www.cursor.so/) AI code editor directly in any folder with a single click.

---

## 📌 What It Does

- Adds **"Open in Cursor"** when you right-click on a folder or empty space inside a folder.
- Opens that location directly in the Cursor editor (like `cursor .`).
- Uses either a `.reg` file or a PowerShell script to set up the registry keys.

---

## 🚀 Quick Setup

### Method 1: PowerShell Script

> Make sure the `cursor` CLI works in your terminal before running this.

1. Open **PowerShell as Administrator**.
2. Run the script:
   ```powershell
   .\add_cursor_context.ps1

### Method 2: Manual Reg File

1. Open add_cursor_context.reg in Notepad.
2. Replace YourUserName with your actual Windows username.
3. Double-click the file to merge it into the Registry.
4. Restart File Explorer (or log out/in) to apply.
   
 ---  

 ## 📂 Files Included
 
| File                        | Purpose                                        |
| --------------------------- | ---------------------------------------------- |
| `add_cursor_context.ps1`    | Automatically adds context menu via PowerShell |
| `add_cursor_context.reg`    | Adds context menu manually via Registry Editor |
| `remove_cursor_context.reg` | Removes the right-click entry from the system  |

---

## 🔧 Requirements

- Cursor Editor installed
- cursor command available in system PATH

You can enable the cursor CLI by running:
Ctrl + Shift + P → Shell Command: Install 'cursor' command in PATH

---

## 🧹 Optional

To remove the context menu later, use the remove_cursor_context.reg file provided

---

## 🙌 Credits

Inspired by developers who love productivity — and dislike manually navigating folders.

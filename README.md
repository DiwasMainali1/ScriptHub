# ScriptHub: A Simple Version Control System

Script is a lightweight, shell script-based version control system inspired by Git. It provides basic version control functionality using simple shell commands, making it easy to understand and modify.

## Features

- Initialize a repository
- Add files to the staging area
- Commit changes
- View commit history
- Create and manage branches
- Show file contents from specific commits
- Check the status of your working directory

## Commands

- `script-init`: Initialize a new Script repository
- `script-add`: Add files to the staging area
- `script-commit`: Commit staged changes
- `script-log`: View commit history
- `script-show`: Display file contents from a specific commit
- `script-branch`: Create, list, or delete branches
- `script-checkout`: Switch between branches or restore files
- `script-status`: Show the status of the working directory
- `script-rm`: Remove files from the working directory and staging area

## Installation

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/script.git
   ```

2. Add the script directory to your PATH:
   ```
   export PATH=$PATH:/path/to/script
   ```

3. Make sure all script files are executable:
   ```
   chmod +x /path/to/script/*
   ```

## Usage

1. Initialize a new repository:
   ```
   script-init
   ```

2. Add files to the staging area:
   ```
   script-add file1.txt file2.txt
   ```

3. Commit changes:
   ```
   script-commit "Your commit message"
   ```

4. View commit history:
   ```
   script-log
   ```

5. Create a new branch:
   ```
   script-branch new-feature
   ```

6. Switch to a branch:
   ```
   script-checkout new-feature
   ```

7. Show file contents from a specific commit:
   ```
   script-show commit_number:filename
   ```

8. Check the status of your working directory:
   ```
   script-status
   ```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source and available under the [MIT License](LICENSE).


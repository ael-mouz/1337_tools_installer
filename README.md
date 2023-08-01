# Bash Script: Package Installer

This Bash script provides an interactive menu to help you install various packages on your system. It primarily focuses on installing Homebrew (if not already installed) and then allows you to install two additional packages: `readline` and `valgrind`.

## Prerequisites

Before running this script, ensure that you have the following:

1. macOS or Linux-based operating system.
2. `curl` installed to download the Homebrew installation script.
3. `zsh` shell installed as the default shell for executing the Homebrew installation.

## Usage

1. Clone or download the `install_dependencies.sh` script to your local machine.

2. Make the script executable by running the following command in the terminal:

   ```bash
   chmod +x install_dependencies.sh
   ```

3. Execute the script by running the following command:

    ```bash
    ./install_dependencies.sh
    ```

4. The script will display an interactive menu with options to install different packages:

    - `[0] - Homebrew`: This option will install Homebrew if it's not already installed and update it if it's already present.

    - `[1] - Readline`: This option will install the `readline` package using Homebrew.

    - `[2] - Valgrind`: This option will install `valgrind` using Homebrew.

    - `[3] - Exit`: This option will terminate the script.

5. Choose the appropriate option by typing the corresponding number and pressing Enter.

6. If you choose to install a package, the script will guide you through the installation process.

7. Once the installation is complete, the script will display a success message.

## Package Descriptions

### Homebrew

Homebrew is a popular package manager for macOS and Linux. It allows you to easily install, update, and manage various software packages on your system.

### Readline

Readline is a library that provides line-editing and history capabilities for interactive programs, including shells.

### Valgrind

Valgrind is a powerful tool for memory debugging, memory leak detection, and profiling. It helps you identify and fix memory-related issues in C and C++ programs.

### Notes

- The script will check if Homebrew is already installed on your system. If not, it will automatically install it for you.
- If you select the `Readline` or `Valgrind` options, the script will ensure that Homebrew is installed and up-to-date before proceeding with the installation of the specific package.
- If an error occurs during the installation process, the script will display an error message and exit.
- The script requires an active internet connection to download and install packages from Homebrew.

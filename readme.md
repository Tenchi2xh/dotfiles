# Tenchi's dotfiles

Very customized macOS setup for Macbooks.

## Features:

- Use easily editable config files to automatically:
    - Install of a host of [applications and tools](config/packages.yaml) from Homebrew and the Mac App Store
    - Manage the [Dock](config/dock.yaml) and and set [custom icons](config/icons.yaml):

        ![](resources/dock.png)
        - Apps are automatically added to the dock and separated into categories
        - Custom icons are patched into apps that ship with ugly default icons
    - Set [custom file associations](config/associations.yaml)
    - Configures most macOS settings with more [sensible defaults](config/macos-preferences.yaml)

- Sets up a [custom prompt](dotfiles/dot_local/customizations/prompt.zsh) and [CLI themes](dotfiles/dot_local/customizations/colors.zsh):

    <img src="resources/prompt.png" width=556 />

    - Animated intro
    - Custom syntax highlighting and tab completions
    - Custom colors for `ls`, `tree`, `grep`, `man`, `git`, `tldr`

- Configures some tools:
    - iTerm2: quake console style global shortcut: <kbd>⌘ + `</kbd>, custom font and theme
    - Sublime Text: [packages](config/sublime.yaml), [theme, settings](dotfiles/private_Library/private_Application%20Support/private_Sublime%20Text/private_Packages/private_User/Preferences.sublime-settings)
    - Visual Studio Code: [extensions](config/vscode.yaml), [theme, settings](dotfiles/private_Library/private_Application%20Support/private_Code/User/_settings.json)
    - SSH private key and other environment variables using password manager

- Fixes missing macOS features:
    - Hide menu bar icons ([Hidden Bar](https://github.com/dwarvesf/hidden))
    - Window tiling manager ([Rectangle](https://rectangleapp.com/))
    - Resolution switcher ([SwitchResX](https://www.madrau.com/), paid)
    - Prevent sleep ([KeepingYouAwake](https://keepingyouawake.app/))
    - Hide notch ([TopNotch](https://topnotch.app/))
    - Mouse acceleration fix ([Linear Mouse](https://linearmouse.app/))

## Install

On a new computer:

- First, install Brew and the two top-level dependencies:

    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install chezmoi bitwarden-cli
    ```

- Then, log in and unlock the Bitwarden vault, then copy paste the `export` command:

    ```bash
    bw login
    bw unlock
    ```

- Finally, run `chezmoi`:

    ```bash
    chezmoi init --apply Tenchi2xh
    ```

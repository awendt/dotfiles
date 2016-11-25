# Dotfiles

These are the dotfiles I use.
They are [managed with stow](https://taihen.org/managing-dotfiles-with-gnu-stow/).

## Setup

This guide assumes you're running OSX.

1. Install [stow](https://www.gnu.org/software/stow/):

   ```
   brew install stow
   ```

2. To install Bash configuration files, just do:

   ```
   cd ~/dotfiles
   stow bash
   ```

3. To restow a modified configuration, just do:

   ```
   cd ~/dotfiles
   stow -R bash
   ```

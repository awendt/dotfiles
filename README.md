# Dotfiles

These are the dotfiles I use.
They are [managed with stow](http://web.archive.org/web/20171007000027/https://taihen.org/managing-dotfiles-with-gnu-stow/).

## Setup

This guide assumes you're running OSX.

1. Install [stow](https://www.gnu.org/software/stow/):

   ```
   brew install stow
   ```

2. To install all configuration files at once, just do:

   ```
   cd ~/dotfiles
   make
   ```

3. To selectively install configuration files (e.g. Bash), just do:

   ```
   cd ~/dotfiles
   stow bash
   ```

3. To restow a modified configuration, just do:

   ```
   cd ~/dotfiles
   stow -R bash
   ```

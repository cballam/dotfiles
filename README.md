# dotfiles - Backup of my dotfiles for my linux configuration, currently on Artix

## Programs that are configured here:

- Terminal Emulator: Alacritty (.config/alacritty/alacritty.yaml)
- Text Editor: Nvim (.config/nvim/init.lua)
- Window Manager: bspwm (.config/bspwm)
- Hotkey Daemon: sxhkd (.config/sxhkd)
- Status Bar: polybar (.config/polybar/config)
- Compositor: compton (compton.conf)

## Extras:

Included some nice scripts in the scripts directory that I use regularly (some used in sxhkd, polybar etc).
There are also helpful aliases and functions in .bashrc and .bash_aliases like gcd (use fd/fzf to change to any directory with .git) and e (quickly edit file in vim using fzf prompt).
My neovimrc (~/.nvimrc) includes tons of plugins, some of which need manual installation (CoC). Much of the configuration is meant to work with those plugins and there will likely be issues if they are not installed.
Screenshot shows left/right screens with polybar running

## Screenshot:

<p align="center">
  <img width="1000"
       alt="Screenshot of current desktop environment"
       src="https://raw.githubusercontent.com/cballam/dotfiles/master/desktop_screenshot.png"
</p>

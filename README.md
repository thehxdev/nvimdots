# HxDev Neovim

My Neovim configuration that I use reqularly for programming.


## Prerequisites

- Neovim >= 0.8.0 (version 0.8.0 or newer)
- a Nerd Font ([Nerd Fonts](https://www.nerdfonts.com))
- a modern terminal emulator like [Alacritty](https://github.com/alacritty/alacritty)(Recommended) or [Kitty](https://sw.kovidgoyal.net/kitty/)
- `fd` and `ripgrep` programs used for `Telescope.nvim` plugin for fuzzy finding.

NOTE: It's better to setup **TokyoNight** colorscheme for your terminal emulator. Because i'm using TokyoNight colorscheme
for this configuration.


## How to setup

After you have all the prerequisites, it's time to setup Neovim.


1. If you already have a configuration for Neovim make a backup:
```bash
# make a .tar.gz archive file from old configurations to ~/nvim-backup.tar.gz
tar xzvf ~/nvim-backup.tar.gz ~/.config/nvim

# remove old configs and also old Neovim data
rm -rf ~/.local/share/nvim ~/.config/nvim
```


2. Clone this configuration
```bash
git clone --depth 1 --branch main https://github.com/thehxdev/nvimdots ~/.config/nvim
```


3. Enter to Neovim with `nvim` command and wait to `lazy.nvim` plugin install itself.


## Features

NOTE: I'm using this configuration on [NixOS](https://nixos.org/). To setup LSP support for your language, you must
do some manual work.

- Plugin Management with [Lazy.nvim](https://github.com/folke/lazy.nvim)
- LSP support for every language that Neovim supportes (Manual Setup)
- LSP Diagnostics report and IDE like features
    - [Which languages supported by Neovim's LSP?](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
    - Edit [lspconf.lua](https://github.com/thehxdev/nvimdots/blob/main/lua/lspconf.lua) file and uncomment pre-configured LSPs.
- Auto completions using [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Tree-Sitter syntax highliting
- File navigation with NeoTree (Integrated with Git)
- Fuzzy finder ([Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim))
- Complete Git integration with [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- Show help messege with prefixed keymaps with [whichkey](https://github.com/folke/which-key.nvim)


## LSP

Neovim LSP Documentation.

### Q&A

- [Which languages supported by Neovim's LSP?](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

### How to configure a programming language's LSP server?

1. First visit [Server Configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) and install proper LSP server.

2. If you already installed LSP server, open [lspconf.lua](https://github.com/thehxdev/nvimdots/blob/main/lua/lspconf.lua) with Neovim.
Try to find your programming language and uncomment the code block that configures that language's LSP.

3. If your language or LSP server not found in `lspoconf.lua`. follow guids in [Server Configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).


## Keymaps

Keymaps used in this configuration.

**NOTE: In the tables below you see `LR` key. this referes to `Space` key which is configured
as leader key.**

### Window

| Keymap     	| Actoin                                  	|
|------------	|-----------------------------------------	|
| `ctrl + h` 	| Focuse on left window                   	|
| `ctrl + l` 	| Focuse on right window                  	|
| `ctrl + j` 	| Focuse on bottom window                 	|
| `ctrl + k` 	| Focuse on top window                    	|
| `ctrl + 🠖` 	| resize current window to the right side 	|
| `ctrl + 🠔` 	| resize current window to the left side  	|
| `ctrl + 🠗` 	| resize current window to the down side  	|
| `ctrl + 🠕` 	| resize current window to the up side    	|


### Buffer

| Keymap      	| Actoin                    	|
|-------------	|---------------------------	|
| `Shift + h` 	| Focuse on next buffer     	|
| `Shift + l` 	| Focuse on previous buffer 	|
| `Shift + m` 	| kill (delete) buffer      	|


### Visual mode (v)

This keymaps work if you in the vim's visual-mode (`visual-line`, `visual-mode`, `visual-block`).

| Keymap      	| Actoin                                            	|
|-------------	|---------------------------------------------------	|
| `<`         	| Indent selected lines to right side               	|
| `>`         	| Indent selected lines to left side                	|
| `Shift + j` 	| Move selected lines one line above                	|
| `Shift + k` 	| Move selected lines on line below                 	|
| `alt + j`   	| Same as `Shift + j` but also works in normal-mode 	|
| `alt + k`   	| Same as `Shift + k` but also works in normal-mode 	|


### Neotree (File Navigator)

Press `?` key while you are in Neotree window and it will show you all keymaps used **inside** Neotree.

| Keymap   	| Actoin                          	|
|----------	|---------------------------------	|
| `LR + e` 	| Toggle Neotree (open and close) 	|


### Telescope (Fuzzy Finding)

| Keymap       	| Actoin                                                                           	|
|--------------	|----------------------------------------------------------------------------------	|
| `LR + .`     	| Telescope file finder (ignores files listed in `.gitignore`                      	|
| `LR + f + g` 	| Telescope Live-Grep (search in all files listed in current directory for a term) 	|
| `LR + f + b` 	| Telescope buffer switcher                                                        	|
| `LR + f + c` 	| Telescope colorscheme switcher                                                   	|
| `LR + f + o` 	| Telescope recent edited files                                                    	|


### CMP (Auto-Completion plugin)

This keymaps used in auto-completion menu that `CMP` plugin provides.

| Keymap        	| Actoin                                 	|
|---------------	|----------------------------------------	|
| `TAB`         	| Next entry in auto-completion menu     	|
| `Shift + TAB` 	| Previous entry in auto-completion menu 	|
| `ctrl + d`    	| Scroll down in docs                    	|
| `ctrl + u`    	| Scroll up in docs                      	|


### LSP (Lauguage Server)

| Keymap      	| Actoin                                              	|
|-------------	|-----------------------------------------------------	|
| `g + l`     	| Show diagnostics messege                            	|
| `g + L`     	| Show all diagnostics messeges in a file with a list 	|
| `g + d`     	| Go to definition                                    	|
| `g + D`     	| Go to declaration                                   	|
| `g + r`     	| List of refrences                                   	|
| `Shift + k` 	| Hover (info about term/word under cursor)           	|
| `LR + x + x`  | Show a list of all diagnostics in a file              |
| `LR + x + X`  | Show a list of all diagnostics in a project directory |


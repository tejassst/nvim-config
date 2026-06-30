# Neovim Cheatsheet

## What is the Leader Key?

The **leader key** is a prefix key that triggers custom shortcuts. In this config it is `Space`.

When you see `<leader>x` it means: press `Space`, then `x`.

Neovim waits 500ms (set by `timeoutlen`) after you press Space before giving up. You do not hold Space — just tap it, then press the next key.

---

## Modes

Neovim is modal. Every key does something different depending on which mode you are in.

| Mode | How to enter | What it is |
|------|-------------|------------|
| Normal | `Esc` from anywhere | Default mode. Navigate and run commands. |
| Insert | `i`, `a`, `o`, etc. | Type text like a regular editor. |
| Visual | `v` | Select characters. |
| Visual Line | `V` | Select whole lines. |
| Visual Block | `Ctrl+v` | Select a rectangular block. |
| Command | `:` | Run ex commands like `:w`, `:q`. |
| Terminal | `<leader>t` then you are in shell | Interact with a terminal. |

The status line at the bottom shows your current mode.

---

## Basic Navigation (Normal Mode)

### Character movement
| Key | Action |
|-----|--------|
| `h` | Left |
| `j` | Down |
| `k` | Up |
| `l` | Right |

You can prefix any of these with a number: `5j` moves down 5 lines. The relative line numbers on the left are there for exactly this — you can see "that line is 7 away" and type `7j`.

### Word movement
| Key | Action |
|-----|--------|
| `w` | Forward to start of next word |
| `b` | Backward to start of previous word |
| `e` | Forward to end of current word |
| `W` / `B` / `E` | Same but treat punctuation as part of the word |

### Line movement
| Key | Action |
|-----|--------|
| `0` | Start of line |
| `^` | First non-blank character of line |
| `$` | End of line |
| `f{char}` | Jump to next occurrence of `char` on this line |
| `t{char}` | Jump to just before next occurrence of `char` |
| `F{char}` / `T{char}` | Same but backwards |
| `;` | Repeat last `f/t/F/T` |
| `,` | Repeat last `f/t/F/T` in reverse |

### File movement
| Key | Action |
|-----|--------|
| `gg` | Top of file |
| `G` | Bottom of file |
| `{number}G` | Go to line number (e.g. `42G`) |
| `Ctrl+d` | Half page down (centered) |
| `Ctrl+u` | Half page up (centered) |
| `Ctrl+f` | Full page down |
| `Ctrl+b` | Full page up |
| `H` | Top of visible screen |
| `M` | Middle of visible screen |
| `L` | Bottom of visible screen |
| `zz` | Center screen on cursor |
| `zt` | Scroll so cursor is at top |
| `zb` | Scroll so cursor is at bottom |

### Jumping
| Key | Action |
|-----|--------|
| `%` | Jump to matching bracket/paren |
| `''` (two single quotes) | Jump back to where you last jumped from |
| `Ctrl+o` | Jump to previous location in jump list |
| `Ctrl+i` | Jump to next location in jump list |
| `gd` | Go to local definition |

---

## Entering Insert Mode

| Key | Action |
|-----|--------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `I` | Insert at beginning of line |
| `A` | Insert at end of line |
| `o` | Open new line below and insert |
| `O` | Open new line above and insert |
| `s` | Delete character under cursor and insert |
| `S` | Delete entire line and insert |
| `C` | Delete from cursor to end of line and insert |
| `Esc` or `Ctrl+c` | Return to Normal mode |

---

## Editing in Normal Mode

### Operators
Operators work on **motions** or **text objects**. Format: `operator + motion`.

| Operator | Meaning |
|----------|---------|
| `d` | Delete (cuts to clipboard) |
| `y` | Yank (copy) |
| `c` | Change (delete and enter insert mode) |
| `>` | Indent right |
| `<` | Indent left |
| `=` | Auto-indent |
| `gu` | Lowercase |
| `gU` | Uppercase |

Examples:
- `dw` — delete a word
- `d$` — delete to end of line
- `dd` — delete entire line
- `yy` — yank entire line
- `cc` — change entire line
- `ciw` — change inner word (delete word and enter insert mode)
- `di"` — delete inside quotes
- `da(` — delete around parentheses (including the parens)

### Text objects
Text objects are used after an operator. `i` means "inner", `a` means "around" (includes the delimiter).

| Object | Selects |
|--------|---------|
| `iw` / `aw` | inner / around word |
| `is` / `as` | inner / around sentence |
| `ip` / `ap` | inner / around paragraph |
| `i"` / `a"` | inside / around double quotes |
| `i'` / `a'` | inside / around single quotes |
| `i(` / `a(` | inside / around parentheses |
| `i[` / `a[` | inside / around brackets |
| `i{` / `a{` | inside / around braces |
| `it` / `at` | inside / around HTML tag |

### Paste and undo
| Key | Action |
|-----|--------|
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `.` | Repeat last change |

### Registers
Every yank/delete goes into a register. The default (`"`) is the unnamed register. The system clipboard is `+`.

This config sets `clipboard=unnamedplus` so yanks automatically go to the system clipboard.

| Key | Action |
|-----|--------|
| `"+y` | Explicitly yank to system clipboard |
| `"+p` | Paste from system clipboard |
| `"0p` | Paste from yank register (what you last `y`'d, ignoring deletes) |

---

## Visual Mode

Enter with `v` (character), `V` (line), or `Ctrl+v` (block).

| Key | Action |
|-----|--------|
| `y` | Yank selection |
| `d` | Delete selection |
| `c` | Change selection |
| `>` / `<` | Indent right / left (stays in visual mode — custom) |
| `Alt+j` / `Alt+k` | Move selection down / up |
| `<leader>p` | Paste over selection without overwriting clipboard |

---

## Search and Replace

| Key / Command | Action |
|---------------|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` / `N` | Next / previous match (centered on screen) |
| `*` | Search for word under cursor (forward) |
| `#` | Search for word under cursor (backward) |
| `<leader>c` | Clear search highlights |
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace all with confirmation |
| `:s/old/new/g` | Replace all on current line |

---

## Command Mode

Enter with `:`.

| Command | Action |
|---------|--------|
| `:w` | Save |
| `:q` | Quit |
| `:wq` or `:x` | Save and quit |
| `:q!` | Quit without saving |
| `:wqa` | Save and quit all windows |
| `:e filename` | Open a file |
| `:bn` / `:bp` | Next / previous buffer |
| `:bd` | Close buffer |
| `:vs` | Vertical split |
| `:sp` | Horizontal split |
| `:term` | Open a terminal |
| `:noh` | Clear search highlights |
| `:Mason` | Open Mason (install LSP servers) |
| `:TSInstall {lang}` | Install a tree-sitter parser |
| `:LspInfo` | Show LSP status for current buffer |
| `:checkhealth` | Diagnose Neovim and plugin issues |

---

## Windows and Splits

| Key | Action |
|-----|--------|
| `<leader>sv` | Vertical split |
| `<leader>sh` | Horizontal split |
| `Ctrl+h` | Move to left window |
| `Ctrl+j` | Move to window below |
| `Ctrl+k` | Move to window above |
| `Ctrl+l` | Move to right window |
| `Ctrl+Arrow` | Resize splits |
| `:only` | Close all splits except current |

`Ctrl+hjkl` also navigates across tmux panes seamlessly.

---

## Buffers

A buffer is an open file. It does not have to be visible.

| Key | Action |
|-----|--------|
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>fb` | Pick buffer with fzf |

---

## File Tree (nvim-tree)

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file tree |

Inside the tree:
| Key | Action |
|-----|--------|
| `Enter` or `o` | Open file |
| `v` | Open in vertical split |
| `s` | Open in horizontal split |
| `a` | Create file or directory (end name with `/` for dir) |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |
| `R` | Refresh |
| `H` | Toggle hidden files |
| `q` | Close tree |

---

## Fuzzy Finding (fzf-lua)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files in project |
| `<leader>fg` | Live grep (search file contents) |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |
| `<leader>fx` | Diagnostics in current file |
| `<leader>fX` | Diagnostics in workspace |
| `<leader>fr` | LSP references |
| `<leader>ft` | LSP type definitions |
| `<leader>fs` | LSP document symbols |
| `<leader>fw` | LSP workspace symbols |
| `<leader>fi` | LSP implementations |

Inside any fzf window: type to filter, `Ctrl+j/k` to move, `Enter` to open, `Esc` to close.

---

## LSP (Language Intelligence)

These activate when you open a supported file type and an LSP server is running.

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `<leader>gd` | Go to definition (fzf picker) |
| `<leader>gD` | Go to definition (jump directly) |
| `<leader>gS` | Go to definition in a vertical split |
| `<leader>rn` | Rename symbol across project |
| `<leader>ca` | Code actions (fixes, refactors) |
| `<leader>oi` | Organize imports and format |

### Diagnostics (errors and warnings)
| Key | Action |
|-----|--------|
| `<leader>d` | Show diagnostic at cursor |
| `<leader>D` | Show all diagnostics on line |
| `<leader>nd` | Jump to next diagnostic |
| `<leader>pd` | Jump to previous diagnostic |
| `<leader>q` | Open diagnostic list (quickfix) |
| `<leader>td` | Toggle diagnostics on/off |

Install LSP servers with `:Mason`. Configured servers: `lua_ls`, `pyright`, `ts_ls`, `gopls`, `clangd`, `bashls`.

---

## Git (mini.diff + mini.git)

Changes are shown in the sign column as `▎` marks.

| Key | Action |
|-----|--------|
| `]h` | Jump to next hunk |
| `[h` | Jump to previous hunk |
| `<leader>hp` | Toggle diff overlay (shows old vs new inline) |
| `<leader>hs` | Stage hunk under cursor |
| `<leader>hb` | Show git blame / commit at cursor |

---

## Floating Terminal

| Key | Action |
|-----|--------|
| `<leader>t` | Open / close floating terminal |
| `Esc` (in terminal) | Switch to Normal mode inside terminal |
| `Ctrl+q` (in terminal) | Close the terminal |

The terminal persists its session — closing and reopening it brings back the same shell.

---

## Completion (blink.cmp)

Completion shows automatically as you type (except in markdown).

| Key | Action |
|-----|--------|
| `Ctrl+Space` | Manually show or hide completion menu |
| `Ctrl+j` | Select next item |
| `Ctrl+k` | Select previous item |
| `Enter` | Accept selected item |
| `Tab` / `Shift+Tab` | Move forward / backward through snippet placeholders |

---

## Editing Utilities

### Moving lines
| Key | Action |
|-----|--------|
| `Alt+j` | Move line/selection down |
| `Alt+k` | Move line/selection up |

### Joining lines
| Key | Action |
|-----|--------|
| `J` | Join line below onto current line (cursor stays put) |

### Surround (mini.surround)
| Key | Action |
|-----|--------|
| `sa{motion}{char}` | Add surrounding — e.g. `saiw"` wraps word in `"` |
| `sd{char}` | Delete surrounding — e.g. `sd"` removes surrounding quotes |
| `sr{old}{new}` | Replace surrounding — e.g. `sr'"` changes `'` to `"` |

### Comments (mini.comment)
| Key | Action |
|-----|--------|
| `gcc` | Toggle comment on current line |
| `gc{motion}` | Toggle comment on motion — e.g. `gcip` comments a paragraph |

### Auto-pairs (mini.pairs)
Brackets, quotes, and parens are automatically closed when you open them in insert mode.

---

## Folding

Folds are powered by tree-sitter and start open (`foldlevel=99`).

| Key | Action |
|-----|--------|
| `za` | Toggle fold under cursor |
| `zo` | Open fold |
| `zc` | Close fold |
| `zR` | Open all folds |
| `zM` | Close all folds |

---

## Misc Keymaps

| Key | Action |
|-----|--------|
| `<leader>pa` | Copy full file path to clipboard and print it |
| `<leader>x` | Delete without yanking (does not touch clipboard) |
| `<leader>p` (visual) | Paste over selection without overwriting clipboard |

---

## Notes (Obsidian) — requires `~/Documents/Notes` to exist

| Key | Action |
|-----|--------|
| `<leader>nn` | New note |
| `<leader>nf` | Find note (fuzzy) |
| `<leader>ns` | Search note contents |
| `<leader>nt` | Open today's daily note |
| `<leader>nw` | Switch workspace |

Create the directory first: `mkdir -p ~/Documents/Notes`

---

## Tips

- **Repeat** — `.` repeats the last change. Get in the habit of making changes that are repeatable.
- **Counts** — almost every command accepts a count prefix: `3dd` deletes 3 lines, `5w` moves 5 words.
- **Undo is persistent** — even after closing Neovim, `u` can undo previous sessions.
- **System clipboard** — this config syncs the unnamed register with the system clipboard, so `y`/`p` work with other apps.
- **Format on save** — files are auto-formatted on save when an LSP formatter is running.
- **`:checkhealth`** — run this if something seems broken. It reports missing dependencies.

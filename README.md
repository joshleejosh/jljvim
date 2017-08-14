# joshleejosh's vim things

## Installation

Install this repo as a <a href="https://github.com/tpope/vim-pathogen">pathogen</a> bundle.

In `~/.vimrc` and `~/.gvimrc`, source the vimrc and gvimrc in this directory.

## Plugins

### jlj\_outlining

Sets up folding, indentation, etc. in the local buffer for editing a bullet list as an outline.

### sucktmpl

Quick and dirty snippets. The key mapping `;tt` will replace the current word with the template of that name if it exists.

Key mapping `;tl` will list available templates.

Templates files go under `sucktmpl_templates`, one file per template. A `«Ω»` marker in the file indicates where the cursor will end up after the template is pasted in.


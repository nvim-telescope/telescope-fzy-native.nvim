# telescope-fzy-native.nvim

FZY style sorter that is compiled

## Installation

It is possible that you will already have a compiled binary matching your system. You can find out information
about compiling the binary at the implementation repo: https://github.com/romgrk/fzy-lua-native

You can install this with your favorite package manager. Make sure that it installs git submodules if stuff isn't working!

## Usage

You can override the file & generic sorter by default simply by adding

```lua
require('telescope').load_extension('fzy_native')
```

somewhere after your `require('telescope').setup()` call.

To configure them individually, you should do the following:

```lua
require('telescope').setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
```

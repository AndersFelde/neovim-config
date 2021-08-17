## Setup

### Install packer

```bash
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Install and update plugins

```vim
:PackerSync
```

### Install external formatters (optional)

-   [Black](https://github.com/psf/black) _Python_
-   [Luafmt](https://github.com/CurtisFenner/luafmt) _Lua_
-   [html-beautify](https://aur.archlinux.org/packages/js-beautify/) _HTML_
-   [Prettier](https://prettier.io/) _javascript, markdown, json_
-   [clang-format](https://clang.llvm.org/docs/ClangFormat.html) _c, cpp_
-   [sed](https://archlinux.org/packages/core/x86_64/sed/) _Remove trailing spaces_

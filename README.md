# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# 1. 装 neovim 和必要依赖(git, ripgrep, fd, nodejs, gcc...)
# 2. 拉配置
  git clone git@github.com:casper1990s/nvim-config.git ~/.config/nvim
# 3. 恢复插件(不用联网下载!)
mkdir -p ~/.local/share
  curl -L https://github.com/casper1990s/nvim-config/releases/download/backup/nvim-plugins.tar.gz \
    | tar xz -C ~/.local/share
# 4. 启动 nvim,插件已就位
  nvim

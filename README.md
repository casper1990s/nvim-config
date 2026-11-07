# 💤 LazyVim

基于 [LazyVim](https://www.lazyvim.org/) 的个人 Neovim  starter 配置。参考 [LazyVim 文档](https://www.lazyvim.org/) 开始使用。

## 安装步骤

### 1. 安装 Neovim 及必要依赖

需要 `git`、`ripgrep`、`fd`、`nodejs`、`gcc` 等：

```bash
sudo pacman -S neovim git ripgrep fd nodejs gcc
```

### 2. 拉取配置

```bash
git clone git@github.com:casper1990s/nvim-config.git ~/.config/nvim
```

### 3. 恢复插件（无需联网下载）

```bash
mkdir -p ~/.local/share
curl -L https://github.com/casper1990s/nvim-config/releases/download/backup/nvim-plugins.tar.gz   | tar xz -C ~/.local/share
```

### 4. 启动 Neovim

```bash
nvim
```

插件已就位，首次启动会自动完成加载。

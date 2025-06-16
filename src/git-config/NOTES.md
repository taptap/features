## 功能特性

这个 feature 为已安装的 Git (>=2.48.0) 配置组织级的标准设置：

- ✅ 自动检测系统中符合版本要求的 Git
- 📝 配置标准化的系统级 gitconfig
- 🚫 设置统一的 gitignore 规则
- 🔧 确保正确版本的 Git 在 PATH 中优先

## 前置要求

⚠️ **重要**：此 feature 不负责安装 Git，需要确保系统中已经安装了 Git >= 2.48.0

推荐使用官方 Git feature 先安装 Git：
```json
"features": {
  "ghcr.io/devcontainers/features/git:1": {
    "version": "latest",
    "ppa": true
  },
  "ghcr.io/taptap/features/git-config:2": {}
}
```

## 预设的 Git 配置

### 核心设置
- `core.autocrlf = false` - 禁用自动 CRLF 转换
- `core.safecrlf = true` - 开启 CRLF 安全检查
- `core.eol = lf` - 统一使用 LF 换行符
- `core.filemode = false` - 忽略文件权限变化

### 默认行为
- `init.defaultBranch = main` - 默认分支名
- `push.default = simple` - 推送策略
- `fetch.prune = true` - 自动清理远程分支
- `merge.conflictStyle = diff3` - 冲突显示格式

### 性能优化
- `fetch.parallel = 4` - 并行获取
- `gc.auto = 256` - 自动垃圾回收阈值
- `gc.writeCommitGraph = true` - 启用提交图

## 系统级 gitignore

自动配置的忽略规则包括：
- 操作系统文件（.DS_Store、Thumbs.db 等）
- 编辑器配置（.vscode/、.idea/ 等）
- 临时文件和备份（*.tmp、*.bak 等）

## OS Support

此 feature 支持所有包含 Git >= 2.48.0 的操作系统，包括但不限于：
- Ubuntu (需要通过 PPA 安装最新版 Git)
- Debian (需要安装合适版本的 Git)
- RedHat Enterprise Linux、Fedora、Rocky Linux、AlmaLinux
- Alpine Linux (需要先安装 Git)

## 工作原理

1. 扫描 PATH 中的所有 git 可执行文件
2. 找到版本 >= 2.48.0 的 Git
3. 调整 PATH 确保正确版本的 Git 优先
4. 应用组织级的 Git 配置
# PasarGuard UI 定制发现记录

## 初始范围
- 目标仅涉及 sidebar/footer 等前端展示层，不碰后端逻辑。
- 用户新增长期约定：每次补丁修改都要提交 Git，并推送到 GitHub；仓库需维护 changelog 与补丁文档。

## 新发现
- 当前环境已具备 `gh` CLI，且 `GITHUB_TOKEN` 已可用。
- 当前 `gh auth status` 显示已登录，可直接创建与推送仓库。
- 目标仓库名 `pasarguard-panel-ui-patches` 当前未占用。
- 首版补丁已按可复用 `git diff` 形式落盘。
- PasarGuard 非 debug 模式下若 `dashboard/build` 不存在，会在应用启动时尝试调用 `bun` 构建前端；生产自定义镜像更稳妥的做法仍是预先 `docker build` 出完整镜像。
- 当前远端 `digitalocean-sg` 上 PasarGuard 以 `docker compose` 运行，切换镜像只需更新 compose 中 `pasarguard` 服务的 image 字段并重启该服务。
- 实际部署验证发现：仅构建 Python 镜像而未把 `dashboard/build` 预构建进镜像，会导致容器启动时尝试执行 `bun`，进而因为运行时镜像无 `bun` 而启动失败。
- 因此正确生产流程应为：先在源码树中完成 dashboard 前端构建，再执行 Docker BuildKit 镜像构建。
- 当前还需额外防止 `community` 数组为空时仍渲染空标题；仅把项目列表置空并不足以完全隐藏该区块。

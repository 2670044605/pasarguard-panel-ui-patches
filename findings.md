# PasarGuard UI 定制发现记录

## 初始范围
- 目标仅涉及 sidebar/footer 等前端展示层，不碰后端逻辑。
- 用户新增长期约定：每次补丁修改都要提交 Git，并推送到 GitHub；仓库需维护 changelog 与补丁文档。

## 新发现
- 当前环境已具备 `gh` CLI，且 `GITHUB_TOKEN` 已可用。
- 当前 `gh auth status` 显示已登录，可直接创建与推送仓库。
- 目标仓库名 `pasarguard-panel-ui-patches` 当前未占用。
- 首版补丁已按可复用 `git diff` 形式落盘。

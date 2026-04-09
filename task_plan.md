# PasarGuard UI 定制任务计划

## 目标
建立一个可长期维护的 PasarGuard 面板最小 UI 定制仓库，默认具备：
- 最小前端补丁
- 补丁文档
- changelog
- Git 版本记录
- 推送到 GitHub 的能力
- 可复用的生产部署流程

## 阶段
- [complete] 阶段 1：确认 Git/GitHub 推送条件与仓库命名策略
- [complete] 阶段 2：建立项目目录、规划文件与仓库骨架
- [complete] 阶段 3：生成最小 UI 补丁与文档
- [complete] 阶段 4：初始化 Git、提交首版记录
- [complete] 阶段 5：创建 GitHub 仓库并推送
- [complete] 阶段 6：输出后续维护约定
- [complete] 阶段 7：构建自定义镜像并部署到 `digitalocean-sg`

## 当前决定
- 使用独立子项目目录，避免污染已有 PasarGuard 运维文件。
- 默认把补丁、文档、changelog 与构建说明都纳入同一仓库。
- 目标仓库名：`pasarguard-panel-ui-patches`。
- 远端仓库：`https://github.com/2670044605/pasarguard-panel-ui-patches`
- 当前生产镜像：`local/pasarguard-panel-ui:3d749e0-jl1`

## 关键结论
- 上游 Dockerfile 构建需要 BuildKit。
- 生产镜像必须先预构建 `dashboard/build`，否则容器启动时会因为缺少 `bun` 失败。
- 当前最小 UI 定制已在生产验证通过。

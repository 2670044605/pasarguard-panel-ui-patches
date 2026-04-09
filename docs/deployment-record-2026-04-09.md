# PasarGuard UI 定制部署记录（2026-04-09）

## 结果
已在 `digitalocean-sg` 成功上线自定义 PasarGuard 面板镜像：
- 镜像：`local/pasarguard-panel-ui:3d749e0-jl1`
- 服务目录：`/opt/pasarguard`
- 域名：`https://pasarguard.jerrylabs.dev/dashboard/`

## 实际执行摘要
1. 固定上游源码到 `3d749e0`（对应观察到的 `v2.2.0`）。
2. 应用 `0001-minimal-ui-debranding.patch`。
3. 首次上线失败，原因是镜像内未预构建 `dashboard/build`，运行时镜像缺少 `bun`。
4. 已立即回滚到 `pasarguard/panel:latest` 恢复服务。
5. 修正流程为：先 `bun install` + `./build_dashboard.sh` 预构建前端，再用 BuildKit 构建镜像。
6. 二次上线成功，PasarGuard 正常启动并连回 `US-1` / `HK-1` / `HK-2`。

## 线上验证
- `docker compose ps`：`pasarguard` 为 `Up`
- 容器日志：应用启动完成，节点连接成功
- 浏览器验证：页面正常打开，左侧引流区已去除，底部署名已隐藏

## 当前生效定制
- 去掉 sidebar 的社区/文档/讨论组/GitHub/支持我们/Star
- 隐藏 footer `Made with ❤️ by PasarGuard Team`

## 回滚方式
将 `/opt/pasarguard/docker-compose.yml` 中：
- `local/pasarguard-panel-ui:3d749e0-jl1`
改回：
- `pasarguard/panel:latest`

然后执行：
```bash
cd /opt/pasarguard
docker compose up -d pasarguard
```

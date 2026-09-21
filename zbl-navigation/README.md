# DualNav

面向长时序具身任务的大小脑端到端导航模型项目主页。页面聚焦 Pixel Goal、大小脑协同、多任务路由、Token 缓存、Depth 与 DAgger；ReAct Agent 仅作为技术起点与方案演进背景。

## 本地预览

在 `lifeline` 根目录启动已有服务：

```bash
node server.js
```

访问：

```text
http://localhost:8766/showcase/zbl-navigation/
```

## 发布到 GitHub Pages

图片与视频必须提交进本仓库 `zbl-navigation/assets/`（不要用仓库外或 `../assets/` 相对路径），否则 Pages 无法加载。

统一仓库地址形如：

```text
https://evan-li-max.github.io/embodied-showcase/zbl-navigation/
```

## 媒体建议

- 架构图优先使用 SVG；目前页面内的图为可编辑 HTML/CSS 示意图。
- 短视频可放在 `assets/`，单个建议控制在 10–20MB。
- 完整视频建议使用 Bilibili、YouTube 或对象存储，再嵌入页面。
- 图片优先使用 WebP，视频建议使用 H.264 MP4。

## 演示模式

右上角点击“演示模式”后，各章节按整屏组织。电脑端可使用方向键或 PageUp/PageDown 切换章节，按 Esc 退出。

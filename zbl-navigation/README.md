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

可以将整个 `showcase` 作为统一展示仓库，也可以只复制本目录作为独立仓库。若作为统一仓库，页面地址形如：

```text
https://<用户名>.github.io/<仓库名>/zbl-navigation/
```

在 GitHub 仓库的 Settings → Pages 中选择对应发布分支即可。

## 发布前必须替换

1. `index.html` 中的完整 Demo 视频占位。
2. 四个短 Demo 的文件名或外部视频嵌入。
3. 主结果、消融实验、工程性能中的“待填写”。
4. 工作范围与个人贡献边界。
5. 京东经历的数据质量规则、延时分解图和真机对比视频。
6. 知而行经历的 HMSG 截图、Top-K 对比、Corner Case 和轨迹视频。
7. 所有公司内部名称、架构、指标和画面的脱敏及授权检查。

## 媒体建议

- 架构图优先使用 SVG；目前页面内的图为可编辑 HTML/CSS 示意图。
- 短视频可放在 `assets/`，单个建议控制在 10–20MB。
- 完整视频建议使用 Bilibili、YouTube 或对象存储，再嵌入页面。
- 图片优先使用 WebP，视频建议使用 H.264 MP4。

## 演示模式

右上角点击“演示模式”后，各章节按整屏组织。电脑端可使用方向键或 PageUp/PageDown 切换章节，按 Esc 退出。

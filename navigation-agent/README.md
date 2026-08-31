# HomeClean Agent

面向全屋捡垃圾任务的具身导航 Agent 独立项目页。页面只讲 Agent 的任务动机、工具编排、分层记忆、主动探索、检测方案与真机失败复盘。

## 本地预览

在仓库根目录运行 `node server.js`，访问：

`http://localhost:8766/showcase/navigation-agent/`

## 素材放置建议

- 完整 300MB 视频不要直接提交。剪出 45–90 秒、720p/1080p 的网页版本，建议控制在 15–30MB。
- 单个失败案例剪成 10–20 秒短片，尽量控制在 3–8MB。
- 完整版上传到 Bilibili、YouTube 或对象存储，在页面中放链接。
- 首屏和技术决策优先使用 WebP 图片；检测对比、深度补全、Mask 结果适合使用三联图。
- 视频建议使用 H.264 MP4，并设置 `poster`，不要启用自动播放。

项目已附带压缩和倍速工具：

```bash
# 默认：720p、CRF 27、保留原速度和声音
./showcase/navigation-agent/tools/video-web.sh input.mp4

# 2 倍速并静音，指定输出路径
./showcase/navigation-agent/tools/video-web.sh input.mp4 demo-web.mp4 --speed 2 --mute

# 更清晰的 1080p 版本；CRF 越小画质越高、文件越大
./showcase/navigation-agent/tools/video-web.sh input.mp4 demo-1080p.mp4 --height 1080 --crf 24
```

工具不会覆盖原文件。未指定输出路径时，会在原视频旁生成 `原名-web-倍速x.mp4`；输出使用 H.264、AAC 和 Fast Start，可直接用于网页 `<video>`。

## 发布前替换

1. 项目名称、实习时间、团队背景和个人责任边界。
2. 完整 Demo、检测对比、Pose 记忆、深度补全和失败案例素材。
3. 所有“待替换/建议证据”中的真实指标。
4. 未实际完成的 Coding Agent 内容应保留为“下一步”，不要写入已完成贡献。
5. 检查公司名称、室内画面、代码、日志、模型和数据是否允许公开。

#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "用法: $0 输入视频 [输出视频] [--speed 倍速] [--height 高度] [--crf 质量] [--mute]"
  echo "示例: $0 demo.mov demo-web.mp4 --speed 2 --height 720 --crf 27 --mute"
}

if [[ $# -lt 1 || "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

input=$1
shift

if [[ ! -f "$input" ]]; then
  echo "错误：找不到输入视频：$input" >&2
  exit 1
fi

output=""
if [[ $# -gt 0 && "${1:0:1}" != "-" ]]; then
  output=$1
  shift
fi

speed="1"
height="720"
crf="27"
mute="false"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --speed)
      speed=${2:?--speed 需要一个数字}
      shift 2
      ;;
    --height)
      height=${2:?--height 需要一个像素高度}
      shift 2
      ;;
    --crf)
      crf=${2:?--crf 需要一个 0-51 的数字}
      shift 2
      ;;
    --mute)
      mute="true"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "错误：未知参数 $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if ! [[ "$speed" =~ ^([0-9]+([.][0-9]+)?|[.][0-9]+)$ ]] || [[ "$speed" == "0" ]]; then
  echo "错误：倍速必须是大于 0 的数字" >&2
  exit 1
fi
if ! [[ "$height" =~ ^[0-9]+$ ]] || (( height < 144 )); then
  echo "错误：高度必须是大于等于 144 的整数" >&2
  exit 1
fi
if ! [[ "$crf" =~ ^[0-9]+$ ]] || (( crf < 0 || crf > 51 )); then
  echo "错误：CRF 必须在 0 到 51 之间" >&2
  exit 1
fi

if [[ -z "$output" ]]; then
  directory=$(dirname "$input")
  filename=$(basename "$input")
  stem=${filename%.*}
  speed_label=${speed//./_}
  output="$directory/${stem}-web-${speed_label}x.mp4"
fi

if [[ "$input" == "$output" ]]; then
  echo "错误：输出路径不能与输入路径相同" >&2
  exit 1
fi

video_filter="scale=-2:'min(${height},ih)':flags=lanczos,setpts=PTS/${speed},format=yuv420p"
audio_args=(-c:a aac -b:a 96k -af "atempo=${speed}")
if [[ "$mute" == "true" ]]; then
  audio_args=(-an)
fi

echo "输入：$input"
echo "输出：$output"
echo "设置：${speed}x，最高 ${height}p，CRF ${crf}，静音 ${mute}"

ffmpeg -hide_banner -i "$input" \
  -map 0:v:0 -map '0:a:0?' \
  -vf "$video_filter" \
  -c:v libx264 -preset slow -crf "$crf" \
  -profile:v high -level 4.1 \
  "${audio_args[@]}" \
  -movflags +faststart \
  "$output"

input_size=$(stat -c %s "$input")
output_size=$(stat -c %s "$output")
ratio=$(awk -v before="$input_size" -v after="$output_size" 'BEGIN { printf "%.1f", (1-after/before)*100 }')
echo "完成：$(du -h "$output" | cut -f1)，体积变化 ${ratio}%"

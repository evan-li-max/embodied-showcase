'use strict';
const toast=document.getElementById('toast');
function say(text){if(!toast)return;toast.textContent=text;toast.classList.add('show');setTimeout(()=>toast.classList.remove('show'),2200)}
document.addEventListener('click',event=>{
  const el=event.target.closest('[data-action]');
  if(el?.dataset.action==='video-hint')say('将主 Demo 上传到视频平台或 assets 后，在这里替换播放器');
});
document.getElementById('presentBtn').addEventListener('click',()=>{
  document.body.classList.toggle('present');
  document.getElementById('presentBtn').textContent=document.body.classList.contains('present')?'退出演示':'演示模式';
  if(document.body.classList.contains('present'))document.querySelector('.hero').scrollIntoView({behavior:'smooth'});
});
document.addEventListener('keydown',event=>{
  if(!document.body.classList.contains('present'))return;
  const chapters=[...document.querySelectorAll('.chapter')];
  const current=chapters.reduce((best,x)=>Math.abs(x.getBoundingClientRect().top)<Math.abs(best.getBoundingClientRect().top)?x:best,chapters[0]);
  const index=chapters.indexOf(current);
  if(['ArrowDown','ArrowRight','PageDown'].includes(event.key)){event.preventDefault();chapters[Math.min(chapters.length-1,index+1)].scrollIntoView({behavior:'smooth'})}
  if(['ArrowUp','ArrowLeft','PageUp'].includes(event.key)){event.preventDefault();chapters[Math.max(0,index-1)].scrollIntoView({behavior:'smooth'})}
  if(event.key==='Escape'){document.body.classList.remove('present');document.getElementById('presentBtn').textContent='演示模式'}
});

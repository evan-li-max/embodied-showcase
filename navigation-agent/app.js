'use strict';
const toast=document.getElementById('toast');
const presentBtn=document.getElementById('presentBtn');
function say(message){toast.textContent=message;toast.classList.add('show');setTimeout(()=>toast.classList.remove('show'),2600)}
document.addEventListener('click',event=>{
  if(event.target.closest('[data-action="media"]'))say('这里可替换为压缩后的短版 MP4/WebM，完整版建议使用外链');
});
presentBtn.addEventListener('click',()=>{
  document.body.classList.toggle('present');
  presentBtn.textContent=document.body.classList.contains('present')?'退出演示':'演示模式';
  if(document.body.classList.contains('present'))document.querySelector('.hero').scrollIntoView({behavior:'smooth'});
});
document.addEventListener('keydown',event=>{
  if(!document.body.classList.contains('present'))return;
  const chapters=[...document.querySelectorAll('.chapter')];
  const current=chapters.reduce((best,item)=>Math.abs(item.getBoundingClientRect().top)<Math.abs(best.getBoundingClientRect().top)?item:best,chapters[0]);
  const index=chapters.indexOf(current);
  if(['ArrowDown','ArrowRight','PageDown'].includes(event.key)){event.preventDefault();chapters[Math.min(chapters.length-1,index+1)].scrollIntoView({behavior:'smooth'})}
  if(['ArrowUp','ArrowLeft','PageUp'].includes(event.key)){event.preventDefault();chapters[Math.max(0,index-1)].scrollIntoView({behavior:'smooth'})}
  if(event.key==='Escape'){document.body.classList.remove('present');presentBtn.textContent='演示模式'}
});

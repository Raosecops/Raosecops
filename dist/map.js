(()=>{
const R=[[[19,28]],[[10,18],[19,29],[40,58]],[[8,19],[20,29],[33,62]],[[3,8],[8,20],[21,27],[32,63]],[[3,7],[8,21],[32,36],[36,64]],[[8,21],[31,32],[33,37],[37,62]],[[8,21],[31,32],[33,40],[40,62]],[[9,21],[31,40],[40,60]],[[9,20],[32,41],[41,56],[58,59]],[[9,20],[31,40],[40,58],[58,59]],[[10,19],[31,40],[40,57],[57,58]],[[10,18],[30,38],[38,43],[43,56]],[[10,16],[30,43],[44,56]],[[11,16],[17,18],[30,43],[44,48],[49,54]],[[12,16],[29,40],[44,47],[49,54]],[[14,16],[29,40],[45,47],[50,54],[56,57]],[[18,23],[29,40],[50,53]],[[18,21],[31,40],[49,51],[53,55]],[[17,27],[33,41],[49,56]],[[17,28],[34,41],[50,60]],[[18,28],[34,41],[51,56],[57,61]],[[18,26],[35,41],[57,60]],[[18,26],[35,41],[41,42],[53,59]],[[18,25],[34,40],[41,42],[52,60]],[[18,24],[34,39],[52,60]],[[19,24],[34,38],[52,60]],[[19,23],[35,38],[53,59]],[[19,22],[55,58],[61,62]],[[19,22],[56,57],[61,62]],[[19,21]],[[19,21]],[[19,20]]];
const P=[['New York',-74,40.7],['San Francisco',-122.4,37.8],['São Paulo',-46.6,-23.5],['London',-.1,51.5],['Frankfurt',8.7,50.1],['Lagos',3.4,6.5],['Cairo',31.2,30],['Mumbai',72.9,19],['Singapore',103.8,1.3],['Tokyo',139.7,35.7],['Sydney',151.2,-33.9],['Istanbul',29,41],['Johannesburg',28,-26.2],['Toronto',-79.4,43.7],['Seoul',127,37.5],['Dubai',55.3,25.2]];
const T=['SSH login guessing','Web app scan','Port scan','Password guessing','SQL injection attempt','Bot traffic'];
const cv=document.getElementById('map'),cx=cv.getContext('2d'),feed=document.getElementById('feed'),nEl=document.getElementById('n');
const reduce=matchMedia('(prefers-reduced-motion: reduce)').matches;
let W,H,cell,dpr,base,arcs=[],rings=[],last=0,spawn=0,count=0,running=false;
const pt=p=>[(p[1]+180)/5.625*cell,(80-p[2])/4.4*cell];
function size(){
  dpr=Math.min(devicePixelRatio||1,2);W=cv.clientWidth;if(!W)return;cell=W/64;H=cell*32;
  cv.width=W*dpr;cv.height=H*dpr;cx.setTransform(dpr,0,0,dpr,0,0);
  base=document.createElement('canvas');base.width=W*dpr;base.height=H*dpr;
  const b=base.getContext('2d');b.setTransform(dpr,0,0,dpr,0,0);
  R.forEach((row,r)=>{for(let c=0;c<64;c++){const on=row.some(([a,z])=>c>=a&&c<z);b.fillStyle=on?'rgba(146,163,184,.55)':'rgba(146,163,184,.09)';b.beginPath();b.arc((c+.5)*cell,(r+.5)*cell,cell*(on?.3:.12),0,6.3);b.fill();}});
  b.fillStyle='#7dd3fc';P.forEach(p=>{const[x,y]=pt(p);b.beginPath();b.arc(x,y,2,0,6.3);b.fill();});
}
function mk(){const a=P[Math.random()*P.length|0];let b;do b=P[Math.random()*P.length|0];while(b===a);return{a,b,t:0,d:1600+Math.random()*1200,k:T[Math.random()*T.length|0]};}
function arcPt(s,e,t){const u=1-t,mx=(s[0]+e[0])/2,my=Math.min(s[1],e[1])-Math.hypot(e[0]-s[0],e[1]-s[1])*.25;return[u*u*s[0]+2*u*t*mx+t*t*e[0],u*u*s[1]+2*u*t*my+t*t*e[1]];}
function trail(o,t0,t1){const s=pt(o.a),e=pt(o.b);cx.beginPath();for(let i=0;i<=14;i++){const q=arcPt(s,e,t0+(t1-t0)*i/14);i?cx.lineTo(q[0],q[1]):cx.moveTo(q[0],q[1]);}cx.strokeStyle='rgba(125,211,252,.75)';cx.lineWidth=1.4;cx.stroke();return arcPt(s,e,t1);}
function log(o){const li=document.createElement('li');li.innerHTML='<b>blocked</b> <em>'+o.k+'</em> '+o.a[0]+' → '+o.b[0];feed.prepend(li);while(feed.children.length>6)feed.lastChild.remove();}
function frame(ts){
  const dt=Math.min(ts-last,64);last=ts;spawn-=dt;
  if(spawn<=0&&arcs.length<7){arcs.push(mk());spawn=450+Math.random()*500;}
  cx.clearRect(0,0,W,H);cx.drawImage(base,0,0,W,H);
  arcs=arcs.filter(o=>{o.t+=dt/o.d;const h=trail(o,Math.max(0,o.t-.35),Math.min(1,o.t));cx.fillStyle='#7dd3fc';cx.beginPath();cx.arc(h[0],h[1],2.4,0,6.3);cx.fill();
    if(o.t>=1){const e=pt(o.b);rings.push({x:e[0],y:e[1],r:0});count++;nEl.textContent=count.toLocaleString();log(o);return false;}return true;});
  rings=rings.filter(g=>{g.r+=dt*.04;const al=1-g.r/28;if(al<=0)return false;cx.strokeStyle='rgba(134,239,172,'+al+')';cx.lineWidth=1.5;cx.beginPath();cx.arc(g.x,g.y,g.r,0,6.3);cx.stroke();return true;});
  requestAnimationFrame(frame);
}
function still(){cx.clearRect(0,0,W,H);cx.drawImage(base,0,0,W,H);feed.innerHTML='';for(let i=0;i<5;i++){const o=mk();trail(o,0,1);log(o);}nEl.textContent='—';}
size();
if(reduce){still();addEventListener('resize',()=>{size();still();});}
else{addEventListener('resize',size);requestAnimationFrame(ts=>{last=ts;frame(ts);});}
const lines=[...document.querySelectorAll('.term-body>div')];
if(!reduce){lines.forEach(l=>l.classList.add('h'));lines.forEach((l,i)=>setTimeout(()=>l.classList.remove('h'),500+i*550));}
})();
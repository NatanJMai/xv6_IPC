
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 69                	jmp    8b <wc+0x8b>
    for(i=0; i<n; i++){
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 58                	jmp    83 <wc+0x83>
      c++;
  2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
  2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  32:	05 40 0c 00 00       	add    $0xc40,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 40 0c 00 00       	add    $0xc40,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	83 ec 08             	sub    $0x8,%esp
  53:	50                   	push   %eax
  54:	68 51 09 00 00       	push   $0x951
  59:	e8 35 02 00 00       	call   293 <strchr>
  5e:	83 c4 10             	add    $0x10,%esp
  61:	85 c0                	test   %eax,%eax
  63:	74 09                	je     6e <wc+0x6e>
        inword = 0;
  65:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  6c:	eb 11                	jmp    7f <wc+0x7f>
      else if(!inword){
  6e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  72:	75 0b                	jne    7f <wc+0x7f>
        w++;
  74:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
  78:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  7f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  86:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  89:	7c a0                	jl     2b <wc+0x2b>
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  8b:	83 ec 04             	sub    $0x4,%esp
  8e:	68 00 02 00 00       	push   $0x200
  93:	68 40 0c 00 00       	push   $0xc40
  98:	ff 75 08             	pushl  0x8(%ebp)
  9b:	e8 9c 03 00 00       	call   43c <read>
  a0:	83 c4 10             	add    $0x10,%esp
  a3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a6:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  aa:	0f 8f 72 ff ff ff    	jg     22 <wc+0x22>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
  b0:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  b4:	79 17                	jns    cd <wc+0xcd>
    printf(1, "wc: read error\n");
  b6:	83 ec 08             	sub    $0x8,%esp
  b9:	68 57 09 00 00       	push   $0x957
  be:	6a 01                	push   $0x1
  c0:	e8 d6 04 00 00       	call   59b <printf>
  c5:	83 c4 10             	add    $0x10,%esp
    exit();
  c8:	e8 57 03 00 00       	call   424 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  cd:	83 ec 08             	sub    $0x8,%esp
  d0:	ff 75 0c             	pushl  0xc(%ebp)
  d3:	ff 75 e8             	pushl  -0x18(%ebp)
  d6:	ff 75 ec             	pushl  -0x14(%ebp)
  d9:	ff 75 f0             	pushl  -0x10(%ebp)
  dc:	68 67 09 00 00       	push   $0x967
  e1:	6a 01                	push   $0x1
  e3:	e8 b3 04 00 00       	call   59b <printf>
  e8:	83 c4 20             	add    $0x20,%esp
}
  eb:	90                   	nop
  ec:	c9                   	leave  
  ed:	c3                   	ret    

000000ee <main>:

int
main(int argc, char *argv[])
{
  ee:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  f2:	83 e4 f0             	and    $0xfffffff0,%esp
  f5:	ff 71 fc             	pushl  -0x4(%ecx)
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	53                   	push   %ebx
  fc:	51                   	push   %ecx
  fd:	83 ec 10             	sub    $0x10,%esp
 100:	89 cb                	mov    %ecx,%ebx
  int fd, i;

  if(argc <= 1){
 102:	83 3b 01             	cmpl   $0x1,(%ebx)
 105:	7f 17                	jg     11e <main+0x30>
    wc(0, "");
 107:	83 ec 08             	sub    $0x8,%esp
 10a:	68 74 09 00 00       	push   $0x974
 10f:	6a 00                	push   $0x0
 111:	e8 ea fe ff ff       	call   0 <wc>
 116:	83 c4 10             	add    $0x10,%esp
    exit();
 119:	e8 06 03 00 00       	call   424 <exit>
  }

  for(i = 1; i < argc; i++){
 11e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
 125:	e9 83 00 00 00       	jmp    1ad <main+0xbf>
    if((fd = open(argv[i], 0)) < 0){
 12a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 12d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 134:	8b 43 04             	mov    0x4(%ebx),%eax
 137:	01 d0                	add    %edx,%eax
 139:	8b 00                	mov    (%eax),%eax
 13b:	83 ec 08             	sub    $0x8,%esp
 13e:	6a 00                	push   $0x0
 140:	50                   	push   %eax
 141:	e8 1e 03 00 00       	call   464 <open>
 146:	83 c4 10             	add    $0x10,%esp
 149:	89 45 f0             	mov    %eax,-0x10(%ebp)
 14c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 150:	79 29                	jns    17b <main+0x8d>
      printf(1, "wc: cannot open %s\n", argv[i]);
 152:	8b 45 f4             	mov    -0xc(%ebp),%eax
 155:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 15c:	8b 43 04             	mov    0x4(%ebx),%eax
 15f:	01 d0                	add    %edx,%eax
 161:	8b 00                	mov    (%eax),%eax
 163:	83 ec 04             	sub    $0x4,%esp
 166:	50                   	push   %eax
 167:	68 75 09 00 00       	push   $0x975
 16c:	6a 01                	push   $0x1
 16e:	e8 28 04 00 00       	call   59b <printf>
 173:	83 c4 10             	add    $0x10,%esp
      exit();
 176:	e8 a9 02 00 00       	call   424 <exit>
    }
    wc(fd, argv[i]);
 17b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 17e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 185:	8b 43 04             	mov    0x4(%ebx),%eax
 188:	01 d0                	add    %edx,%eax
 18a:	8b 00                	mov    (%eax),%eax
 18c:	83 ec 08             	sub    $0x8,%esp
 18f:	50                   	push   %eax
 190:	ff 75 f0             	pushl  -0x10(%ebp)
 193:	e8 68 fe ff ff       	call   0 <wc>
 198:	83 c4 10             	add    $0x10,%esp
    close(fd);
 19b:	83 ec 0c             	sub    $0xc,%esp
 19e:	ff 75 f0             	pushl  -0x10(%ebp)
 1a1:	e8 a6 02 00 00       	call   44c <close>
 1a6:	83 c4 10             	add    $0x10,%esp
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
 1a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 1ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b0:	3b 03                	cmp    (%ebx),%eax
 1b2:	0f 8c 72 ff ff ff    	jl     12a <main+0x3c>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
 1b8:	e8 67 02 00 00       	call   424 <exit>

000001bd <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1bd:	55                   	push   %ebp
 1be:	89 e5                	mov    %esp,%ebp
 1c0:	57                   	push   %edi
 1c1:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c5:	8b 55 10             	mov    0x10(%ebp),%edx
 1c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cb:	89 cb                	mov    %ecx,%ebx
 1cd:	89 df                	mov    %ebx,%edi
 1cf:	89 d1                	mov    %edx,%ecx
 1d1:	fc                   	cld    
 1d2:	f3 aa                	rep stos %al,%es:(%edi)
 1d4:	89 ca                	mov    %ecx,%edx
 1d6:	89 fb                	mov    %edi,%ebx
 1d8:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1db:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1de:	90                   	nop
 1df:	5b                   	pop    %ebx
 1e0:	5f                   	pop    %edi
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    

000001e3 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1e3:	55                   	push   %ebp
 1e4:	89 e5                	mov    %esp,%ebp
 1e6:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1ef:	90                   	nop
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	8d 50 01             	lea    0x1(%eax),%edx
 1f6:	89 55 08             	mov    %edx,0x8(%ebp)
 1f9:	8b 55 0c             	mov    0xc(%ebp),%edx
 1fc:	8d 4a 01             	lea    0x1(%edx),%ecx
 1ff:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 202:	0f b6 12             	movzbl (%edx),%edx
 205:	88 10                	mov    %dl,(%eax)
 207:	0f b6 00             	movzbl (%eax),%eax
 20a:	84 c0                	test   %al,%al
 20c:	75 e2                	jne    1f0 <strcpy+0xd>
    ;
  return os;
 20e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 211:	c9                   	leave  
 212:	c3                   	ret    

00000213 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 216:	eb 08                	jmp    220 <strcmp+0xd>
    p++, q++;
 218:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 21c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 220:	8b 45 08             	mov    0x8(%ebp),%eax
 223:	0f b6 00             	movzbl (%eax),%eax
 226:	84 c0                	test   %al,%al
 228:	74 10                	je     23a <strcmp+0x27>
 22a:	8b 45 08             	mov    0x8(%ebp),%eax
 22d:	0f b6 10             	movzbl (%eax),%edx
 230:	8b 45 0c             	mov    0xc(%ebp),%eax
 233:	0f b6 00             	movzbl (%eax),%eax
 236:	38 c2                	cmp    %al,%dl
 238:	74 de                	je     218 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 23a:	8b 45 08             	mov    0x8(%ebp),%eax
 23d:	0f b6 00             	movzbl (%eax),%eax
 240:	0f b6 d0             	movzbl %al,%edx
 243:	8b 45 0c             	mov    0xc(%ebp),%eax
 246:	0f b6 00             	movzbl (%eax),%eax
 249:	0f b6 c0             	movzbl %al,%eax
 24c:	29 c2                	sub    %eax,%edx
 24e:	89 d0                	mov    %edx,%eax
}
 250:	5d                   	pop    %ebp
 251:	c3                   	ret    

00000252 <strlen>:

uint
strlen(char *s)
{
 252:	55                   	push   %ebp
 253:	89 e5                	mov    %esp,%ebp
 255:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 258:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 25f:	eb 04                	jmp    265 <strlen+0x13>
 261:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 265:	8b 55 fc             	mov    -0x4(%ebp),%edx
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	01 d0                	add    %edx,%eax
 26d:	0f b6 00             	movzbl (%eax),%eax
 270:	84 c0                	test   %al,%al
 272:	75 ed                	jne    261 <strlen+0xf>
    ;
  return n;
 274:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 277:	c9                   	leave  
 278:	c3                   	ret    

00000279 <memset>:

void*
memset(void *dst, int c, uint n)
{
 279:	55                   	push   %ebp
 27a:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 27c:	8b 45 10             	mov    0x10(%ebp),%eax
 27f:	50                   	push   %eax
 280:	ff 75 0c             	pushl  0xc(%ebp)
 283:	ff 75 08             	pushl  0x8(%ebp)
 286:	e8 32 ff ff ff       	call   1bd <stosb>
 28b:	83 c4 0c             	add    $0xc,%esp
  return dst;
 28e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 291:	c9                   	leave  
 292:	c3                   	ret    

00000293 <strchr>:

char*
strchr(const char *s, char c)
{
 293:	55                   	push   %ebp
 294:	89 e5                	mov    %esp,%ebp
 296:	83 ec 04             	sub    $0x4,%esp
 299:	8b 45 0c             	mov    0xc(%ebp),%eax
 29c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 29f:	eb 14                	jmp    2b5 <strchr+0x22>
    if(*s == c)
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
 2a4:	0f b6 00             	movzbl (%eax),%eax
 2a7:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2aa:	75 05                	jne    2b1 <strchr+0x1e>
      return (char*)s;
 2ac:	8b 45 08             	mov    0x8(%ebp),%eax
 2af:	eb 13                	jmp    2c4 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2b1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2b5:	8b 45 08             	mov    0x8(%ebp),%eax
 2b8:	0f b6 00             	movzbl (%eax),%eax
 2bb:	84 c0                	test   %al,%al
 2bd:	75 e2                	jne    2a1 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c4:	c9                   	leave  
 2c5:	c3                   	ret    

000002c6 <gets>:

char*
gets(char *buf, int max)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2d3:	eb 42                	jmp    317 <gets+0x51>
    cc = read(0, &c, 1);
 2d5:	83 ec 04             	sub    $0x4,%esp
 2d8:	6a 01                	push   $0x1
 2da:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2dd:	50                   	push   %eax
 2de:	6a 00                	push   $0x0
 2e0:	e8 57 01 00 00       	call   43c <read>
 2e5:	83 c4 10             	add    $0x10,%esp
 2e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2eb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2ef:	7e 33                	jle    324 <gets+0x5e>
      break;
    buf[i++] = c;
 2f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f4:	8d 50 01             	lea    0x1(%eax),%edx
 2f7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 2fa:	89 c2                	mov    %eax,%edx
 2fc:	8b 45 08             	mov    0x8(%ebp),%eax
 2ff:	01 c2                	add    %eax,%edx
 301:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 305:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 307:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 30b:	3c 0a                	cmp    $0xa,%al
 30d:	74 16                	je     325 <gets+0x5f>
 30f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 313:	3c 0d                	cmp    $0xd,%al
 315:	74 0e                	je     325 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 317:	8b 45 f4             	mov    -0xc(%ebp),%eax
 31a:	83 c0 01             	add    $0x1,%eax
 31d:	3b 45 0c             	cmp    0xc(%ebp),%eax
 320:	7c b3                	jl     2d5 <gets+0xf>
 322:	eb 01                	jmp    325 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 324:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 325:	8b 55 f4             	mov    -0xc(%ebp),%edx
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	01 d0                	add    %edx,%eax
 32d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 330:	8b 45 08             	mov    0x8(%ebp),%eax
}
 333:	c9                   	leave  
 334:	c3                   	ret    

00000335 <stat>:

int
stat(char *n, struct stat *st)
{
 335:	55                   	push   %ebp
 336:	89 e5                	mov    %esp,%ebp
 338:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 33b:	83 ec 08             	sub    $0x8,%esp
 33e:	6a 00                	push   $0x0
 340:	ff 75 08             	pushl  0x8(%ebp)
 343:	e8 1c 01 00 00       	call   464 <open>
 348:	83 c4 10             	add    $0x10,%esp
 34b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 34e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 352:	79 07                	jns    35b <stat+0x26>
    return -1;
 354:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 359:	eb 25                	jmp    380 <stat+0x4b>
  r = fstat(fd, st);
 35b:	83 ec 08             	sub    $0x8,%esp
 35e:	ff 75 0c             	pushl  0xc(%ebp)
 361:	ff 75 f4             	pushl  -0xc(%ebp)
 364:	e8 13 01 00 00       	call   47c <fstat>
 369:	83 c4 10             	add    $0x10,%esp
 36c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 36f:	83 ec 0c             	sub    $0xc,%esp
 372:	ff 75 f4             	pushl  -0xc(%ebp)
 375:	e8 d2 00 00 00       	call   44c <close>
 37a:	83 c4 10             	add    $0x10,%esp
  return r;
 37d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 380:	c9                   	leave  
 381:	c3                   	ret    

00000382 <atoi>:

int
atoi(const char *s)
{
 382:	55                   	push   %ebp
 383:	89 e5                	mov    %esp,%ebp
 385:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 388:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 38f:	eb 25                	jmp    3b6 <atoi+0x34>
    n = n*10 + *s++ - '0';
 391:	8b 55 fc             	mov    -0x4(%ebp),%edx
 394:	89 d0                	mov    %edx,%eax
 396:	c1 e0 02             	shl    $0x2,%eax
 399:	01 d0                	add    %edx,%eax
 39b:	01 c0                	add    %eax,%eax
 39d:	89 c1                	mov    %eax,%ecx
 39f:	8b 45 08             	mov    0x8(%ebp),%eax
 3a2:	8d 50 01             	lea    0x1(%eax),%edx
 3a5:	89 55 08             	mov    %edx,0x8(%ebp)
 3a8:	0f b6 00             	movzbl (%eax),%eax
 3ab:	0f be c0             	movsbl %al,%eax
 3ae:	01 c8                	add    %ecx,%eax
 3b0:	83 e8 30             	sub    $0x30,%eax
 3b3:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3b6:	8b 45 08             	mov    0x8(%ebp),%eax
 3b9:	0f b6 00             	movzbl (%eax),%eax
 3bc:	3c 2f                	cmp    $0x2f,%al
 3be:	7e 0a                	jle    3ca <atoi+0x48>
 3c0:	8b 45 08             	mov    0x8(%ebp),%eax
 3c3:	0f b6 00             	movzbl (%eax),%eax
 3c6:	3c 39                	cmp    $0x39,%al
 3c8:	7e c7                	jle    391 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3cd:	c9                   	leave  
 3ce:	c3                   	ret    

000003cf <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3cf:	55                   	push   %ebp
 3d0:	89 e5                	mov    %esp,%ebp
 3d2:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3d5:	8b 45 08             	mov    0x8(%ebp),%eax
 3d8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3db:	8b 45 0c             	mov    0xc(%ebp),%eax
 3de:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3e1:	eb 17                	jmp    3fa <memmove+0x2b>
    *dst++ = *src++;
 3e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3e6:	8d 50 01             	lea    0x1(%eax),%edx
 3e9:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3ec:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3ef:	8d 4a 01             	lea    0x1(%edx),%ecx
 3f2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3f5:	0f b6 12             	movzbl (%edx),%edx
 3f8:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3fa:	8b 45 10             	mov    0x10(%ebp),%eax
 3fd:	8d 50 ff             	lea    -0x1(%eax),%edx
 400:	89 55 10             	mov    %edx,0x10(%ebp)
 403:	85 c0                	test   %eax,%eax
 405:	7f dc                	jg     3e3 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 407:	8b 45 08             	mov    0x8(%ebp),%eax
}
 40a:	c9                   	leave  
 40b:	c3                   	ret    

0000040c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 40c:	b8 01 00 00 00       	mov    $0x1,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <msend>:
SYSCALL(msend)
 414:	b8 16 00 00 00       	mov    $0x16,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <mrcve>:
SYSCALL(mrcve)
 41c:	b8 17 00 00 00       	mov    $0x17,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <exit>:
SYSCALL(exit)
 424:	b8 02 00 00 00       	mov    $0x2,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <wait>:
SYSCALL(wait)
 42c:	b8 03 00 00 00       	mov    $0x3,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <pipe>:
SYSCALL(pipe)
 434:	b8 04 00 00 00       	mov    $0x4,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <read>:
SYSCALL(read)
 43c:	b8 05 00 00 00       	mov    $0x5,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <write>:
SYSCALL(write)
 444:	b8 10 00 00 00       	mov    $0x10,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <close>:
SYSCALL(close)
 44c:	b8 15 00 00 00       	mov    $0x15,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <kill>:
SYSCALL(kill)
 454:	b8 06 00 00 00       	mov    $0x6,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <exec>:
SYSCALL(exec)
 45c:	b8 07 00 00 00       	mov    $0x7,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <open>:
SYSCALL(open)
 464:	b8 0f 00 00 00       	mov    $0xf,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <mknod>:
SYSCALL(mknod)
 46c:	b8 11 00 00 00       	mov    $0x11,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <unlink>:
SYSCALL(unlink)
 474:	b8 12 00 00 00       	mov    $0x12,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <fstat>:
SYSCALL(fstat)
 47c:	b8 08 00 00 00       	mov    $0x8,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <link>:
SYSCALL(link)
 484:	b8 13 00 00 00       	mov    $0x13,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <mkdir>:
SYSCALL(mkdir)
 48c:	b8 14 00 00 00       	mov    $0x14,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <chdir>:
SYSCALL(chdir)
 494:	b8 09 00 00 00       	mov    $0x9,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <dup>:
SYSCALL(dup)
 49c:	b8 0a 00 00 00       	mov    $0xa,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <getpid>:
SYSCALL(getpid)
 4a4:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <sbrk>:
SYSCALL(sbrk)
 4ac:	b8 0c 00 00 00       	mov    $0xc,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <sleep>:
SYSCALL(sleep)
 4b4:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <uptime>:
SYSCALL(uptime)
 4bc:	b8 0e 00 00 00       	mov    $0xe,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4c4:	55                   	push   %ebp
 4c5:	89 e5                	mov    %esp,%ebp
 4c7:	83 ec 18             	sub    $0x18,%esp
 4ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 4cd:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4d0:	83 ec 04             	sub    $0x4,%esp
 4d3:	6a 01                	push   $0x1
 4d5:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4d8:	50                   	push   %eax
 4d9:	ff 75 08             	pushl  0x8(%ebp)
 4dc:	e8 63 ff ff ff       	call   444 <write>
 4e1:	83 c4 10             	add    $0x10,%esp
}
 4e4:	90                   	nop
 4e5:	c9                   	leave  
 4e6:	c3                   	ret    

000004e7 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4e7:	55                   	push   %ebp
 4e8:	89 e5                	mov    %esp,%ebp
 4ea:	53                   	push   %ebx
 4eb:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4ee:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4f5:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4f9:	74 17                	je     512 <printint+0x2b>
 4fb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4ff:	79 11                	jns    512 <printint+0x2b>
    neg = 1;
 501:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 508:	8b 45 0c             	mov    0xc(%ebp),%eax
 50b:	f7 d8                	neg    %eax
 50d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 510:	eb 06                	jmp    518 <printint+0x31>
  } else {
    x = xx;
 512:	8b 45 0c             	mov    0xc(%ebp),%eax
 515:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 518:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 51f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 522:	8d 41 01             	lea    0x1(%ecx),%eax
 525:	89 45 f4             	mov    %eax,-0xc(%ebp)
 528:	8b 5d 10             	mov    0x10(%ebp),%ebx
 52b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 52e:	ba 00 00 00 00       	mov    $0x0,%edx
 533:	f7 f3                	div    %ebx
 535:	89 d0                	mov    %edx,%eax
 537:	0f b6 80 fc 0b 00 00 	movzbl 0xbfc(%eax),%eax
 53e:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 542:	8b 5d 10             	mov    0x10(%ebp),%ebx
 545:	8b 45 ec             	mov    -0x14(%ebp),%eax
 548:	ba 00 00 00 00       	mov    $0x0,%edx
 54d:	f7 f3                	div    %ebx
 54f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 552:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 556:	75 c7                	jne    51f <printint+0x38>
  if(neg)
 558:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 55c:	74 2d                	je     58b <printint+0xa4>
    buf[i++] = '-';
 55e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 561:	8d 50 01             	lea    0x1(%eax),%edx
 564:	89 55 f4             	mov    %edx,-0xc(%ebp)
 567:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 56c:	eb 1d                	jmp    58b <printint+0xa4>
    putc(fd, buf[i]);
 56e:	8d 55 dc             	lea    -0x24(%ebp),%edx
 571:	8b 45 f4             	mov    -0xc(%ebp),%eax
 574:	01 d0                	add    %edx,%eax
 576:	0f b6 00             	movzbl (%eax),%eax
 579:	0f be c0             	movsbl %al,%eax
 57c:	83 ec 08             	sub    $0x8,%esp
 57f:	50                   	push   %eax
 580:	ff 75 08             	pushl  0x8(%ebp)
 583:	e8 3c ff ff ff       	call   4c4 <putc>
 588:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 58b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 58f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 593:	79 d9                	jns    56e <printint+0x87>
    putc(fd, buf[i]);
}
 595:	90                   	nop
 596:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 599:	c9                   	leave  
 59a:	c3                   	ret    

0000059b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 59b:	55                   	push   %ebp
 59c:	89 e5                	mov    %esp,%ebp
 59e:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5a1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5a8:	8d 45 0c             	lea    0xc(%ebp),%eax
 5ab:	83 c0 04             	add    $0x4,%eax
 5ae:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5b1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5b8:	e9 59 01 00 00       	jmp    716 <printf+0x17b>
    c = fmt[i] & 0xff;
 5bd:	8b 55 0c             	mov    0xc(%ebp),%edx
 5c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5c3:	01 d0                	add    %edx,%eax
 5c5:	0f b6 00             	movzbl (%eax),%eax
 5c8:	0f be c0             	movsbl %al,%eax
 5cb:	25 ff 00 00 00       	and    $0xff,%eax
 5d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5d3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5d7:	75 2c                	jne    605 <printf+0x6a>
      if(c == '%'){
 5d9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5dd:	75 0c                	jne    5eb <printf+0x50>
        state = '%';
 5df:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5e6:	e9 27 01 00 00       	jmp    712 <printf+0x177>
      } else {
        putc(fd, c);
 5eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ee:	0f be c0             	movsbl %al,%eax
 5f1:	83 ec 08             	sub    $0x8,%esp
 5f4:	50                   	push   %eax
 5f5:	ff 75 08             	pushl  0x8(%ebp)
 5f8:	e8 c7 fe ff ff       	call   4c4 <putc>
 5fd:	83 c4 10             	add    $0x10,%esp
 600:	e9 0d 01 00 00       	jmp    712 <printf+0x177>
      }
    } else if(state == '%'){
 605:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 609:	0f 85 03 01 00 00    	jne    712 <printf+0x177>
      if(c == 'd'){
 60f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 613:	75 1e                	jne    633 <printf+0x98>
        printint(fd, *ap, 10, 1);
 615:	8b 45 e8             	mov    -0x18(%ebp),%eax
 618:	8b 00                	mov    (%eax),%eax
 61a:	6a 01                	push   $0x1
 61c:	6a 0a                	push   $0xa
 61e:	50                   	push   %eax
 61f:	ff 75 08             	pushl  0x8(%ebp)
 622:	e8 c0 fe ff ff       	call   4e7 <printint>
 627:	83 c4 10             	add    $0x10,%esp
        ap++;
 62a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 62e:	e9 d8 00 00 00       	jmp    70b <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 633:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 637:	74 06                	je     63f <printf+0xa4>
 639:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 63d:	75 1e                	jne    65d <printf+0xc2>
        printint(fd, *ap, 16, 0);
 63f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 642:	8b 00                	mov    (%eax),%eax
 644:	6a 00                	push   $0x0
 646:	6a 10                	push   $0x10
 648:	50                   	push   %eax
 649:	ff 75 08             	pushl  0x8(%ebp)
 64c:	e8 96 fe ff ff       	call   4e7 <printint>
 651:	83 c4 10             	add    $0x10,%esp
        ap++;
 654:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 658:	e9 ae 00 00 00       	jmp    70b <printf+0x170>
      } else if(c == 's'){
 65d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 661:	75 43                	jne    6a6 <printf+0x10b>
        s = (char*)*ap;
 663:	8b 45 e8             	mov    -0x18(%ebp),%eax
 666:	8b 00                	mov    (%eax),%eax
 668:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 66b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 66f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 673:	75 25                	jne    69a <printf+0xff>
          s = "(null)";
 675:	c7 45 f4 89 09 00 00 	movl   $0x989,-0xc(%ebp)
        while(*s != 0){
 67c:	eb 1c                	jmp    69a <printf+0xff>
          putc(fd, *s);
 67e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 681:	0f b6 00             	movzbl (%eax),%eax
 684:	0f be c0             	movsbl %al,%eax
 687:	83 ec 08             	sub    $0x8,%esp
 68a:	50                   	push   %eax
 68b:	ff 75 08             	pushl  0x8(%ebp)
 68e:	e8 31 fe ff ff       	call   4c4 <putc>
 693:	83 c4 10             	add    $0x10,%esp
          s++;
 696:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 69a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 69d:	0f b6 00             	movzbl (%eax),%eax
 6a0:	84 c0                	test   %al,%al
 6a2:	75 da                	jne    67e <printf+0xe3>
 6a4:	eb 65                	jmp    70b <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6a6:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6aa:	75 1d                	jne    6c9 <printf+0x12e>
        putc(fd, *ap);
 6ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6af:	8b 00                	mov    (%eax),%eax
 6b1:	0f be c0             	movsbl %al,%eax
 6b4:	83 ec 08             	sub    $0x8,%esp
 6b7:	50                   	push   %eax
 6b8:	ff 75 08             	pushl  0x8(%ebp)
 6bb:	e8 04 fe ff ff       	call   4c4 <putc>
 6c0:	83 c4 10             	add    $0x10,%esp
        ap++;
 6c3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c7:	eb 42                	jmp    70b <printf+0x170>
      } else if(c == '%'){
 6c9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6cd:	75 17                	jne    6e6 <printf+0x14b>
        putc(fd, c);
 6cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d2:	0f be c0             	movsbl %al,%eax
 6d5:	83 ec 08             	sub    $0x8,%esp
 6d8:	50                   	push   %eax
 6d9:	ff 75 08             	pushl  0x8(%ebp)
 6dc:	e8 e3 fd ff ff       	call   4c4 <putc>
 6e1:	83 c4 10             	add    $0x10,%esp
 6e4:	eb 25                	jmp    70b <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6e6:	83 ec 08             	sub    $0x8,%esp
 6e9:	6a 25                	push   $0x25
 6eb:	ff 75 08             	pushl  0x8(%ebp)
 6ee:	e8 d1 fd ff ff       	call   4c4 <putc>
 6f3:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 6f6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f9:	0f be c0             	movsbl %al,%eax
 6fc:	83 ec 08             	sub    $0x8,%esp
 6ff:	50                   	push   %eax
 700:	ff 75 08             	pushl  0x8(%ebp)
 703:	e8 bc fd ff ff       	call   4c4 <putc>
 708:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 70b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 712:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 716:	8b 55 0c             	mov    0xc(%ebp),%edx
 719:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71c:	01 d0                	add    %edx,%eax
 71e:	0f b6 00             	movzbl (%eax),%eax
 721:	84 c0                	test   %al,%al
 723:	0f 85 94 fe ff ff    	jne    5bd <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 729:	90                   	nop
 72a:	c9                   	leave  
 72b:	c3                   	ret    

0000072c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 72c:	55                   	push   %ebp
 72d:	89 e5                	mov    %esp,%ebp
 72f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 732:	8b 45 08             	mov    0x8(%ebp),%eax
 735:	83 e8 08             	sub    $0x8,%eax
 738:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73b:	a1 28 0c 00 00       	mov    0xc28,%eax
 740:	89 45 fc             	mov    %eax,-0x4(%ebp)
 743:	eb 24                	jmp    769 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 745:	8b 45 fc             	mov    -0x4(%ebp),%eax
 748:	8b 00                	mov    (%eax),%eax
 74a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 74d:	77 12                	ja     761 <free+0x35>
 74f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 752:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 755:	77 24                	ja     77b <free+0x4f>
 757:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75a:	8b 00                	mov    (%eax),%eax
 75c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 75f:	77 1a                	ja     77b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	8b 45 fc             	mov    -0x4(%ebp),%eax
 764:	8b 00                	mov    (%eax),%eax
 766:	89 45 fc             	mov    %eax,-0x4(%ebp)
 769:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 76f:	76 d4                	jbe    745 <free+0x19>
 771:	8b 45 fc             	mov    -0x4(%ebp),%eax
 774:	8b 00                	mov    (%eax),%eax
 776:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 779:	76 ca                	jbe    745 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 77b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77e:	8b 40 04             	mov    0x4(%eax),%eax
 781:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 788:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78b:	01 c2                	add    %eax,%edx
 78d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 790:	8b 00                	mov    (%eax),%eax
 792:	39 c2                	cmp    %eax,%edx
 794:	75 24                	jne    7ba <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 796:	8b 45 f8             	mov    -0x8(%ebp),%eax
 799:	8b 50 04             	mov    0x4(%eax),%edx
 79c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79f:	8b 00                	mov    (%eax),%eax
 7a1:	8b 40 04             	mov    0x4(%eax),%eax
 7a4:	01 c2                	add    %eax,%edx
 7a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7af:	8b 00                	mov    (%eax),%eax
 7b1:	8b 10                	mov    (%eax),%edx
 7b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b6:	89 10                	mov    %edx,(%eax)
 7b8:	eb 0a                	jmp    7c4 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bd:	8b 10                	mov    (%eax),%edx
 7bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c7:	8b 40 04             	mov    0x4(%eax),%eax
 7ca:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d4:	01 d0                	add    %edx,%eax
 7d6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7d9:	75 20                	jne    7fb <free+0xcf>
    p->s.size += bp->s.size;
 7db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7de:	8b 50 04             	mov    0x4(%eax),%edx
 7e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e4:	8b 40 04             	mov    0x4(%eax),%eax
 7e7:	01 c2                	add    %eax,%edx
 7e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ec:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f2:	8b 10                	mov    (%eax),%edx
 7f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f7:	89 10                	mov    %edx,(%eax)
 7f9:	eb 08                	jmp    803 <free+0xd7>
  } else
    p->s.ptr = bp;
 7fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fe:	8b 55 f8             	mov    -0x8(%ebp),%edx
 801:	89 10                	mov    %edx,(%eax)
  freep = p;
 803:	8b 45 fc             	mov    -0x4(%ebp),%eax
 806:	a3 28 0c 00 00       	mov    %eax,0xc28
}
 80b:	90                   	nop
 80c:	c9                   	leave  
 80d:	c3                   	ret    

0000080e <morecore>:

static Header*
morecore(uint nu)
{
 80e:	55                   	push   %ebp
 80f:	89 e5                	mov    %esp,%ebp
 811:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 814:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 81b:	77 07                	ja     824 <morecore+0x16>
    nu = 4096;
 81d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 824:	8b 45 08             	mov    0x8(%ebp),%eax
 827:	c1 e0 03             	shl    $0x3,%eax
 82a:	83 ec 0c             	sub    $0xc,%esp
 82d:	50                   	push   %eax
 82e:	e8 79 fc ff ff       	call   4ac <sbrk>
 833:	83 c4 10             	add    $0x10,%esp
 836:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 839:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 83d:	75 07                	jne    846 <morecore+0x38>
    return 0;
 83f:	b8 00 00 00 00       	mov    $0x0,%eax
 844:	eb 26                	jmp    86c <morecore+0x5e>
  hp = (Header*)p;
 846:	8b 45 f4             	mov    -0xc(%ebp),%eax
 849:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 84c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84f:	8b 55 08             	mov    0x8(%ebp),%edx
 852:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 855:	8b 45 f0             	mov    -0x10(%ebp),%eax
 858:	83 c0 08             	add    $0x8,%eax
 85b:	83 ec 0c             	sub    $0xc,%esp
 85e:	50                   	push   %eax
 85f:	e8 c8 fe ff ff       	call   72c <free>
 864:	83 c4 10             	add    $0x10,%esp
  return freep;
 867:	a1 28 0c 00 00       	mov    0xc28,%eax
}
 86c:	c9                   	leave  
 86d:	c3                   	ret    

0000086e <malloc>:

void*
malloc(uint nbytes)
{
 86e:	55                   	push   %ebp
 86f:	89 e5                	mov    %esp,%ebp
 871:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 874:	8b 45 08             	mov    0x8(%ebp),%eax
 877:	83 c0 07             	add    $0x7,%eax
 87a:	c1 e8 03             	shr    $0x3,%eax
 87d:	83 c0 01             	add    $0x1,%eax
 880:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 883:	a1 28 0c 00 00       	mov    0xc28,%eax
 888:	89 45 f0             	mov    %eax,-0x10(%ebp)
 88b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 88f:	75 23                	jne    8b4 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 891:	c7 45 f0 20 0c 00 00 	movl   $0xc20,-0x10(%ebp)
 898:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89b:	a3 28 0c 00 00       	mov    %eax,0xc28
 8a0:	a1 28 0c 00 00       	mov    0xc28,%eax
 8a5:	a3 20 0c 00 00       	mov    %eax,0xc20
    base.s.size = 0;
 8aa:	c7 05 24 0c 00 00 00 	movl   $0x0,0xc24
 8b1:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b7:	8b 00                	mov    (%eax),%eax
 8b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bf:	8b 40 04             	mov    0x4(%eax),%eax
 8c2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8c5:	72 4d                	jb     914 <malloc+0xa6>
      if(p->s.size == nunits)
 8c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ca:	8b 40 04             	mov    0x4(%eax),%eax
 8cd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8d0:	75 0c                	jne    8de <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d5:	8b 10                	mov    (%eax),%edx
 8d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8da:	89 10                	mov    %edx,(%eax)
 8dc:	eb 26                	jmp    904 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e1:	8b 40 04             	mov    0x4(%eax),%eax
 8e4:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8e7:	89 c2                	mov    %eax,%edx
 8e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ec:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f2:	8b 40 04             	mov    0x4(%eax),%eax
 8f5:	c1 e0 03             	shl    $0x3,%eax
 8f8:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fe:	8b 55 ec             	mov    -0x14(%ebp),%edx
 901:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 904:	8b 45 f0             	mov    -0x10(%ebp),%eax
 907:	a3 28 0c 00 00       	mov    %eax,0xc28
      return (void*)(p + 1);
 90c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90f:	83 c0 08             	add    $0x8,%eax
 912:	eb 3b                	jmp    94f <malloc+0xe1>
    }
    if(p == freep)
 914:	a1 28 0c 00 00       	mov    0xc28,%eax
 919:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 91c:	75 1e                	jne    93c <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 91e:	83 ec 0c             	sub    $0xc,%esp
 921:	ff 75 ec             	pushl  -0x14(%ebp)
 924:	e8 e5 fe ff ff       	call   80e <morecore>
 929:	83 c4 10             	add    $0x10,%esp
 92c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 92f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 933:	75 07                	jne    93c <malloc+0xce>
        return 0;
 935:	b8 00 00 00 00       	mov    $0x0,%eax
 93a:	eb 13                	jmp    94f <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 93c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 942:	8b 45 f4             	mov    -0xc(%ebp),%eax
 945:	8b 00                	mov    (%eax),%eax
 947:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 94a:	e9 6d ff ff ff       	jmp    8bc <malloc+0x4e>
}
 94f:	c9                   	leave  
 950:	c3                   	ret    

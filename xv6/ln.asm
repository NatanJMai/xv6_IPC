
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	89 cb                	mov    %ecx,%ebx
  if(argc != 3){
  11:	83 3b 03             	cmpl   $0x3,(%ebx)
  14:	74 17                	je     2d <main+0x2d>
    printf(2, "Usage: ln old new\n");
  16:	83 ec 08             	sub    $0x8,%esp
  19:	68 08 08 00 00       	push   $0x808
  1e:	6a 02                	push   $0x2
  20:	e8 2d 04 00 00       	call   452 <printf>
  25:	83 c4 10             	add    $0x10,%esp
    exit();
  28:	e8 ae 02 00 00       	call   2db <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2d:	8b 43 04             	mov    0x4(%ebx),%eax
  30:	83 c0 08             	add    $0x8,%eax
  33:	8b 10                	mov    (%eax),%edx
  35:	8b 43 04             	mov    0x4(%ebx),%eax
  38:	83 c0 04             	add    $0x4,%eax
  3b:	8b 00                	mov    (%eax),%eax
  3d:	83 ec 08             	sub    $0x8,%esp
  40:	52                   	push   %edx
  41:	50                   	push   %eax
  42:	e8 f4 02 00 00       	call   33b <link>
  47:	83 c4 10             	add    $0x10,%esp
  4a:	85 c0                	test   %eax,%eax
  4c:	79 21                	jns    6f <main+0x6f>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  4e:	8b 43 04             	mov    0x4(%ebx),%eax
  51:	83 c0 08             	add    $0x8,%eax
  54:	8b 10                	mov    (%eax),%edx
  56:	8b 43 04             	mov    0x4(%ebx),%eax
  59:	83 c0 04             	add    $0x4,%eax
  5c:	8b 00                	mov    (%eax),%eax
  5e:	52                   	push   %edx
  5f:	50                   	push   %eax
  60:	68 1b 08 00 00       	push   $0x81b
  65:	6a 02                	push   $0x2
  67:	e8 e6 03 00 00       	call   452 <printf>
  6c:	83 c4 10             	add    $0x10,%esp
  exit();
  6f:	e8 67 02 00 00       	call   2db <exit>

00000074 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  74:	55                   	push   %ebp
  75:	89 e5                	mov    %esp,%ebp
  77:	57                   	push   %edi
  78:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  79:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7c:	8b 55 10             	mov    0x10(%ebp),%edx
  7f:	8b 45 0c             	mov    0xc(%ebp),%eax
  82:	89 cb                	mov    %ecx,%ebx
  84:	89 df                	mov    %ebx,%edi
  86:	89 d1                	mov    %edx,%ecx
  88:	fc                   	cld    
  89:	f3 aa                	rep stos %al,%es:(%edi)
  8b:	89 ca                	mov    %ecx,%edx
  8d:	89 fb                	mov    %edi,%ebx
  8f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  92:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  95:	90                   	nop
  96:	5b                   	pop    %ebx
  97:	5f                   	pop    %edi
  98:	5d                   	pop    %ebp
  99:	c3                   	ret    

0000009a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  9a:	55                   	push   %ebp
  9b:	89 e5                	mov    %esp,%ebp
  9d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a0:	8b 45 08             	mov    0x8(%ebp),%eax
  a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  a6:	90                   	nop
  a7:	8b 45 08             	mov    0x8(%ebp),%eax
  aa:	8d 50 01             	lea    0x1(%eax),%edx
  ad:	89 55 08             	mov    %edx,0x8(%ebp)
  b0:	8b 55 0c             	mov    0xc(%ebp),%edx
  b3:	8d 4a 01             	lea    0x1(%edx),%ecx
  b6:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b9:	0f b6 12             	movzbl (%edx),%edx
  bc:	88 10                	mov    %dl,(%eax)
  be:	0f b6 00             	movzbl (%eax),%eax
  c1:	84 c0                	test   %al,%al
  c3:	75 e2                	jne    a7 <strcpy+0xd>
    ;
  return os;
  c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c8:	c9                   	leave  
  c9:	c3                   	ret    

000000ca <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ca:	55                   	push   %ebp
  cb:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  cd:	eb 08                	jmp    d7 <strcmp+0xd>
    p++, q++;
  cf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d7:	8b 45 08             	mov    0x8(%ebp),%eax
  da:	0f b6 00             	movzbl (%eax),%eax
  dd:	84 c0                	test   %al,%al
  df:	74 10                	je     f1 <strcmp+0x27>
  e1:	8b 45 08             	mov    0x8(%ebp),%eax
  e4:	0f b6 10             	movzbl (%eax),%edx
  e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  ea:	0f b6 00             	movzbl (%eax),%eax
  ed:	38 c2                	cmp    %al,%dl
  ef:	74 de                	je     cf <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	0f b6 d0             	movzbl %al,%edx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	0f b6 00             	movzbl (%eax),%eax
 100:	0f b6 c0             	movzbl %al,%eax
 103:	29 c2                	sub    %eax,%edx
 105:	89 d0                	mov    %edx,%eax
}
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    

00000109 <strlen>:

uint
strlen(char *s)
{
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 10f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 116:	eb 04                	jmp    11c <strlen+0x13>
 118:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 11c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 11f:	8b 45 08             	mov    0x8(%ebp),%eax
 122:	01 d0                	add    %edx,%eax
 124:	0f b6 00             	movzbl (%eax),%eax
 127:	84 c0                	test   %al,%al
 129:	75 ed                	jne    118 <strlen+0xf>
    ;
  return n;
 12b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 12e:	c9                   	leave  
 12f:	c3                   	ret    

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 133:	8b 45 10             	mov    0x10(%ebp),%eax
 136:	50                   	push   %eax
 137:	ff 75 0c             	pushl  0xc(%ebp)
 13a:	ff 75 08             	pushl  0x8(%ebp)
 13d:	e8 32 ff ff ff       	call   74 <stosb>
 142:	83 c4 0c             	add    $0xc,%esp
  return dst;
 145:	8b 45 08             	mov    0x8(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <strchr>:

char*
strchr(const char *s, char c)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 04             	sub    $0x4,%esp
 150:	8b 45 0c             	mov    0xc(%ebp),%eax
 153:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 156:	eb 14                	jmp    16c <strchr+0x22>
    if(*s == c)
 158:	8b 45 08             	mov    0x8(%ebp),%eax
 15b:	0f b6 00             	movzbl (%eax),%eax
 15e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 161:	75 05                	jne    168 <strchr+0x1e>
      return (char*)s;
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	eb 13                	jmp    17b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 168:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	0f b6 00             	movzbl (%eax),%eax
 172:	84 c0                	test   %al,%al
 174:	75 e2                	jne    158 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 176:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17b:	c9                   	leave  
 17c:	c3                   	ret    

0000017d <gets>:

char*
gets(char *buf, int max)
{
 17d:	55                   	push   %ebp
 17e:	89 e5                	mov    %esp,%ebp
 180:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 183:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18a:	eb 42                	jmp    1ce <gets+0x51>
    cc = read(0, &c, 1);
 18c:	83 ec 04             	sub    $0x4,%esp
 18f:	6a 01                	push   $0x1
 191:	8d 45 ef             	lea    -0x11(%ebp),%eax
 194:	50                   	push   %eax
 195:	6a 00                	push   $0x0
 197:	e8 57 01 00 00       	call   2f3 <read>
 19c:	83 c4 10             	add    $0x10,%esp
 19f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1a6:	7e 33                	jle    1db <gets+0x5e>
      break;
    buf[i++] = c;
 1a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ab:	8d 50 01             	lea    0x1(%eax),%edx
 1ae:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1b1:	89 c2                	mov    %eax,%edx
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
 1b6:	01 c2                	add    %eax,%edx
 1b8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1bc:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1be:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c2:	3c 0a                	cmp    $0xa,%al
 1c4:	74 16                	je     1dc <gets+0x5f>
 1c6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ca:	3c 0d                	cmp    $0xd,%al
 1cc:	74 0e                	je     1dc <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d1:	83 c0 01             	add    $0x1,%eax
 1d4:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1d7:	7c b3                	jl     18c <gets+0xf>
 1d9:	eb 01                	jmp    1dc <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1db:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1df:	8b 45 08             	mov    0x8(%ebp),%eax
 1e2:	01 d0                	add    %edx,%eax
 1e4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ea:	c9                   	leave  
 1eb:	c3                   	ret    

000001ec <stat>:

int
stat(char *n, struct stat *st)
{
 1ec:	55                   	push   %ebp
 1ed:	89 e5                	mov    %esp,%ebp
 1ef:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f2:	83 ec 08             	sub    $0x8,%esp
 1f5:	6a 00                	push   $0x0
 1f7:	ff 75 08             	pushl  0x8(%ebp)
 1fa:	e8 1c 01 00 00       	call   31b <open>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 205:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 209:	79 07                	jns    212 <stat+0x26>
    return -1;
 20b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 210:	eb 25                	jmp    237 <stat+0x4b>
  r = fstat(fd, st);
 212:	83 ec 08             	sub    $0x8,%esp
 215:	ff 75 0c             	pushl  0xc(%ebp)
 218:	ff 75 f4             	pushl  -0xc(%ebp)
 21b:	e8 13 01 00 00       	call   333 <fstat>
 220:	83 c4 10             	add    $0x10,%esp
 223:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 226:	83 ec 0c             	sub    $0xc,%esp
 229:	ff 75 f4             	pushl  -0xc(%ebp)
 22c:	e8 d2 00 00 00       	call   303 <close>
 231:	83 c4 10             	add    $0x10,%esp
  return r;
 234:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 237:	c9                   	leave  
 238:	c3                   	ret    

00000239 <atoi>:

int
atoi(const char *s)
{
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
 23c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 23f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 246:	eb 25                	jmp    26d <atoi+0x34>
    n = n*10 + *s++ - '0';
 248:	8b 55 fc             	mov    -0x4(%ebp),%edx
 24b:	89 d0                	mov    %edx,%eax
 24d:	c1 e0 02             	shl    $0x2,%eax
 250:	01 d0                	add    %edx,%eax
 252:	01 c0                	add    %eax,%eax
 254:	89 c1                	mov    %eax,%ecx
 256:	8b 45 08             	mov    0x8(%ebp),%eax
 259:	8d 50 01             	lea    0x1(%eax),%edx
 25c:	89 55 08             	mov    %edx,0x8(%ebp)
 25f:	0f b6 00             	movzbl (%eax),%eax
 262:	0f be c0             	movsbl %al,%eax
 265:	01 c8                	add    %ecx,%eax
 267:	83 e8 30             	sub    $0x30,%eax
 26a:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26d:	8b 45 08             	mov    0x8(%ebp),%eax
 270:	0f b6 00             	movzbl (%eax),%eax
 273:	3c 2f                	cmp    $0x2f,%al
 275:	7e 0a                	jle    281 <atoi+0x48>
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 00             	movzbl (%eax),%eax
 27d:	3c 39                	cmp    $0x39,%al
 27f:	7e c7                	jle    248 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 281:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 284:	c9                   	leave  
 285:	c3                   	ret    

00000286 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 286:	55                   	push   %ebp
 287:	89 e5                	mov    %esp,%ebp
 289:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 28c:	8b 45 08             	mov    0x8(%ebp),%eax
 28f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 292:	8b 45 0c             	mov    0xc(%ebp),%eax
 295:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 298:	eb 17                	jmp    2b1 <memmove+0x2b>
    *dst++ = *src++;
 29a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 29d:	8d 50 01             	lea    0x1(%eax),%edx
 2a0:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2a3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2a6:	8d 4a 01             	lea    0x1(%edx),%ecx
 2a9:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2ac:	0f b6 12             	movzbl (%edx),%edx
 2af:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b1:	8b 45 10             	mov    0x10(%ebp),%eax
 2b4:	8d 50 ff             	lea    -0x1(%eax),%edx
 2b7:	89 55 10             	mov    %edx,0x10(%ebp)
 2ba:	85 c0                	test   %eax,%eax
 2bc:	7f dc                	jg     29a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c1:	c9                   	leave  
 2c2:	c3                   	ret    

000002c3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2c3:	b8 01 00 00 00       	mov    $0x1,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <msend>:
SYSCALL(msend)
 2cb:	b8 16 00 00 00       	mov    $0x16,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <mrcve>:
SYSCALL(mrcve)
 2d3:	b8 17 00 00 00       	mov    $0x17,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <exit>:
SYSCALL(exit)
 2db:	b8 02 00 00 00       	mov    $0x2,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <wait>:
SYSCALL(wait)
 2e3:	b8 03 00 00 00       	mov    $0x3,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <pipe>:
SYSCALL(pipe)
 2eb:	b8 04 00 00 00       	mov    $0x4,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <read>:
SYSCALL(read)
 2f3:	b8 05 00 00 00       	mov    $0x5,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <write>:
SYSCALL(write)
 2fb:	b8 10 00 00 00       	mov    $0x10,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <close>:
SYSCALL(close)
 303:	b8 15 00 00 00       	mov    $0x15,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <kill>:
SYSCALL(kill)
 30b:	b8 06 00 00 00       	mov    $0x6,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <exec>:
SYSCALL(exec)
 313:	b8 07 00 00 00       	mov    $0x7,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <open>:
SYSCALL(open)
 31b:	b8 0f 00 00 00       	mov    $0xf,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <mknod>:
SYSCALL(mknod)
 323:	b8 11 00 00 00       	mov    $0x11,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <unlink>:
SYSCALL(unlink)
 32b:	b8 12 00 00 00       	mov    $0x12,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <fstat>:
SYSCALL(fstat)
 333:	b8 08 00 00 00       	mov    $0x8,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <link>:
SYSCALL(link)
 33b:	b8 13 00 00 00       	mov    $0x13,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <mkdir>:
SYSCALL(mkdir)
 343:	b8 14 00 00 00       	mov    $0x14,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <chdir>:
SYSCALL(chdir)
 34b:	b8 09 00 00 00       	mov    $0x9,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <dup>:
SYSCALL(dup)
 353:	b8 0a 00 00 00       	mov    $0xa,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <getpid>:
SYSCALL(getpid)
 35b:	b8 0b 00 00 00       	mov    $0xb,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <sbrk>:
SYSCALL(sbrk)
 363:	b8 0c 00 00 00       	mov    $0xc,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <sleep>:
SYSCALL(sleep)
 36b:	b8 0d 00 00 00       	mov    $0xd,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <uptime>:
SYSCALL(uptime)
 373:	b8 0e 00 00 00       	mov    $0xe,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 37b:	55                   	push   %ebp
 37c:	89 e5                	mov    %esp,%ebp
 37e:	83 ec 18             	sub    $0x18,%esp
 381:	8b 45 0c             	mov    0xc(%ebp),%eax
 384:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 387:	83 ec 04             	sub    $0x4,%esp
 38a:	6a 01                	push   $0x1
 38c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 38f:	50                   	push   %eax
 390:	ff 75 08             	pushl  0x8(%ebp)
 393:	e8 63 ff ff ff       	call   2fb <write>
 398:	83 c4 10             	add    $0x10,%esp
}
 39b:	90                   	nop
 39c:	c9                   	leave  
 39d:	c3                   	ret    

0000039e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 39e:	55                   	push   %ebp
 39f:	89 e5                	mov    %esp,%ebp
 3a1:	53                   	push   %ebx
 3a2:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3a5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3ac:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3b0:	74 17                	je     3c9 <printint+0x2b>
 3b2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3b6:	79 11                	jns    3c9 <printint+0x2b>
    neg = 1;
 3b8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c2:	f7 d8                	neg    %eax
 3c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3c7:	eb 06                	jmp    3cf <printint+0x31>
  } else {
    x = xx;
 3c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3cf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3d6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3d9:	8d 41 01             	lea    0x1(%ecx),%eax
 3dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3df:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3e5:	ba 00 00 00 00       	mov    $0x0,%edx
 3ea:	f7 f3                	div    %ebx
 3ec:	89 d0                	mov    %edx,%eax
 3ee:	0f b6 80 84 0a 00 00 	movzbl 0xa84(%eax),%eax
 3f5:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3f9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3ff:	ba 00 00 00 00       	mov    $0x0,%edx
 404:	f7 f3                	div    %ebx
 406:	89 45 ec             	mov    %eax,-0x14(%ebp)
 409:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 40d:	75 c7                	jne    3d6 <printint+0x38>
  if(neg)
 40f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 413:	74 2d                	je     442 <printint+0xa4>
    buf[i++] = '-';
 415:	8b 45 f4             	mov    -0xc(%ebp),%eax
 418:	8d 50 01             	lea    0x1(%eax),%edx
 41b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 41e:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 423:	eb 1d                	jmp    442 <printint+0xa4>
    putc(fd, buf[i]);
 425:	8d 55 dc             	lea    -0x24(%ebp),%edx
 428:	8b 45 f4             	mov    -0xc(%ebp),%eax
 42b:	01 d0                	add    %edx,%eax
 42d:	0f b6 00             	movzbl (%eax),%eax
 430:	0f be c0             	movsbl %al,%eax
 433:	83 ec 08             	sub    $0x8,%esp
 436:	50                   	push   %eax
 437:	ff 75 08             	pushl  0x8(%ebp)
 43a:	e8 3c ff ff ff       	call   37b <putc>
 43f:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 442:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 446:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 44a:	79 d9                	jns    425 <printint+0x87>
    putc(fd, buf[i]);
}
 44c:	90                   	nop
 44d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 450:	c9                   	leave  
 451:	c3                   	ret    

00000452 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 452:	55                   	push   %ebp
 453:	89 e5                	mov    %esp,%ebp
 455:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 458:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 45f:	8d 45 0c             	lea    0xc(%ebp),%eax
 462:	83 c0 04             	add    $0x4,%eax
 465:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 468:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 46f:	e9 59 01 00 00       	jmp    5cd <printf+0x17b>
    c = fmt[i] & 0xff;
 474:	8b 55 0c             	mov    0xc(%ebp),%edx
 477:	8b 45 f0             	mov    -0x10(%ebp),%eax
 47a:	01 d0                	add    %edx,%eax
 47c:	0f b6 00             	movzbl (%eax),%eax
 47f:	0f be c0             	movsbl %al,%eax
 482:	25 ff 00 00 00       	and    $0xff,%eax
 487:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 48a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 48e:	75 2c                	jne    4bc <printf+0x6a>
      if(c == '%'){
 490:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 494:	75 0c                	jne    4a2 <printf+0x50>
        state = '%';
 496:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 49d:	e9 27 01 00 00       	jmp    5c9 <printf+0x177>
      } else {
        putc(fd, c);
 4a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4a5:	0f be c0             	movsbl %al,%eax
 4a8:	83 ec 08             	sub    $0x8,%esp
 4ab:	50                   	push   %eax
 4ac:	ff 75 08             	pushl  0x8(%ebp)
 4af:	e8 c7 fe ff ff       	call   37b <putc>
 4b4:	83 c4 10             	add    $0x10,%esp
 4b7:	e9 0d 01 00 00       	jmp    5c9 <printf+0x177>
      }
    } else if(state == '%'){
 4bc:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4c0:	0f 85 03 01 00 00    	jne    5c9 <printf+0x177>
      if(c == 'd'){
 4c6:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4ca:	75 1e                	jne    4ea <printf+0x98>
        printint(fd, *ap, 10, 1);
 4cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4cf:	8b 00                	mov    (%eax),%eax
 4d1:	6a 01                	push   $0x1
 4d3:	6a 0a                	push   $0xa
 4d5:	50                   	push   %eax
 4d6:	ff 75 08             	pushl  0x8(%ebp)
 4d9:	e8 c0 fe ff ff       	call   39e <printint>
 4de:	83 c4 10             	add    $0x10,%esp
        ap++;
 4e1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4e5:	e9 d8 00 00 00       	jmp    5c2 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 4ea:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4ee:	74 06                	je     4f6 <printf+0xa4>
 4f0:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4f4:	75 1e                	jne    514 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4f9:	8b 00                	mov    (%eax),%eax
 4fb:	6a 00                	push   $0x0
 4fd:	6a 10                	push   $0x10
 4ff:	50                   	push   %eax
 500:	ff 75 08             	pushl  0x8(%ebp)
 503:	e8 96 fe ff ff       	call   39e <printint>
 508:	83 c4 10             	add    $0x10,%esp
        ap++;
 50b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 50f:	e9 ae 00 00 00       	jmp    5c2 <printf+0x170>
      } else if(c == 's'){
 514:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 518:	75 43                	jne    55d <printf+0x10b>
        s = (char*)*ap;
 51a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 51d:	8b 00                	mov    (%eax),%eax
 51f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 522:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 526:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 52a:	75 25                	jne    551 <printf+0xff>
          s = "(null)";
 52c:	c7 45 f4 2f 08 00 00 	movl   $0x82f,-0xc(%ebp)
        while(*s != 0){
 533:	eb 1c                	jmp    551 <printf+0xff>
          putc(fd, *s);
 535:	8b 45 f4             	mov    -0xc(%ebp),%eax
 538:	0f b6 00             	movzbl (%eax),%eax
 53b:	0f be c0             	movsbl %al,%eax
 53e:	83 ec 08             	sub    $0x8,%esp
 541:	50                   	push   %eax
 542:	ff 75 08             	pushl  0x8(%ebp)
 545:	e8 31 fe ff ff       	call   37b <putc>
 54a:	83 c4 10             	add    $0x10,%esp
          s++;
 54d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 551:	8b 45 f4             	mov    -0xc(%ebp),%eax
 554:	0f b6 00             	movzbl (%eax),%eax
 557:	84 c0                	test   %al,%al
 559:	75 da                	jne    535 <printf+0xe3>
 55b:	eb 65                	jmp    5c2 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 55d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 561:	75 1d                	jne    580 <printf+0x12e>
        putc(fd, *ap);
 563:	8b 45 e8             	mov    -0x18(%ebp),%eax
 566:	8b 00                	mov    (%eax),%eax
 568:	0f be c0             	movsbl %al,%eax
 56b:	83 ec 08             	sub    $0x8,%esp
 56e:	50                   	push   %eax
 56f:	ff 75 08             	pushl  0x8(%ebp)
 572:	e8 04 fe ff ff       	call   37b <putc>
 577:	83 c4 10             	add    $0x10,%esp
        ap++;
 57a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 57e:	eb 42                	jmp    5c2 <printf+0x170>
      } else if(c == '%'){
 580:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 584:	75 17                	jne    59d <printf+0x14b>
        putc(fd, c);
 586:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 589:	0f be c0             	movsbl %al,%eax
 58c:	83 ec 08             	sub    $0x8,%esp
 58f:	50                   	push   %eax
 590:	ff 75 08             	pushl  0x8(%ebp)
 593:	e8 e3 fd ff ff       	call   37b <putc>
 598:	83 c4 10             	add    $0x10,%esp
 59b:	eb 25                	jmp    5c2 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 59d:	83 ec 08             	sub    $0x8,%esp
 5a0:	6a 25                	push   $0x25
 5a2:	ff 75 08             	pushl  0x8(%ebp)
 5a5:	e8 d1 fd ff ff       	call   37b <putc>
 5aa:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 5ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b0:	0f be c0             	movsbl %al,%eax
 5b3:	83 ec 08             	sub    $0x8,%esp
 5b6:	50                   	push   %eax
 5b7:	ff 75 08             	pushl  0x8(%ebp)
 5ba:	e8 bc fd ff ff       	call   37b <putc>
 5bf:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5c2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5cd:	8b 55 0c             	mov    0xc(%ebp),%edx
 5d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5d3:	01 d0                	add    %edx,%eax
 5d5:	0f b6 00             	movzbl (%eax),%eax
 5d8:	84 c0                	test   %al,%al
 5da:	0f 85 94 fe ff ff    	jne    474 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5e0:	90                   	nop
 5e1:	c9                   	leave  
 5e2:	c3                   	ret    

000005e3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e3:	55                   	push   %ebp
 5e4:	89 e5                	mov    %esp,%ebp
 5e6:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5e9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ec:	83 e8 08             	sub    $0x8,%eax
 5ef:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f2:	a1 a0 0a 00 00       	mov    0xaa0,%eax
 5f7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5fa:	eb 24                	jmp    620 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5ff:	8b 00                	mov    (%eax),%eax
 601:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 604:	77 12                	ja     618 <free+0x35>
 606:	8b 45 f8             	mov    -0x8(%ebp),%eax
 609:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 60c:	77 24                	ja     632 <free+0x4f>
 60e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 611:	8b 00                	mov    (%eax),%eax
 613:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 616:	77 1a                	ja     632 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 618:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61b:	8b 00                	mov    (%eax),%eax
 61d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 620:	8b 45 f8             	mov    -0x8(%ebp),%eax
 623:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 626:	76 d4                	jbe    5fc <free+0x19>
 628:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62b:	8b 00                	mov    (%eax),%eax
 62d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 630:	76 ca                	jbe    5fc <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 632:	8b 45 f8             	mov    -0x8(%ebp),%eax
 635:	8b 40 04             	mov    0x4(%eax),%eax
 638:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 63f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 642:	01 c2                	add    %eax,%edx
 644:	8b 45 fc             	mov    -0x4(%ebp),%eax
 647:	8b 00                	mov    (%eax),%eax
 649:	39 c2                	cmp    %eax,%edx
 64b:	75 24                	jne    671 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 64d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 650:	8b 50 04             	mov    0x4(%eax),%edx
 653:	8b 45 fc             	mov    -0x4(%ebp),%eax
 656:	8b 00                	mov    (%eax),%eax
 658:	8b 40 04             	mov    0x4(%eax),%eax
 65b:	01 c2                	add    %eax,%edx
 65d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 660:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 663:	8b 45 fc             	mov    -0x4(%ebp),%eax
 666:	8b 00                	mov    (%eax),%eax
 668:	8b 10                	mov    (%eax),%edx
 66a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66d:	89 10                	mov    %edx,(%eax)
 66f:	eb 0a                	jmp    67b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 671:	8b 45 fc             	mov    -0x4(%ebp),%eax
 674:	8b 10                	mov    (%eax),%edx
 676:	8b 45 f8             	mov    -0x8(%ebp),%eax
 679:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 67b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67e:	8b 40 04             	mov    0x4(%eax),%eax
 681:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 688:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68b:	01 d0                	add    %edx,%eax
 68d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 690:	75 20                	jne    6b2 <free+0xcf>
    p->s.size += bp->s.size;
 692:	8b 45 fc             	mov    -0x4(%ebp),%eax
 695:	8b 50 04             	mov    0x4(%eax),%edx
 698:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69b:	8b 40 04             	mov    0x4(%eax),%eax
 69e:	01 c2                	add    %eax,%edx
 6a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a9:	8b 10                	mov    (%eax),%edx
 6ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ae:	89 10                	mov    %edx,(%eax)
 6b0:	eb 08                	jmp    6ba <free+0xd7>
  } else
    p->s.ptr = bp;
 6b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b5:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6b8:	89 10                	mov    %edx,(%eax)
  freep = p;
 6ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bd:	a3 a0 0a 00 00       	mov    %eax,0xaa0
}
 6c2:	90                   	nop
 6c3:	c9                   	leave  
 6c4:	c3                   	ret    

000006c5 <morecore>:

static Header*
morecore(uint nu)
{
 6c5:	55                   	push   %ebp
 6c6:	89 e5                	mov    %esp,%ebp
 6c8:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6cb:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6d2:	77 07                	ja     6db <morecore+0x16>
    nu = 4096;
 6d4:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6db:	8b 45 08             	mov    0x8(%ebp),%eax
 6de:	c1 e0 03             	shl    $0x3,%eax
 6e1:	83 ec 0c             	sub    $0xc,%esp
 6e4:	50                   	push   %eax
 6e5:	e8 79 fc ff ff       	call   363 <sbrk>
 6ea:	83 c4 10             	add    $0x10,%esp
 6ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6f0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6f4:	75 07                	jne    6fd <morecore+0x38>
    return 0;
 6f6:	b8 00 00 00 00       	mov    $0x0,%eax
 6fb:	eb 26                	jmp    723 <morecore+0x5e>
  hp = (Header*)p;
 6fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 700:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 703:	8b 45 f0             	mov    -0x10(%ebp),%eax
 706:	8b 55 08             	mov    0x8(%ebp),%edx
 709:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 70c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 70f:	83 c0 08             	add    $0x8,%eax
 712:	83 ec 0c             	sub    $0xc,%esp
 715:	50                   	push   %eax
 716:	e8 c8 fe ff ff       	call   5e3 <free>
 71b:	83 c4 10             	add    $0x10,%esp
  return freep;
 71e:	a1 a0 0a 00 00       	mov    0xaa0,%eax
}
 723:	c9                   	leave  
 724:	c3                   	ret    

00000725 <malloc>:

void*
malloc(uint nbytes)
{
 725:	55                   	push   %ebp
 726:	89 e5                	mov    %esp,%ebp
 728:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 72b:	8b 45 08             	mov    0x8(%ebp),%eax
 72e:	83 c0 07             	add    $0x7,%eax
 731:	c1 e8 03             	shr    $0x3,%eax
 734:	83 c0 01             	add    $0x1,%eax
 737:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 73a:	a1 a0 0a 00 00       	mov    0xaa0,%eax
 73f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 742:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 746:	75 23                	jne    76b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 748:	c7 45 f0 98 0a 00 00 	movl   $0xa98,-0x10(%ebp)
 74f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 752:	a3 a0 0a 00 00       	mov    %eax,0xaa0
 757:	a1 a0 0a 00 00       	mov    0xaa0,%eax
 75c:	a3 98 0a 00 00       	mov    %eax,0xa98
    base.s.size = 0;
 761:	c7 05 9c 0a 00 00 00 	movl   $0x0,0xa9c
 768:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 76b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76e:	8b 00                	mov    (%eax),%eax
 770:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 773:	8b 45 f4             	mov    -0xc(%ebp),%eax
 776:	8b 40 04             	mov    0x4(%eax),%eax
 779:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 77c:	72 4d                	jb     7cb <malloc+0xa6>
      if(p->s.size == nunits)
 77e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 781:	8b 40 04             	mov    0x4(%eax),%eax
 784:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 787:	75 0c                	jne    795 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 789:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78c:	8b 10                	mov    (%eax),%edx
 78e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 791:	89 10                	mov    %edx,(%eax)
 793:	eb 26                	jmp    7bb <malloc+0x96>
      else {
        p->s.size -= nunits;
 795:	8b 45 f4             	mov    -0xc(%ebp),%eax
 798:	8b 40 04             	mov    0x4(%eax),%eax
 79b:	2b 45 ec             	sub    -0x14(%ebp),%eax
 79e:	89 c2                	mov    %eax,%edx
 7a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a9:	8b 40 04             	mov    0x4(%eax),%eax
 7ac:	c1 e0 03             	shl    $0x3,%eax
 7af:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b5:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7b8:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7be:	a3 a0 0a 00 00       	mov    %eax,0xaa0
      return (void*)(p + 1);
 7c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c6:	83 c0 08             	add    $0x8,%eax
 7c9:	eb 3b                	jmp    806 <malloc+0xe1>
    }
    if(p == freep)
 7cb:	a1 a0 0a 00 00       	mov    0xaa0,%eax
 7d0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7d3:	75 1e                	jne    7f3 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 7d5:	83 ec 0c             	sub    $0xc,%esp
 7d8:	ff 75 ec             	pushl  -0x14(%ebp)
 7db:	e8 e5 fe ff ff       	call   6c5 <morecore>
 7e0:	83 c4 10             	add    $0x10,%esp
 7e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7ea:	75 07                	jne    7f3 <malloc+0xce>
        return 0;
 7ec:	b8 00 00 00 00       	mov    $0x0,%eax
 7f1:	eb 13                	jmp    806 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fc:	8b 00                	mov    (%eax),%eax
 7fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 801:	e9 6d ff ff ff       	jmp    773 <malloc+0x4e>
}
 806:	c9                   	leave  
 807:	c3                   	ret    

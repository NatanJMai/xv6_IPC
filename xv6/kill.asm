
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 10             	sub    $0x10,%esp
  12:	89 cb                	mov    %ecx,%ebx
  int i;

  if(argc < 2){
  14:	83 3b 01             	cmpl   $0x1,(%ebx)
  17:	7f 17                	jg     30 <main+0x30>
    printf(2, "usage: kill pid...\n");
  19:	83 ec 08             	sub    $0x8,%esp
  1c:	68 06 08 00 00       	push   $0x806
  21:	6a 02                	push   $0x2
  23:	e8 28 04 00 00       	call   450 <printf>
  28:	83 c4 10             	add    $0x10,%esp
    exit();
  2b:	e8 a9 02 00 00       	call   2d9 <exit>
  }
  for(i=1; i<argc; i++)
  30:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  37:	eb 2d                	jmp    66 <main+0x66>
    kill(atoi(argv[i]));
  39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  43:	8b 43 04             	mov    0x4(%ebx),%eax
  46:	01 d0                	add    %edx,%eax
  48:	8b 00                	mov    (%eax),%eax
  4a:	83 ec 0c             	sub    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	e8 e4 01 00 00       	call   237 <atoi>
  53:	83 c4 10             	add    $0x10,%esp
  56:	83 ec 0c             	sub    $0xc,%esp
  59:	50                   	push   %eax
  5a:	e8 aa 02 00 00       	call   309 <kill>
  5f:	83 c4 10             	add    $0x10,%esp

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  62:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  66:	8b 45 f4             	mov    -0xc(%ebp),%eax
  69:	3b 03                	cmp    (%ebx),%eax
  6b:	7c cc                	jl     39 <main+0x39>
    kill(atoi(argv[i]));
  exit();
  6d:	e8 67 02 00 00       	call   2d9 <exit>

00000072 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  72:	55                   	push   %ebp
  73:	89 e5                	mov    %esp,%ebp
  75:	57                   	push   %edi
  76:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  77:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7a:	8b 55 10             	mov    0x10(%ebp),%edx
  7d:	8b 45 0c             	mov    0xc(%ebp),%eax
  80:	89 cb                	mov    %ecx,%ebx
  82:	89 df                	mov    %ebx,%edi
  84:	89 d1                	mov    %edx,%ecx
  86:	fc                   	cld    
  87:	f3 aa                	rep stos %al,%es:(%edi)
  89:	89 ca                	mov    %ecx,%edx
  8b:	89 fb                	mov    %edi,%ebx
  8d:	89 5d 08             	mov    %ebx,0x8(%ebp)
  90:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  93:	90                   	nop
  94:	5b                   	pop    %ebx
  95:	5f                   	pop    %edi
  96:	5d                   	pop    %ebp
  97:	c3                   	ret    

00000098 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  98:	55                   	push   %ebp
  99:	89 e5                	mov    %esp,%ebp
  9b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  a4:	90                   	nop
  a5:	8b 45 08             	mov    0x8(%ebp),%eax
  a8:	8d 50 01             	lea    0x1(%eax),%edx
  ab:	89 55 08             	mov    %edx,0x8(%ebp)
  ae:	8b 55 0c             	mov    0xc(%ebp),%edx
  b1:	8d 4a 01             	lea    0x1(%edx),%ecx
  b4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b7:	0f b6 12             	movzbl (%edx),%edx
  ba:	88 10                	mov    %dl,(%eax)
  bc:	0f b6 00             	movzbl (%eax),%eax
  bf:	84 c0                	test   %al,%al
  c1:	75 e2                	jne    a5 <strcpy+0xd>
    ;
  return os;
  c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c6:	c9                   	leave  
  c7:	c3                   	ret    

000000c8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c8:	55                   	push   %ebp
  c9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  cb:	eb 08                	jmp    d5 <strcmp+0xd>
    p++, q++;
  cd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d5:	8b 45 08             	mov    0x8(%ebp),%eax
  d8:	0f b6 00             	movzbl (%eax),%eax
  db:	84 c0                	test   %al,%al
  dd:	74 10                	je     ef <strcmp+0x27>
  df:	8b 45 08             	mov    0x8(%ebp),%eax
  e2:	0f b6 10             	movzbl (%eax),%edx
  e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  e8:	0f b6 00             	movzbl (%eax),%eax
  eb:	38 c2                	cmp    %al,%dl
  ed:	74 de                	je     cd <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  ef:	8b 45 08             	mov    0x8(%ebp),%eax
  f2:	0f b6 00             	movzbl (%eax),%eax
  f5:	0f b6 d0             	movzbl %al,%edx
  f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  fb:	0f b6 00             	movzbl (%eax),%eax
  fe:	0f b6 c0             	movzbl %al,%eax
 101:	29 c2                	sub    %eax,%edx
 103:	89 d0                	mov    %edx,%eax
}
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    

00000107 <strlen>:

uint
strlen(char *s)
{
 107:	55                   	push   %ebp
 108:	89 e5                	mov    %esp,%ebp
 10a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 10d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 114:	eb 04                	jmp    11a <strlen+0x13>
 116:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 11a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 11d:	8b 45 08             	mov    0x8(%ebp),%eax
 120:	01 d0                	add    %edx,%eax
 122:	0f b6 00             	movzbl (%eax),%eax
 125:	84 c0                	test   %al,%al
 127:	75 ed                	jne    116 <strlen+0xf>
    ;
  return n;
 129:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 12c:	c9                   	leave  
 12d:	c3                   	ret    

0000012e <memset>:

void*
memset(void *dst, int c, uint n)
{
 12e:	55                   	push   %ebp
 12f:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 131:	8b 45 10             	mov    0x10(%ebp),%eax
 134:	50                   	push   %eax
 135:	ff 75 0c             	pushl  0xc(%ebp)
 138:	ff 75 08             	pushl  0x8(%ebp)
 13b:	e8 32 ff ff ff       	call   72 <stosb>
 140:	83 c4 0c             	add    $0xc,%esp
  return dst;
 143:	8b 45 08             	mov    0x8(%ebp),%eax
}
 146:	c9                   	leave  
 147:	c3                   	ret    

00000148 <strchr>:

char*
strchr(const char *s, char c)
{
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
 14b:	83 ec 04             	sub    $0x4,%esp
 14e:	8b 45 0c             	mov    0xc(%ebp),%eax
 151:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 154:	eb 14                	jmp    16a <strchr+0x22>
    if(*s == c)
 156:	8b 45 08             	mov    0x8(%ebp),%eax
 159:	0f b6 00             	movzbl (%eax),%eax
 15c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 15f:	75 05                	jne    166 <strchr+0x1e>
      return (char*)s;
 161:	8b 45 08             	mov    0x8(%ebp),%eax
 164:	eb 13                	jmp    179 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 166:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16a:	8b 45 08             	mov    0x8(%ebp),%eax
 16d:	0f b6 00             	movzbl (%eax),%eax
 170:	84 c0                	test   %al,%al
 172:	75 e2                	jne    156 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 174:	b8 00 00 00 00       	mov    $0x0,%eax
}
 179:	c9                   	leave  
 17a:	c3                   	ret    

0000017b <gets>:

char*
gets(char *buf, int max)
{
 17b:	55                   	push   %ebp
 17c:	89 e5                	mov    %esp,%ebp
 17e:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 181:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 188:	eb 42                	jmp    1cc <gets+0x51>
    cc = read(0, &c, 1);
 18a:	83 ec 04             	sub    $0x4,%esp
 18d:	6a 01                	push   $0x1
 18f:	8d 45 ef             	lea    -0x11(%ebp),%eax
 192:	50                   	push   %eax
 193:	6a 00                	push   $0x0
 195:	e8 57 01 00 00       	call   2f1 <read>
 19a:	83 c4 10             	add    $0x10,%esp
 19d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1a4:	7e 33                	jle    1d9 <gets+0x5e>
      break;
    buf[i++] = c;
 1a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1a9:	8d 50 01             	lea    0x1(%eax),%edx
 1ac:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1af:	89 c2                	mov    %eax,%edx
 1b1:	8b 45 08             	mov    0x8(%ebp),%eax
 1b4:	01 c2                	add    %eax,%edx
 1b6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ba:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1bc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c0:	3c 0a                	cmp    $0xa,%al
 1c2:	74 16                	je     1da <gets+0x5f>
 1c4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c8:	3c 0d                	cmp    $0xd,%al
 1ca:	74 0e                	je     1da <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1cf:	83 c0 01             	add    $0x1,%eax
 1d2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1d5:	7c b3                	jl     18a <gets+0xf>
 1d7:	eb 01                	jmp    1da <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1d9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1da:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1dd:	8b 45 08             	mov    0x8(%ebp),%eax
 1e0:	01 d0                	add    %edx,%eax
 1e2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1e8:	c9                   	leave  
 1e9:	c3                   	ret    

000001ea <stat>:

int
stat(char *n, struct stat *st)
{
 1ea:	55                   	push   %ebp
 1eb:	89 e5                	mov    %esp,%ebp
 1ed:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f0:	83 ec 08             	sub    $0x8,%esp
 1f3:	6a 00                	push   $0x0
 1f5:	ff 75 08             	pushl  0x8(%ebp)
 1f8:	e8 1c 01 00 00       	call   319 <open>
 1fd:	83 c4 10             	add    $0x10,%esp
 200:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 203:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 207:	79 07                	jns    210 <stat+0x26>
    return -1;
 209:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 20e:	eb 25                	jmp    235 <stat+0x4b>
  r = fstat(fd, st);
 210:	83 ec 08             	sub    $0x8,%esp
 213:	ff 75 0c             	pushl  0xc(%ebp)
 216:	ff 75 f4             	pushl  -0xc(%ebp)
 219:	e8 13 01 00 00       	call   331 <fstat>
 21e:	83 c4 10             	add    $0x10,%esp
 221:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 224:	83 ec 0c             	sub    $0xc,%esp
 227:	ff 75 f4             	pushl  -0xc(%ebp)
 22a:	e8 d2 00 00 00       	call   301 <close>
 22f:	83 c4 10             	add    $0x10,%esp
  return r;
 232:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 235:	c9                   	leave  
 236:	c3                   	ret    

00000237 <atoi>:

int
atoi(const char *s)
{
 237:	55                   	push   %ebp
 238:	89 e5                	mov    %esp,%ebp
 23a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 23d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 244:	eb 25                	jmp    26b <atoi+0x34>
    n = n*10 + *s++ - '0';
 246:	8b 55 fc             	mov    -0x4(%ebp),%edx
 249:	89 d0                	mov    %edx,%eax
 24b:	c1 e0 02             	shl    $0x2,%eax
 24e:	01 d0                	add    %edx,%eax
 250:	01 c0                	add    %eax,%eax
 252:	89 c1                	mov    %eax,%ecx
 254:	8b 45 08             	mov    0x8(%ebp),%eax
 257:	8d 50 01             	lea    0x1(%eax),%edx
 25a:	89 55 08             	mov    %edx,0x8(%ebp)
 25d:	0f b6 00             	movzbl (%eax),%eax
 260:	0f be c0             	movsbl %al,%eax
 263:	01 c8                	add    %ecx,%eax
 265:	83 e8 30             	sub    $0x30,%eax
 268:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
 26e:	0f b6 00             	movzbl (%eax),%eax
 271:	3c 2f                	cmp    $0x2f,%al
 273:	7e 0a                	jle    27f <atoi+0x48>
 275:	8b 45 08             	mov    0x8(%ebp),%eax
 278:	0f b6 00             	movzbl (%eax),%eax
 27b:	3c 39                	cmp    $0x39,%al
 27d:	7e c7                	jle    246 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 27f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 282:	c9                   	leave  
 283:	c3                   	ret    

00000284 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 290:	8b 45 0c             	mov    0xc(%ebp),%eax
 293:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 296:	eb 17                	jmp    2af <memmove+0x2b>
    *dst++ = *src++;
 298:	8b 45 fc             	mov    -0x4(%ebp),%eax
 29b:	8d 50 01             	lea    0x1(%eax),%edx
 29e:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2a1:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2a4:	8d 4a 01             	lea    0x1(%edx),%ecx
 2a7:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2aa:	0f b6 12             	movzbl (%edx),%edx
 2ad:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2af:	8b 45 10             	mov    0x10(%ebp),%eax
 2b2:	8d 50 ff             	lea    -0x1(%eax),%edx
 2b5:	89 55 10             	mov    %edx,0x10(%ebp)
 2b8:	85 c0                	test   %eax,%eax
 2ba:	7f dc                	jg     298 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2bc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2bf:	c9                   	leave  
 2c0:	c3                   	ret    

000002c1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2c1:	b8 01 00 00 00       	mov    $0x1,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <msend>:
SYSCALL(msend)
 2c9:	b8 16 00 00 00       	mov    $0x16,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <mrcve>:
SYSCALL(mrcve)
 2d1:	b8 17 00 00 00       	mov    $0x17,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <exit>:
SYSCALL(exit)
 2d9:	b8 02 00 00 00       	mov    $0x2,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <wait>:
SYSCALL(wait)
 2e1:	b8 03 00 00 00       	mov    $0x3,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <pipe>:
SYSCALL(pipe)
 2e9:	b8 04 00 00 00       	mov    $0x4,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <read>:
SYSCALL(read)
 2f1:	b8 05 00 00 00       	mov    $0x5,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <write>:
SYSCALL(write)
 2f9:	b8 10 00 00 00       	mov    $0x10,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <close>:
SYSCALL(close)
 301:	b8 15 00 00 00       	mov    $0x15,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <kill>:
SYSCALL(kill)
 309:	b8 06 00 00 00       	mov    $0x6,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <exec>:
SYSCALL(exec)
 311:	b8 07 00 00 00       	mov    $0x7,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <open>:
SYSCALL(open)
 319:	b8 0f 00 00 00       	mov    $0xf,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <mknod>:
SYSCALL(mknod)
 321:	b8 11 00 00 00       	mov    $0x11,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <unlink>:
SYSCALL(unlink)
 329:	b8 12 00 00 00       	mov    $0x12,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <fstat>:
SYSCALL(fstat)
 331:	b8 08 00 00 00       	mov    $0x8,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <link>:
SYSCALL(link)
 339:	b8 13 00 00 00       	mov    $0x13,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <mkdir>:
SYSCALL(mkdir)
 341:	b8 14 00 00 00       	mov    $0x14,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <chdir>:
SYSCALL(chdir)
 349:	b8 09 00 00 00       	mov    $0x9,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <dup>:
SYSCALL(dup)
 351:	b8 0a 00 00 00       	mov    $0xa,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <getpid>:
SYSCALL(getpid)
 359:	b8 0b 00 00 00       	mov    $0xb,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <sbrk>:
SYSCALL(sbrk)
 361:	b8 0c 00 00 00       	mov    $0xc,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <sleep>:
SYSCALL(sleep)
 369:	b8 0d 00 00 00       	mov    $0xd,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <uptime>:
SYSCALL(uptime)
 371:	b8 0e 00 00 00       	mov    $0xe,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 379:	55                   	push   %ebp
 37a:	89 e5                	mov    %esp,%ebp
 37c:	83 ec 18             	sub    $0x18,%esp
 37f:	8b 45 0c             	mov    0xc(%ebp),%eax
 382:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 385:	83 ec 04             	sub    $0x4,%esp
 388:	6a 01                	push   $0x1
 38a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 38d:	50                   	push   %eax
 38e:	ff 75 08             	pushl  0x8(%ebp)
 391:	e8 63 ff ff ff       	call   2f9 <write>
 396:	83 c4 10             	add    $0x10,%esp
}
 399:	90                   	nop
 39a:	c9                   	leave  
 39b:	c3                   	ret    

0000039c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 39c:	55                   	push   %ebp
 39d:	89 e5                	mov    %esp,%ebp
 39f:	53                   	push   %ebx
 3a0:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3a3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3aa:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3ae:	74 17                	je     3c7 <printint+0x2b>
 3b0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3b4:	79 11                	jns    3c7 <printint+0x2b>
    neg = 1;
 3b6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c0:	f7 d8                	neg    %eax
 3c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3c5:	eb 06                	jmp    3cd <printint+0x31>
  } else {
    x = xx;
 3c7:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ca:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3cd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3d4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3d7:	8d 41 01             	lea    0x1(%ecx),%eax
 3da:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3dd:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3e3:	ba 00 00 00 00       	mov    $0x0,%edx
 3e8:	f7 f3                	div    %ebx
 3ea:	89 d0                	mov    %edx,%eax
 3ec:	0f b6 80 70 0a 00 00 	movzbl 0xa70(%eax),%eax
 3f3:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3f7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3fd:	ba 00 00 00 00       	mov    $0x0,%edx
 402:	f7 f3                	div    %ebx
 404:	89 45 ec             	mov    %eax,-0x14(%ebp)
 407:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 40b:	75 c7                	jne    3d4 <printint+0x38>
  if(neg)
 40d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 411:	74 2d                	je     440 <printint+0xa4>
    buf[i++] = '-';
 413:	8b 45 f4             	mov    -0xc(%ebp),%eax
 416:	8d 50 01             	lea    0x1(%eax),%edx
 419:	89 55 f4             	mov    %edx,-0xc(%ebp)
 41c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 421:	eb 1d                	jmp    440 <printint+0xa4>
    putc(fd, buf[i]);
 423:	8d 55 dc             	lea    -0x24(%ebp),%edx
 426:	8b 45 f4             	mov    -0xc(%ebp),%eax
 429:	01 d0                	add    %edx,%eax
 42b:	0f b6 00             	movzbl (%eax),%eax
 42e:	0f be c0             	movsbl %al,%eax
 431:	83 ec 08             	sub    $0x8,%esp
 434:	50                   	push   %eax
 435:	ff 75 08             	pushl  0x8(%ebp)
 438:	e8 3c ff ff ff       	call   379 <putc>
 43d:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 440:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 444:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 448:	79 d9                	jns    423 <printint+0x87>
    putc(fd, buf[i]);
}
 44a:	90                   	nop
 44b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 44e:	c9                   	leave  
 44f:	c3                   	ret    

00000450 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 456:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 45d:	8d 45 0c             	lea    0xc(%ebp),%eax
 460:	83 c0 04             	add    $0x4,%eax
 463:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 466:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 46d:	e9 59 01 00 00       	jmp    5cb <printf+0x17b>
    c = fmt[i] & 0xff;
 472:	8b 55 0c             	mov    0xc(%ebp),%edx
 475:	8b 45 f0             	mov    -0x10(%ebp),%eax
 478:	01 d0                	add    %edx,%eax
 47a:	0f b6 00             	movzbl (%eax),%eax
 47d:	0f be c0             	movsbl %al,%eax
 480:	25 ff 00 00 00       	and    $0xff,%eax
 485:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 488:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 48c:	75 2c                	jne    4ba <printf+0x6a>
      if(c == '%'){
 48e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 492:	75 0c                	jne    4a0 <printf+0x50>
        state = '%';
 494:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 49b:	e9 27 01 00 00       	jmp    5c7 <printf+0x177>
      } else {
        putc(fd, c);
 4a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4a3:	0f be c0             	movsbl %al,%eax
 4a6:	83 ec 08             	sub    $0x8,%esp
 4a9:	50                   	push   %eax
 4aa:	ff 75 08             	pushl  0x8(%ebp)
 4ad:	e8 c7 fe ff ff       	call   379 <putc>
 4b2:	83 c4 10             	add    $0x10,%esp
 4b5:	e9 0d 01 00 00       	jmp    5c7 <printf+0x177>
      }
    } else if(state == '%'){
 4ba:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4be:	0f 85 03 01 00 00    	jne    5c7 <printf+0x177>
      if(c == 'd'){
 4c4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4c8:	75 1e                	jne    4e8 <printf+0x98>
        printint(fd, *ap, 10, 1);
 4ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4cd:	8b 00                	mov    (%eax),%eax
 4cf:	6a 01                	push   $0x1
 4d1:	6a 0a                	push   $0xa
 4d3:	50                   	push   %eax
 4d4:	ff 75 08             	pushl  0x8(%ebp)
 4d7:	e8 c0 fe ff ff       	call   39c <printint>
 4dc:	83 c4 10             	add    $0x10,%esp
        ap++;
 4df:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4e3:	e9 d8 00 00 00       	jmp    5c0 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 4e8:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4ec:	74 06                	je     4f4 <printf+0xa4>
 4ee:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4f2:	75 1e                	jne    512 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4f7:	8b 00                	mov    (%eax),%eax
 4f9:	6a 00                	push   $0x0
 4fb:	6a 10                	push   $0x10
 4fd:	50                   	push   %eax
 4fe:	ff 75 08             	pushl  0x8(%ebp)
 501:	e8 96 fe ff ff       	call   39c <printint>
 506:	83 c4 10             	add    $0x10,%esp
        ap++;
 509:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 50d:	e9 ae 00 00 00       	jmp    5c0 <printf+0x170>
      } else if(c == 's'){
 512:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 516:	75 43                	jne    55b <printf+0x10b>
        s = (char*)*ap;
 518:	8b 45 e8             	mov    -0x18(%ebp),%eax
 51b:	8b 00                	mov    (%eax),%eax
 51d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 520:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 524:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 528:	75 25                	jne    54f <printf+0xff>
          s = "(null)";
 52a:	c7 45 f4 1a 08 00 00 	movl   $0x81a,-0xc(%ebp)
        while(*s != 0){
 531:	eb 1c                	jmp    54f <printf+0xff>
          putc(fd, *s);
 533:	8b 45 f4             	mov    -0xc(%ebp),%eax
 536:	0f b6 00             	movzbl (%eax),%eax
 539:	0f be c0             	movsbl %al,%eax
 53c:	83 ec 08             	sub    $0x8,%esp
 53f:	50                   	push   %eax
 540:	ff 75 08             	pushl  0x8(%ebp)
 543:	e8 31 fe ff ff       	call   379 <putc>
 548:	83 c4 10             	add    $0x10,%esp
          s++;
 54b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 54f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 552:	0f b6 00             	movzbl (%eax),%eax
 555:	84 c0                	test   %al,%al
 557:	75 da                	jne    533 <printf+0xe3>
 559:	eb 65                	jmp    5c0 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 55b:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 55f:	75 1d                	jne    57e <printf+0x12e>
        putc(fd, *ap);
 561:	8b 45 e8             	mov    -0x18(%ebp),%eax
 564:	8b 00                	mov    (%eax),%eax
 566:	0f be c0             	movsbl %al,%eax
 569:	83 ec 08             	sub    $0x8,%esp
 56c:	50                   	push   %eax
 56d:	ff 75 08             	pushl  0x8(%ebp)
 570:	e8 04 fe ff ff       	call   379 <putc>
 575:	83 c4 10             	add    $0x10,%esp
        ap++;
 578:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 57c:	eb 42                	jmp    5c0 <printf+0x170>
      } else if(c == '%'){
 57e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 582:	75 17                	jne    59b <printf+0x14b>
        putc(fd, c);
 584:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 587:	0f be c0             	movsbl %al,%eax
 58a:	83 ec 08             	sub    $0x8,%esp
 58d:	50                   	push   %eax
 58e:	ff 75 08             	pushl  0x8(%ebp)
 591:	e8 e3 fd ff ff       	call   379 <putc>
 596:	83 c4 10             	add    $0x10,%esp
 599:	eb 25                	jmp    5c0 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 59b:	83 ec 08             	sub    $0x8,%esp
 59e:	6a 25                	push   $0x25
 5a0:	ff 75 08             	pushl  0x8(%ebp)
 5a3:	e8 d1 fd ff ff       	call   379 <putc>
 5a8:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 5ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ae:	0f be c0             	movsbl %al,%eax
 5b1:	83 ec 08             	sub    $0x8,%esp
 5b4:	50                   	push   %eax
 5b5:	ff 75 08             	pushl  0x8(%ebp)
 5b8:	e8 bc fd ff ff       	call   379 <putc>
 5bd:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5c0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5cb:	8b 55 0c             	mov    0xc(%ebp),%edx
 5ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5d1:	01 d0                	add    %edx,%eax
 5d3:	0f b6 00             	movzbl (%eax),%eax
 5d6:	84 c0                	test   %al,%al
 5d8:	0f 85 94 fe ff ff    	jne    472 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5de:	90                   	nop
 5df:	c9                   	leave  
 5e0:	c3                   	ret    

000005e1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e1:	55                   	push   %ebp
 5e2:	89 e5                	mov    %esp,%ebp
 5e4:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5e7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ea:	83 e8 08             	sub    $0x8,%eax
 5ed:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f0:	a1 8c 0a 00 00       	mov    0xa8c,%eax
 5f5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5f8:	eb 24                	jmp    61e <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5fd:	8b 00                	mov    (%eax),%eax
 5ff:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 602:	77 12                	ja     616 <free+0x35>
 604:	8b 45 f8             	mov    -0x8(%ebp),%eax
 607:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 60a:	77 24                	ja     630 <free+0x4f>
 60c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60f:	8b 00                	mov    (%eax),%eax
 611:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 614:	77 1a                	ja     630 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 616:	8b 45 fc             	mov    -0x4(%ebp),%eax
 619:	8b 00                	mov    (%eax),%eax
 61b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 61e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 621:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 624:	76 d4                	jbe    5fa <free+0x19>
 626:	8b 45 fc             	mov    -0x4(%ebp),%eax
 629:	8b 00                	mov    (%eax),%eax
 62b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 62e:	76 ca                	jbe    5fa <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 630:	8b 45 f8             	mov    -0x8(%ebp),%eax
 633:	8b 40 04             	mov    0x4(%eax),%eax
 636:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 63d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 640:	01 c2                	add    %eax,%edx
 642:	8b 45 fc             	mov    -0x4(%ebp),%eax
 645:	8b 00                	mov    (%eax),%eax
 647:	39 c2                	cmp    %eax,%edx
 649:	75 24                	jne    66f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 64b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64e:	8b 50 04             	mov    0x4(%eax),%edx
 651:	8b 45 fc             	mov    -0x4(%ebp),%eax
 654:	8b 00                	mov    (%eax),%eax
 656:	8b 40 04             	mov    0x4(%eax),%eax
 659:	01 c2                	add    %eax,%edx
 65b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65e:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 661:	8b 45 fc             	mov    -0x4(%ebp),%eax
 664:	8b 00                	mov    (%eax),%eax
 666:	8b 10                	mov    (%eax),%edx
 668:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66b:	89 10                	mov    %edx,(%eax)
 66d:	eb 0a                	jmp    679 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 66f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 672:	8b 10                	mov    (%eax),%edx
 674:	8b 45 f8             	mov    -0x8(%ebp),%eax
 677:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 679:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67c:	8b 40 04             	mov    0x4(%eax),%eax
 67f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 686:	8b 45 fc             	mov    -0x4(%ebp),%eax
 689:	01 d0                	add    %edx,%eax
 68b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 68e:	75 20                	jne    6b0 <free+0xcf>
    p->s.size += bp->s.size;
 690:	8b 45 fc             	mov    -0x4(%ebp),%eax
 693:	8b 50 04             	mov    0x4(%eax),%edx
 696:	8b 45 f8             	mov    -0x8(%ebp),%eax
 699:	8b 40 04             	mov    0x4(%eax),%eax
 69c:	01 c2                	add    %eax,%edx
 69e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a7:	8b 10                	mov    (%eax),%edx
 6a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ac:	89 10                	mov    %edx,(%eax)
 6ae:	eb 08                	jmp    6b8 <free+0xd7>
  } else
    p->s.ptr = bp;
 6b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6b6:	89 10                	mov    %edx,(%eax)
  freep = p;
 6b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bb:	a3 8c 0a 00 00       	mov    %eax,0xa8c
}
 6c0:	90                   	nop
 6c1:	c9                   	leave  
 6c2:	c3                   	ret    

000006c3 <morecore>:

static Header*
morecore(uint nu)
{
 6c3:	55                   	push   %ebp
 6c4:	89 e5                	mov    %esp,%ebp
 6c6:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6c9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6d0:	77 07                	ja     6d9 <morecore+0x16>
    nu = 4096;
 6d2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
 6dc:	c1 e0 03             	shl    $0x3,%eax
 6df:	83 ec 0c             	sub    $0xc,%esp
 6e2:	50                   	push   %eax
 6e3:	e8 79 fc ff ff       	call   361 <sbrk>
 6e8:	83 c4 10             	add    $0x10,%esp
 6eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6ee:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6f2:	75 07                	jne    6fb <morecore+0x38>
    return 0;
 6f4:	b8 00 00 00 00       	mov    $0x0,%eax
 6f9:	eb 26                	jmp    721 <morecore+0x5e>
  hp = (Header*)p;
 6fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 701:	8b 45 f0             	mov    -0x10(%ebp),%eax
 704:	8b 55 08             	mov    0x8(%ebp),%edx
 707:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 70a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 70d:	83 c0 08             	add    $0x8,%eax
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	50                   	push   %eax
 714:	e8 c8 fe ff ff       	call   5e1 <free>
 719:	83 c4 10             	add    $0x10,%esp
  return freep;
 71c:	a1 8c 0a 00 00       	mov    0xa8c,%eax
}
 721:	c9                   	leave  
 722:	c3                   	ret    

00000723 <malloc>:

void*
malloc(uint nbytes)
{
 723:	55                   	push   %ebp
 724:	89 e5                	mov    %esp,%ebp
 726:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 729:	8b 45 08             	mov    0x8(%ebp),%eax
 72c:	83 c0 07             	add    $0x7,%eax
 72f:	c1 e8 03             	shr    $0x3,%eax
 732:	83 c0 01             	add    $0x1,%eax
 735:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 738:	a1 8c 0a 00 00       	mov    0xa8c,%eax
 73d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 740:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 744:	75 23                	jne    769 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 746:	c7 45 f0 84 0a 00 00 	movl   $0xa84,-0x10(%ebp)
 74d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 750:	a3 8c 0a 00 00       	mov    %eax,0xa8c
 755:	a1 8c 0a 00 00       	mov    0xa8c,%eax
 75a:	a3 84 0a 00 00       	mov    %eax,0xa84
    base.s.size = 0;
 75f:	c7 05 88 0a 00 00 00 	movl   $0x0,0xa88
 766:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 769:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76c:	8b 00                	mov    (%eax),%eax
 76e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 771:	8b 45 f4             	mov    -0xc(%ebp),%eax
 774:	8b 40 04             	mov    0x4(%eax),%eax
 777:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 77a:	72 4d                	jb     7c9 <malloc+0xa6>
      if(p->s.size == nunits)
 77c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77f:	8b 40 04             	mov    0x4(%eax),%eax
 782:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 785:	75 0c                	jne    793 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 787:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78a:	8b 10                	mov    (%eax),%edx
 78c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78f:	89 10                	mov    %edx,(%eax)
 791:	eb 26                	jmp    7b9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 793:	8b 45 f4             	mov    -0xc(%ebp),%eax
 796:	8b 40 04             	mov    0x4(%eax),%eax
 799:	2b 45 ec             	sub    -0x14(%ebp),%eax
 79c:	89 c2                	mov    %eax,%edx
 79e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a7:	8b 40 04             	mov    0x4(%eax),%eax
 7aa:	c1 e0 03             	shl    $0x3,%eax
 7ad:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b3:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7b6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7bc:	a3 8c 0a 00 00       	mov    %eax,0xa8c
      return (void*)(p + 1);
 7c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c4:	83 c0 08             	add    $0x8,%eax
 7c7:	eb 3b                	jmp    804 <malloc+0xe1>
    }
    if(p == freep)
 7c9:	a1 8c 0a 00 00       	mov    0xa8c,%eax
 7ce:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7d1:	75 1e                	jne    7f1 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 7d3:	83 ec 0c             	sub    $0xc,%esp
 7d6:	ff 75 ec             	pushl  -0x14(%ebp)
 7d9:	e8 e5 fe ff ff       	call   6c3 <morecore>
 7de:	83 c4 10             	add    $0x10,%esp
 7e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7e4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7e8:	75 07                	jne    7f1 <malloc+0xce>
        return 0;
 7ea:	b8 00 00 00 00       	mov    $0x0,%eax
 7ef:	eb 13                	jmp    804 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fa:	8b 00                	mov    (%eax),%eax
 7fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7ff:	e9 6d ff ff ff       	jmp    771 <malloc+0x4e>
}
 804:	c9                   	leave  
 805:	c3                   	ret    

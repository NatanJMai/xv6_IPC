
_mkdir:     file format elf32-i386


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
   f:	83 ec 10             	sub    $0x10,%esp
  12:	89 cb                	mov    %ecx,%ebx
  int i;

  if(argc < 2){
  14:	83 3b 01             	cmpl   $0x1,(%ebx)
  17:	7f 17                	jg     30 <main+0x30>
    printf(2, "Usage: mkdir files...\n");
  19:	83 ec 08             	sub    $0x8,%esp
  1c:	68 24 08 00 00       	push   $0x824
  21:	6a 02                	push   $0x2
  23:	e8 46 04 00 00       	call   46e <printf>
  28:	83 c4 10             	add    $0x10,%esp
    exit();
  2b:	e8 c7 02 00 00       	call   2f7 <exit>
  }

  for(i = 1; i < argc; i++){
  30:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  37:	eb 4b                	jmp    84 <main+0x84>
    if(mkdir(argv[i]) < 0){
  39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  43:	8b 43 04             	mov    0x4(%ebx),%eax
  46:	01 d0                	add    %edx,%eax
  48:	8b 00                	mov    (%eax),%eax
  4a:	83 ec 0c             	sub    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	e8 0c 03 00 00       	call   35f <mkdir>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 26                	jns    80 <main+0x80>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  64:	8b 43 04             	mov    0x4(%ebx),%eax
  67:	01 d0                	add    %edx,%eax
  69:	8b 00                	mov    (%eax),%eax
  6b:	83 ec 04             	sub    $0x4,%esp
  6e:	50                   	push   %eax
  6f:	68 3b 08 00 00       	push   $0x83b
  74:	6a 02                	push   $0x2
  76:	e8 f3 03 00 00       	call   46e <printf>
  7b:	83 c4 10             	add    $0x10,%esp
      break;
  7e:	eb 0b                	jmp    8b <main+0x8b>
  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  80:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  87:	3b 03                	cmp    (%ebx),%eax
  89:	7c ae                	jl     39 <main+0x39>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
  8b:	e8 67 02 00 00       	call   2f7 <exit>

00000090 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	57                   	push   %edi
  94:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  95:	8b 4d 08             	mov    0x8(%ebp),%ecx
  98:	8b 55 10             	mov    0x10(%ebp),%edx
  9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  9e:	89 cb                	mov    %ecx,%ebx
  a0:	89 df                	mov    %ebx,%edi
  a2:	89 d1                	mov    %edx,%ecx
  a4:	fc                   	cld    
  a5:	f3 aa                	rep stos %al,%es:(%edi)
  a7:	89 ca                	mov    %ecx,%edx
  a9:	89 fb                	mov    %edi,%ebx
  ab:	89 5d 08             	mov    %ebx,0x8(%ebp)
  ae:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  b1:	90                   	nop
  b2:	5b                   	pop    %ebx
  b3:	5f                   	pop    %edi
  b4:	5d                   	pop    %ebp
  b5:	c3                   	ret    

000000b6 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  b6:	55                   	push   %ebp
  b7:	89 e5                	mov    %esp,%ebp
  b9:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  bc:	8b 45 08             	mov    0x8(%ebp),%eax
  bf:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  c2:	90                   	nop
  c3:	8b 45 08             	mov    0x8(%ebp),%eax
  c6:	8d 50 01             	lea    0x1(%eax),%edx
  c9:	89 55 08             	mov    %edx,0x8(%ebp)
  cc:	8b 55 0c             	mov    0xc(%ebp),%edx
  cf:	8d 4a 01             	lea    0x1(%edx),%ecx
  d2:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  d5:	0f b6 12             	movzbl (%edx),%edx
  d8:	88 10                	mov    %dl,(%eax)
  da:	0f b6 00             	movzbl (%eax),%eax
  dd:	84 c0                	test   %al,%al
  df:	75 e2                	jne    c3 <strcpy+0xd>
    ;
  return os;
  e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e4:	c9                   	leave  
  e5:	c3                   	ret    

000000e6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e6:	55                   	push   %ebp
  e7:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e9:	eb 08                	jmp    f3 <strcmp+0xd>
    p++, q++;
  eb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ef:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 00             	movzbl (%eax),%eax
  f9:	84 c0                	test   %al,%al
  fb:	74 10                	je     10d <strcmp+0x27>
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
 100:	0f b6 10             	movzbl (%eax),%edx
 103:	8b 45 0c             	mov    0xc(%ebp),%eax
 106:	0f b6 00             	movzbl (%eax),%eax
 109:	38 c2                	cmp    %al,%dl
 10b:	74 de                	je     eb <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 10d:	8b 45 08             	mov    0x8(%ebp),%eax
 110:	0f b6 00             	movzbl (%eax),%eax
 113:	0f b6 d0             	movzbl %al,%edx
 116:	8b 45 0c             	mov    0xc(%ebp),%eax
 119:	0f b6 00             	movzbl (%eax),%eax
 11c:	0f b6 c0             	movzbl %al,%eax
 11f:	29 c2                	sub    %eax,%edx
 121:	89 d0                	mov    %edx,%eax
}
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <strlen>:

uint
strlen(char *s)
{
 125:	55                   	push   %ebp
 126:	89 e5                	mov    %esp,%ebp
 128:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 12b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 132:	eb 04                	jmp    138 <strlen+0x13>
 134:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 138:	8b 55 fc             	mov    -0x4(%ebp),%edx
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	01 d0                	add    %edx,%eax
 140:	0f b6 00             	movzbl (%eax),%eax
 143:	84 c0                	test   %al,%al
 145:	75 ed                	jne    134 <strlen+0xf>
    ;
  return n;
 147:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 14a:	c9                   	leave  
 14b:	c3                   	ret    

0000014c <memset>:

void*
memset(void *dst, int c, uint n)
{
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 14f:	8b 45 10             	mov    0x10(%ebp),%eax
 152:	50                   	push   %eax
 153:	ff 75 0c             	pushl  0xc(%ebp)
 156:	ff 75 08             	pushl  0x8(%ebp)
 159:	e8 32 ff ff ff       	call   90 <stosb>
 15e:	83 c4 0c             	add    $0xc,%esp
  return dst;
 161:	8b 45 08             	mov    0x8(%ebp),%eax
}
 164:	c9                   	leave  
 165:	c3                   	ret    

00000166 <strchr>:

char*
strchr(const char *s, char c)
{
 166:	55                   	push   %ebp
 167:	89 e5                	mov    %esp,%ebp
 169:	83 ec 04             	sub    $0x4,%esp
 16c:	8b 45 0c             	mov    0xc(%ebp),%eax
 16f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 172:	eb 14                	jmp    188 <strchr+0x22>
    if(*s == c)
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	0f b6 00             	movzbl (%eax),%eax
 17a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 17d:	75 05                	jne    184 <strchr+0x1e>
      return (char*)s;
 17f:	8b 45 08             	mov    0x8(%ebp),%eax
 182:	eb 13                	jmp    197 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 184:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 188:	8b 45 08             	mov    0x8(%ebp),%eax
 18b:	0f b6 00             	movzbl (%eax),%eax
 18e:	84 c0                	test   %al,%al
 190:	75 e2                	jne    174 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 192:	b8 00 00 00 00       	mov    $0x0,%eax
}
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <gets>:

char*
gets(char *buf, int max)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1a6:	eb 42                	jmp    1ea <gets+0x51>
    cc = read(0, &c, 1);
 1a8:	83 ec 04             	sub    $0x4,%esp
 1ab:	6a 01                	push   $0x1
 1ad:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1b0:	50                   	push   %eax
 1b1:	6a 00                	push   $0x0
 1b3:	e8 57 01 00 00       	call   30f <read>
 1b8:	83 c4 10             	add    $0x10,%esp
 1bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1be:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1c2:	7e 33                	jle    1f7 <gets+0x5e>
      break;
    buf[i++] = c;
 1c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c7:	8d 50 01             	lea    0x1(%eax),%edx
 1ca:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1cd:	89 c2                	mov    %eax,%edx
 1cf:	8b 45 08             	mov    0x8(%ebp),%eax
 1d2:	01 c2                	add    %eax,%edx
 1d4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d8:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1da:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1de:	3c 0a                	cmp    $0xa,%al
 1e0:	74 16                	je     1f8 <gets+0x5f>
 1e2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e6:	3c 0d                	cmp    $0xd,%al
 1e8:	74 0e                	je     1f8 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ed:	83 c0 01             	add    $0x1,%eax
 1f0:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1f3:	7c b3                	jl     1a8 <gets+0xf>
 1f5:	eb 01                	jmp    1f8 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1f7:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1f8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
 1fe:	01 d0                	add    %edx,%eax
 200:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 203:	8b 45 08             	mov    0x8(%ebp),%eax
}
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <stat>:

int
stat(char *n, struct stat *st)
{
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
 20b:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 20e:	83 ec 08             	sub    $0x8,%esp
 211:	6a 00                	push   $0x0
 213:	ff 75 08             	pushl  0x8(%ebp)
 216:	e8 1c 01 00 00       	call   337 <open>
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 221:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 225:	79 07                	jns    22e <stat+0x26>
    return -1;
 227:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 22c:	eb 25                	jmp    253 <stat+0x4b>
  r = fstat(fd, st);
 22e:	83 ec 08             	sub    $0x8,%esp
 231:	ff 75 0c             	pushl  0xc(%ebp)
 234:	ff 75 f4             	pushl  -0xc(%ebp)
 237:	e8 13 01 00 00       	call   34f <fstat>
 23c:	83 c4 10             	add    $0x10,%esp
 23f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 242:	83 ec 0c             	sub    $0xc,%esp
 245:	ff 75 f4             	pushl  -0xc(%ebp)
 248:	e8 d2 00 00 00       	call   31f <close>
 24d:	83 c4 10             	add    $0x10,%esp
  return r;
 250:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 253:	c9                   	leave  
 254:	c3                   	ret    

00000255 <atoi>:

int
atoi(const char *s)
{
 255:	55                   	push   %ebp
 256:	89 e5                	mov    %esp,%ebp
 258:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 25b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 262:	eb 25                	jmp    289 <atoi+0x34>
    n = n*10 + *s++ - '0';
 264:	8b 55 fc             	mov    -0x4(%ebp),%edx
 267:	89 d0                	mov    %edx,%eax
 269:	c1 e0 02             	shl    $0x2,%eax
 26c:	01 d0                	add    %edx,%eax
 26e:	01 c0                	add    %eax,%eax
 270:	89 c1                	mov    %eax,%ecx
 272:	8b 45 08             	mov    0x8(%ebp),%eax
 275:	8d 50 01             	lea    0x1(%eax),%edx
 278:	89 55 08             	mov    %edx,0x8(%ebp)
 27b:	0f b6 00             	movzbl (%eax),%eax
 27e:	0f be c0             	movsbl %al,%eax
 281:	01 c8                	add    %ecx,%eax
 283:	83 e8 30             	sub    $0x30,%eax
 286:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 289:	8b 45 08             	mov    0x8(%ebp),%eax
 28c:	0f b6 00             	movzbl (%eax),%eax
 28f:	3c 2f                	cmp    $0x2f,%al
 291:	7e 0a                	jle    29d <atoi+0x48>
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	0f b6 00             	movzbl (%eax),%eax
 299:	3c 39                	cmp    $0x39,%al
 29b:	7e c7                	jle    264 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 29d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2a0:	c9                   	leave  
 2a1:	c3                   	ret    

000002a2 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2a2:	55                   	push   %ebp
 2a3:	89 e5                	mov    %esp,%ebp
 2a5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2b4:	eb 17                	jmp    2cd <memmove+0x2b>
    *dst++ = *src++;
 2b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2b9:	8d 50 01             	lea    0x1(%eax),%edx
 2bc:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2bf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2c2:	8d 4a 01             	lea    0x1(%edx),%ecx
 2c5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2c8:	0f b6 12             	movzbl (%edx),%edx
 2cb:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2cd:	8b 45 10             	mov    0x10(%ebp),%eax
 2d0:	8d 50 ff             	lea    -0x1(%eax),%edx
 2d3:	89 55 10             	mov    %edx,0x10(%ebp)
 2d6:	85 c0                	test   %eax,%eax
 2d8:	7f dc                	jg     2b6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2dd:	c9                   	leave  
 2de:	c3                   	ret    

000002df <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2df:	b8 01 00 00 00       	mov    $0x1,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <msend>:
SYSCALL(msend)
 2e7:	b8 16 00 00 00       	mov    $0x16,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <mrcve>:
SYSCALL(mrcve)
 2ef:	b8 17 00 00 00       	mov    $0x17,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <exit>:
SYSCALL(exit)
 2f7:	b8 02 00 00 00       	mov    $0x2,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <wait>:
SYSCALL(wait)
 2ff:	b8 03 00 00 00       	mov    $0x3,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <pipe>:
SYSCALL(pipe)
 307:	b8 04 00 00 00       	mov    $0x4,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <read>:
SYSCALL(read)
 30f:	b8 05 00 00 00       	mov    $0x5,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <write>:
SYSCALL(write)
 317:	b8 10 00 00 00       	mov    $0x10,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <close>:
SYSCALL(close)
 31f:	b8 15 00 00 00       	mov    $0x15,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <kill>:
SYSCALL(kill)
 327:	b8 06 00 00 00       	mov    $0x6,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <exec>:
SYSCALL(exec)
 32f:	b8 07 00 00 00       	mov    $0x7,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <open>:
SYSCALL(open)
 337:	b8 0f 00 00 00       	mov    $0xf,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <mknod>:
SYSCALL(mknod)
 33f:	b8 11 00 00 00       	mov    $0x11,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <unlink>:
SYSCALL(unlink)
 347:	b8 12 00 00 00       	mov    $0x12,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <fstat>:
SYSCALL(fstat)
 34f:	b8 08 00 00 00       	mov    $0x8,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <link>:
SYSCALL(link)
 357:	b8 13 00 00 00       	mov    $0x13,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <mkdir>:
SYSCALL(mkdir)
 35f:	b8 14 00 00 00       	mov    $0x14,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <chdir>:
SYSCALL(chdir)
 367:	b8 09 00 00 00       	mov    $0x9,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <dup>:
SYSCALL(dup)
 36f:	b8 0a 00 00 00       	mov    $0xa,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <getpid>:
SYSCALL(getpid)
 377:	b8 0b 00 00 00       	mov    $0xb,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <sbrk>:
SYSCALL(sbrk)
 37f:	b8 0c 00 00 00       	mov    $0xc,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <sleep>:
SYSCALL(sleep)
 387:	b8 0d 00 00 00       	mov    $0xd,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <uptime>:
SYSCALL(uptime)
 38f:	b8 0e 00 00 00       	mov    $0xe,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 397:	55                   	push   %ebp
 398:	89 e5                	mov    %esp,%ebp
 39a:	83 ec 18             	sub    $0x18,%esp
 39d:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a0:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3a3:	83 ec 04             	sub    $0x4,%esp
 3a6:	6a 01                	push   $0x1
 3a8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3ab:	50                   	push   %eax
 3ac:	ff 75 08             	pushl  0x8(%ebp)
 3af:	e8 63 ff ff ff       	call   317 <write>
 3b4:	83 c4 10             	add    $0x10,%esp
}
 3b7:	90                   	nop
 3b8:	c9                   	leave  
 3b9:	c3                   	ret    

000003ba <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	53                   	push   %ebx
 3be:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3c1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3c8:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3cc:	74 17                	je     3e5 <printint+0x2b>
 3ce:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3d2:	79 11                	jns    3e5 <printint+0x2b>
    neg = 1;
 3d4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3db:	8b 45 0c             	mov    0xc(%ebp),%eax
 3de:	f7 d8                	neg    %eax
 3e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3e3:	eb 06                	jmp    3eb <printint+0x31>
  } else {
    x = xx;
 3e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3eb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3f2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3f5:	8d 41 01             	lea    0x1(%ecx),%eax
 3f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3fb:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
 401:	ba 00 00 00 00       	mov    $0x0,%edx
 406:	f7 f3                	div    %ebx
 408:	89 d0                	mov    %edx,%eax
 40a:	0f b6 80 ac 0a 00 00 	movzbl 0xaac(%eax),%eax
 411:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 415:	8b 5d 10             	mov    0x10(%ebp),%ebx
 418:	8b 45 ec             	mov    -0x14(%ebp),%eax
 41b:	ba 00 00 00 00       	mov    $0x0,%edx
 420:	f7 f3                	div    %ebx
 422:	89 45 ec             	mov    %eax,-0x14(%ebp)
 425:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 429:	75 c7                	jne    3f2 <printint+0x38>
  if(neg)
 42b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 42f:	74 2d                	je     45e <printint+0xa4>
    buf[i++] = '-';
 431:	8b 45 f4             	mov    -0xc(%ebp),%eax
 434:	8d 50 01             	lea    0x1(%eax),%edx
 437:	89 55 f4             	mov    %edx,-0xc(%ebp)
 43a:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 43f:	eb 1d                	jmp    45e <printint+0xa4>
    putc(fd, buf[i]);
 441:	8d 55 dc             	lea    -0x24(%ebp),%edx
 444:	8b 45 f4             	mov    -0xc(%ebp),%eax
 447:	01 d0                	add    %edx,%eax
 449:	0f b6 00             	movzbl (%eax),%eax
 44c:	0f be c0             	movsbl %al,%eax
 44f:	83 ec 08             	sub    $0x8,%esp
 452:	50                   	push   %eax
 453:	ff 75 08             	pushl  0x8(%ebp)
 456:	e8 3c ff ff ff       	call   397 <putc>
 45b:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 45e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 462:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 466:	79 d9                	jns    441 <printint+0x87>
    putc(fd, buf[i]);
}
 468:	90                   	nop
 469:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 46c:	c9                   	leave  
 46d:	c3                   	ret    

0000046e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 46e:	55                   	push   %ebp
 46f:	89 e5                	mov    %esp,%ebp
 471:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 474:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 47b:	8d 45 0c             	lea    0xc(%ebp),%eax
 47e:	83 c0 04             	add    $0x4,%eax
 481:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 484:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 48b:	e9 59 01 00 00       	jmp    5e9 <printf+0x17b>
    c = fmt[i] & 0xff;
 490:	8b 55 0c             	mov    0xc(%ebp),%edx
 493:	8b 45 f0             	mov    -0x10(%ebp),%eax
 496:	01 d0                	add    %edx,%eax
 498:	0f b6 00             	movzbl (%eax),%eax
 49b:	0f be c0             	movsbl %al,%eax
 49e:	25 ff 00 00 00       	and    $0xff,%eax
 4a3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4a6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4aa:	75 2c                	jne    4d8 <printf+0x6a>
      if(c == '%'){
 4ac:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4b0:	75 0c                	jne    4be <printf+0x50>
        state = '%';
 4b2:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4b9:	e9 27 01 00 00       	jmp    5e5 <printf+0x177>
      } else {
        putc(fd, c);
 4be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4c1:	0f be c0             	movsbl %al,%eax
 4c4:	83 ec 08             	sub    $0x8,%esp
 4c7:	50                   	push   %eax
 4c8:	ff 75 08             	pushl  0x8(%ebp)
 4cb:	e8 c7 fe ff ff       	call   397 <putc>
 4d0:	83 c4 10             	add    $0x10,%esp
 4d3:	e9 0d 01 00 00       	jmp    5e5 <printf+0x177>
      }
    } else if(state == '%'){
 4d8:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4dc:	0f 85 03 01 00 00    	jne    5e5 <printf+0x177>
      if(c == 'd'){
 4e2:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4e6:	75 1e                	jne    506 <printf+0x98>
        printint(fd, *ap, 10, 1);
 4e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4eb:	8b 00                	mov    (%eax),%eax
 4ed:	6a 01                	push   $0x1
 4ef:	6a 0a                	push   $0xa
 4f1:	50                   	push   %eax
 4f2:	ff 75 08             	pushl  0x8(%ebp)
 4f5:	e8 c0 fe ff ff       	call   3ba <printint>
 4fa:	83 c4 10             	add    $0x10,%esp
        ap++;
 4fd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 501:	e9 d8 00 00 00       	jmp    5de <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 506:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 50a:	74 06                	je     512 <printf+0xa4>
 50c:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 510:	75 1e                	jne    530 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 512:	8b 45 e8             	mov    -0x18(%ebp),%eax
 515:	8b 00                	mov    (%eax),%eax
 517:	6a 00                	push   $0x0
 519:	6a 10                	push   $0x10
 51b:	50                   	push   %eax
 51c:	ff 75 08             	pushl  0x8(%ebp)
 51f:	e8 96 fe ff ff       	call   3ba <printint>
 524:	83 c4 10             	add    $0x10,%esp
        ap++;
 527:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 52b:	e9 ae 00 00 00       	jmp    5de <printf+0x170>
      } else if(c == 's'){
 530:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 534:	75 43                	jne    579 <printf+0x10b>
        s = (char*)*ap;
 536:	8b 45 e8             	mov    -0x18(%ebp),%eax
 539:	8b 00                	mov    (%eax),%eax
 53b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 53e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 542:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 546:	75 25                	jne    56d <printf+0xff>
          s = "(null)";
 548:	c7 45 f4 57 08 00 00 	movl   $0x857,-0xc(%ebp)
        while(*s != 0){
 54f:	eb 1c                	jmp    56d <printf+0xff>
          putc(fd, *s);
 551:	8b 45 f4             	mov    -0xc(%ebp),%eax
 554:	0f b6 00             	movzbl (%eax),%eax
 557:	0f be c0             	movsbl %al,%eax
 55a:	83 ec 08             	sub    $0x8,%esp
 55d:	50                   	push   %eax
 55e:	ff 75 08             	pushl  0x8(%ebp)
 561:	e8 31 fe ff ff       	call   397 <putc>
 566:	83 c4 10             	add    $0x10,%esp
          s++;
 569:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 56d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 570:	0f b6 00             	movzbl (%eax),%eax
 573:	84 c0                	test   %al,%al
 575:	75 da                	jne    551 <printf+0xe3>
 577:	eb 65                	jmp    5de <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 579:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 57d:	75 1d                	jne    59c <printf+0x12e>
        putc(fd, *ap);
 57f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 582:	8b 00                	mov    (%eax),%eax
 584:	0f be c0             	movsbl %al,%eax
 587:	83 ec 08             	sub    $0x8,%esp
 58a:	50                   	push   %eax
 58b:	ff 75 08             	pushl  0x8(%ebp)
 58e:	e8 04 fe ff ff       	call   397 <putc>
 593:	83 c4 10             	add    $0x10,%esp
        ap++;
 596:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 59a:	eb 42                	jmp    5de <printf+0x170>
      } else if(c == '%'){
 59c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5a0:	75 17                	jne    5b9 <printf+0x14b>
        putc(fd, c);
 5a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5a5:	0f be c0             	movsbl %al,%eax
 5a8:	83 ec 08             	sub    $0x8,%esp
 5ab:	50                   	push   %eax
 5ac:	ff 75 08             	pushl  0x8(%ebp)
 5af:	e8 e3 fd ff ff       	call   397 <putc>
 5b4:	83 c4 10             	add    $0x10,%esp
 5b7:	eb 25                	jmp    5de <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5b9:	83 ec 08             	sub    $0x8,%esp
 5bc:	6a 25                	push   $0x25
 5be:	ff 75 08             	pushl  0x8(%ebp)
 5c1:	e8 d1 fd ff ff       	call   397 <putc>
 5c6:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 5c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5cc:	0f be c0             	movsbl %al,%eax
 5cf:	83 ec 08             	sub    $0x8,%esp
 5d2:	50                   	push   %eax
 5d3:	ff 75 08             	pushl  0x8(%ebp)
 5d6:	e8 bc fd ff ff       	call   397 <putc>
 5db:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5de:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5e5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5e9:	8b 55 0c             	mov    0xc(%ebp),%edx
 5ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5ef:	01 d0                	add    %edx,%eax
 5f1:	0f b6 00             	movzbl (%eax),%eax
 5f4:	84 c0                	test   %al,%al
 5f6:	0f 85 94 fe ff ff    	jne    490 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5fc:	90                   	nop
 5fd:	c9                   	leave  
 5fe:	c3                   	ret    

000005ff <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5ff:	55                   	push   %ebp
 600:	89 e5                	mov    %esp,%ebp
 602:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 605:	8b 45 08             	mov    0x8(%ebp),%eax
 608:	83 e8 08             	sub    $0x8,%eax
 60b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 60e:	a1 c8 0a 00 00       	mov    0xac8,%eax
 613:	89 45 fc             	mov    %eax,-0x4(%ebp)
 616:	eb 24                	jmp    63c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 618:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61b:	8b 00                	mov    (%eax),%eax
 61d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 620:	77 12                	ja     634 <free+0x35>
 622:	8b 45 f8             	mov    -0x8(%ebp),%eax
 625:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 628:	77 24                	ja     64e <free+0x4f>
 62a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62d:	8b 00                	mov    (%eax),%eax
 62f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 632:	77 1a                	ja     64e <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 634:	8b 45 fc             	mov    -0x4(%ebp),%eax
 637:	8b 00                	mov    (%eax),%eax
 639:	89 45 fc             	mov    %eax,-0x4(%ebp)
 63c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 642:	76 d4                	jbe    618 <free+0x19>
 644:	8b 45 fc             	mov    -0x4(%ebp),%eax
 647:	8b 00                	mov    (%eax),%eax
 649:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 64c:	76 ca                	jbe    618 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 64e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 651:	8b 40 04             	mov    0x4(%eax),%eax
 654:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 65b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65e:	01 c2                	add    %eax,%edx
 660:	8b 45 fc             	mov    -0x4(%ebp),%eax
 663:	8b 00                	mov    (%eax),%eax
 665:	39 c2                	cmp    %eax,%edx
 667:	75 24                	jne    68d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 669:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66c:	8b 50 04             	mov    0x4(%eax),%edx
 66f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 672:	8b 00                	mov    (%eax),%eax
 674:	8b 40 04             	mov    0x4(%eax),%eax
 677:	01 c2                	add    %eax,%edx
 679:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 67f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 682:	8b 00                	mov    (%eax),%eax
 684:	8b 10                	mov    (%eax),%edx
 686:	8b 45 f8             	mov    -0x8(%ebp),%eax
 689:	89 10                	mov    %edx,(%eax)
 68b:	eb 0a                	jmp    697 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 68d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 690:	8b 10                	mov    (%eax),%edx
 692:	8b 45 f8             	mov    -0x8(%ebp),%eax
 695:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 697:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69a:	8b 40 04             	mov    0x4(%eax),%eax
 69d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a7:	01 d0                	add    %edx,%eax
 6a9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6ac:	75 20                	jne    6ce <free+0xcf>
    p->s.size += bp->s.size;
 6ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b1:	8b 50 04             	mov    0x4(%eax),%edx
 6b4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b7:	8b 40 04             	mov    0x4(%eax),%eax
 6ba:	01 c2                	add    %eax,%edx
 6bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c5:	8b 10                	mov    (%eax),%edx
 6c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ca:	89 10                	mov    %edx,(%eax)
 6cc:	eb 08                	jmp    6d6 <free+0xd7>
  } else
    p->s.ptr = bp;
 6ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d1:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6d4:	89 10                	mov    %edx,(%eax)
  freep = p;
 6d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d9:	a3 c8 0a 00 00       	mov    %eax,0xac8
}
 6de:	90                   	nop
 6df:	c9                   	leave  
 6e0:	c3                   	ret    

000006e1 <morecore>:

static Header*
morecore(uint nu)
{
 6e1:	55                   	push   %ebp
 6e2:	89 e5                	mov    %esp,%ebp
 6e4:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6e7:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6ee:	77 07                	ja     6f7 <morecore+0x16>
    nu = 4096;
 6f0:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6f7:	8b 45 08             	mov    0x8(%ebp),%eax
 6fa:	c1 e0 03             	shl    $0x3,%eax
 6fd:	83 ec 0c             	sub    $0xc,%esp
 700:	50                   	push   %eax
 701:	e8 79 fc ff ff       	call   37f <sbrk>
 706:	83 c4 10             	add    $0x10,%esp
 709:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 70c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 710:	75 07                	jne    719 <morecore+0x38>
    return 0;
 712:	b8 00 00 00 00       	mov    $0x0,%eax
 717:	eb 26                	jmp    73f <morecore+0x5e>
  hp = (Header*)p;
 719:	8b 45 f4             	mov    -0xc(%ebp),%eax
 71c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 71f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 722:	8b 55 08             	mov    0x8(%ebp),%edx
 725:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 728:	8b 45 f0             	mov    -0x10(%ebp),%eax
 72b:	83 c0 08             	add    $0x8,%eax
 72e:	83 ec 0c             	sub    $0xc,%esp
 731:	50                   	push   %eax
 732:	e8 c8 fe ff ff       	call   5ff <free>
 737:	83 c4 10             	add    $0x10,%esp
  return freep;
 73a:	a1 c8 0a 00 00       	mov    0xac8,%eax
}
 73f:	c9                   	leave  
 740:	c3                   	ret    

00000741 <malloc>:

void*
malloc(uint nbytes)
{
 741:	55                   	push   %ebp
 742:	89 e5                	mov    %esp,%ebp
 744:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 747:	8b 45 08             	mov    0x8(%ebp),%eax
 74a:	83 c0 07             	add    $0x7,%eax
 74d:	c1 e8 03             	shr    $0x3,%eax
 750:	83 c0 01             	add    $0x1,%eax
 753:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 756:	a1 c8 0a 00 00       	mov    0xac8,%eax
 75b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 75e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 762:	75 23                	jne    787 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 764:	c7 45 f0 c0 0a 00 00 	movl   $0xac0,-0x10(%ebp)
 76b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76e:	a3 c8 0a 00 00       	mov    %eax,0xac8
 773:	a1 c8 0a 00 00       	mov    0xac8,%eax
 778:	a3 c0 0a 00 00       	mov    %eax,0xac0
    base.s.size = 0;
 77d:	c7 05 c4 0a 00 00 00 	movl   $0x0,0xac4
 784:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 787:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78a:	8b 00                	mov    (%eax),%eax
 78c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 78f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 792:	8b 40 04             	mov    0x4(%eax),%eax
 795:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 798:	72 4d                	jb     7e7 <malloc+0xa6>
      if(p->s.size == nunits)
 79a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79d:	8b 40 04             	mov    0x4(%eax),%eax
 7a0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7a3:	75 0c                	jne    7b1 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a8:	8b 10                	mov    (%eax),%edx
 7aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ad:	89 10                	mov    %edx,(%eax)
 7af:	eb 26                	jmp    7d7 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b4:	8b 40 04             	mov    0x4(%eax),%eax
 7b7:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7ba:	89 c2                	mov    %eax,%edx
 7bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bf:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c5:	8b 40 04             	mov    0x4(%eax),%eax
 7c8:	c1 e0 03             	shl    $0x3,%eax
 7cb:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d1:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7d4:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7da:	a3 c8 0a 00 00       	mov    %eax,0xac8
      return (void*)(p + 1);
 7df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e2:	83 c0 08             	add    $0x8,%eax
 7e5:	eb 3b                	jmp    822 <malloc+0xe1>
    }
    if(p == freep)
 7e7:	a1 c8 0a 00 00       	mov    0xac8,%eax
 7ec:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7ef:	75 1e                	jne    80f <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 7f1:	83 ec 0c             	sub    $0xc,%esp
 7f4:	ff 75 ec             	pushl  -0x14(%ebp)
 7f7:	e8 e5 fe ff ff       	call   6e1 <morecore>
 7fc:	83 c4 10             	add    $0x10,%esp
 7ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
 802:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 806:	75 07                	jne    80f <malloc+0xce>
        return 0;
 808:	b8 00 00 00 00       	mov    $0x0,%eax
 80d:	eb 13                	jmp    822 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 80f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 812:	89 45 f0             	mov    %eax,-0x10(%ebp)
 815:	8b 45 f4             	mov    -0xc(%ebp),%eax
 818:	8b 00                	mov    (%eax),%eax
 81a:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 81d:	e9 6d ff ff ff       	jmp    78f <malloc+0x4e>
}
 822:	c9                   	leave  
 823:	c3                   	ret    

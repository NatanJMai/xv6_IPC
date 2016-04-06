
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
   6:	eb 15                	jmp    1d <cat+0x1d>
    write(1, buf, n);
   8:	83 ec 04             	sub    $0x4,%esp
   b:	ff 75 f4             	pushl  -0xc(%ebp)
   e:	68 80 0b 00 00       	push   $0xb80
  13:	6a 01                	push   $0x1
  15:	e8 7c 03 00 00       	call   396 <write>
  1a:	83 c4 10             	add    $0x10,%esp
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
  1d:	83 ec 04             	sub    $0x4,%esp
  20:	68 00 02 00 00       	push   $0x200
  25:	68 80 0b 00 00       	push   $0xb80
  2a:	ff 75 08             	pushl  0x8(%ebp)
  2d:	e8 5c 03 00 00       	call   38e <read>
  32:	83 c4 10             	add    $0x10,%esp
  35:	89 45 f4             	mov    %eax,-0xc(%ebp)
  38:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3c:	7f ca                	jg     8 <cat+0x8>
    write(1, buf, n);
  if(n < 0){
  3e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  42:	79 17                	jns    5b <cat+0x5b>
    printf(1, "cat: read error\n");
  44:	83 ec 08             	sub    $0x8,%esp
  47:	68 a3 08 00 00       	push   $0x8a3
  4c:	6a 01                	push   $0x1
  4e:	e8 9a 04 00 00       	call   4ed <printf>
  53:	83 c4 10             	add    $0x10,%esp
    exit();
  56:	e8 1b 03 00 00       	call   376 <exit>
  }
}
  5b:	90                   	nop
  5c:	c9                   	leave  
  5d:	c3                   	ret    

0000005e <main>:

int
main(int argc, char *argv[])
{
  5e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  62:	83 e4 f0             	and    $0xfffffff0,%esp
  65:	ff 71 fc             	pushl  -0x4(%ecx)
  68:	55                   	push   %ebp
  69:	89 e5                	mov    %esp,%ebp
  6b:	53                   	push   %ebx
  6c:	51                   	push   %ecx
  6d:	83 ec 10             	sub    $0x10,%esp
  70:	89 cb                	mov    %ecx,%ebx
  int fd, i;

  if(argc <= 1){
  72:	83 3b 01             	cmpl   $0x1,(%ebx)
  75:	7f 12                	jg     89 <main+0x2b>
    cat(0);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	6a 00                	push   $0x0
  7c:	e8 7f ff ff ff       	call   0 <cat>
  81:	83 c4 10             	add    $0x10,%esp
    exit();
  84:	e8 ed 02 00 00       	call   376 <exit>
  }

  for(i = 1; i < argc; i++){
  89:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  90:	eb 71                	jmp    103 <main+0xa5>
    if((fd = open(argv[i], 0)) < 0){
  92:	8b 45 f4             	mov    -0xc(%ebp),%eax
  95:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  9c:	8b 43 04             	mov    0x4(%ebx),%eax
  9f:	01 d0                	add    %edx,%eax
  a1:	8b 00                	mov    (%eax),%eax
  a3:	83 ec 08             	sub    $0x8,%esp
  a6:	6a 00                	push   $0x0
  a8:	50                   	push   %eax
  a9:	e8 08 03 00 00       	call   3b6 <open>
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  b8:	79 29                	jns    e3 <main+0x85>
      printf(1, "cat: cannot open %s\n", argv[i]);
  ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  bd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c4:	8b 43 04             	mov    0x4(%ebx),%eax
  c7:	01 d0                	add    %edx,%eax
  c9:	8b 00                	mov    (%eax),%eax
  cb:	83 ec 04             	sub    $0x4,%esp
  ce:	50                   	push   %eax
  cf:	68 b4 08 00 00       	push   $0x8b4
  d4:	6a 01                	push   $0x1
  d6:	e8 12 04 00 00       	call   4ed <printf>
  db:	83 c4 10             	add    $0x10,%esp
      exit();
  de:	e8 93 02 00 00       	call   376 <exit>
    }
    cat(fd);
  e3:	83 ec 0c             	sub    $0xc,%esp
  e6:	ff 75 f0             	pushl  -0x10(%ebp)
  e9:	e8 12 ff ff ff       	call   0 <cat>
  ee:	83 c4 10             	add    $0x10,%esp
    close(fd);
  f1:	83 ec 0c             	sub    $0xc,%esp
  f4:	ff 75 f0             	pushl  -0x10(%ebp)
  f7:	e8 a2 02 00 00       	call   39e <close>
  fc:	83 c4 10             	add    $0x10,%esp
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 103:	8b 45 f4             	mov    -0xc(%ebp),%eax
 106:	3b 03                	cmp    (%ebx),%eax
 108:	7c 88                	jl     92 <main+0x34>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
 10a:	e8 67 02 00 00       	call   376 <exit>

0000010f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	57                   	push   %edi
 113:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 114:	8b 4d 08             	mov    0x8(%ebp),%ecx
 117:	8b 55 10             	mov    0x10(%ebp),%edx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 cb                	mov    %ecx,%ebx
 11f:	89 df                	mov    %ebx,%edi
 121:	89 d1                	mov    %edx,%ecx
 123:	fc                   	cld    
 124:	f3 aa                	rep stos %al,%es:(%edi)
 126:	89 ca                	mov    %ecx,%edx
 128:	89 fb                	mov    %edi,%ebx
 12a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 12d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 130:	90                   	nop
 131:	5b                   	pop    %ebx
 132:	5f                   	pop    %edi
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    

00000135 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 141:	90                   	nop
 142:	8b 45 08             	mov    0x8(%ebp),%eax
 145:	8d 50 01             	lea    0x1(%eax),%edx
 148:	89 55 08             	mov    %edx,0x8(%ebp)
 14b:	8b 55 0c             	mov    0xc(%ebp),%edx
 14e:	8d 4a 01             	lea    0x1(%edx),%ecx
 151:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 154:	0f b6 12             	movzbl (%edx),%edx
 157:	88 10                	mov    %dl,(%eax)
 159:	0f b6 00             	movzbl (%eax),%eax
 15c:	84 c0                	test   %al,%al
 15e:	75 e2                	jne    142 <strcpy+0xd>
    ;
  return os;
 160:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 163:	c9                   	leave  
 164:	c3                   	ret    

00000165 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 165:	55                   	push   %ebp
 166:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 168:	eb 08                	jmp    172 <strcmp+0xd>
    p++, q++;
 16a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 172:	8b 45 08             	mov    0x8(%ebp),%eax
 175:	0f b6 00             	movzbl (%eax),%eax
 178:	84 c0                	test   %al,%al
 17a:	74 10                	je     18c <strcmp+0x27>
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	0f b6 10             	movzbl (%eax),%edx
 182:	8b 45 0c             	mov    0xc(%ebp),%eax
 185:	0f b6 00             	movzbl (%eax),%eax
 188:	38 c2                	cmp    %al,%dl
 18a:	74 de                	je     16a <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 18c:	8b 45 08             	mov    0x8(%ebp),%eax
 18f:	0f b6 00             	movzbl (%eax),%eax
 192:	0f b6 d0             	movzbl %al,%edx
 195:	8b 45 0c             	mov    0xc(%ebp),%eax
 198:	0f b6 00             	movzbl (%eax),%eax
 19b:	0f b6 c0             	movzbl %al,%eax
 19e:	29 c2                	sub    %eax,%edx
 1a0:	89 d0                	mov    %edx,%eax
}
 1a2:	5d                   	pop    %ebp
 1a3:	c3                   	ret    

000001a4 <strlen>:

uint
strlen(char *s)
{
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b1:	eb 04                	jmp    1b7 <strlen+0x13>
 1b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1ba:	8b 45 08             	mov    0x8(%ebp),%eax
 1bd:	01 d0                	add    %edx,%eax
 1bf:	0f b6 00             	movzbl (%eax),%eax
 1c2:	84 c0                	test   %al,%al
 1c4:	75 ed                	jne    1b3 <strlen+0xf>
    ;
  return n;
 1c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1c9:	c9                   	leave  
 1ca:	c3                   	ret    

000001cb <memset>:

void*
memset(void *dst, int c, uint n)
{
 1cb:	55                   	push   %ebp
 1cc:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1ce:	8b 45 10             	mov    0x10(%ebp),%eax
 1d1:	50                   	push   %eax
 1d2:	ff 75 0c             	pushl  0xc(%ebp)
 1d5:	ff 75 08             	pushl  0x8(%ebp)
 1d8:	e8 32 ff ff ff       	call   10f <stosb>
 1dd:	83 c4 0c             	add    $0xc,%esp
  return dst;
 1e0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1e3:	c9                   	leave  
 1e4:	c3                   	ret    

000001e5 <strchr>:

char*
strchr(const char *s, char c)
{
 1e5:	55                   	push   %ebp
 1e6:	89 e5                	mov    %esp,%ebp
 1e8:	83 ec 04             	sub    $0x4,%esp
 1eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ee:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1f1:	eb 14                	jmp    207 <strchr+0x22>
    if(*s == c)
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 00             	movzbl (%eax),%eax
 1f9:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1fc:	75 05                	jne    203 <strchr+0x1e>
      return (char*)s;
 1fe:	8b 45 08             	mov    0x8(%ebp),%eax
 201:	eb 13                	jmp    216 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 203:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	0f b6 00             	movzbl (%eax),%eax
 20d:	84 c0                	test   %al,%al
 20f:	75 e2                	jne    1f3 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 211:	b8 00 00 00 00       	mov    $0x0,%eax
}
 216:	c9                   	leave  
 217:	c3                   	ret    

00000218 <gets>:

char*
gets(char *buf, int max)
{
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 21e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 225:	eb 42                	jmp    269 <gets+0x51>
    cc = read(0, &c, 1);
 227:	83 ec 04             	sub    $0x4,%esp
 22a:	6a 01                	push   $0x1
 22c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 22f:	50                   	push   %eax
 230:	6a 00                	push   $0x0
 232:	e8 57 01 00 00       	call   38e <read>
 237:	83 c4 10             	add    $0x10,%esp
 23a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 23d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 241:	7e 33                	jle    276 <gets+0x5e>
      break;
    buf[i++] = c;
 243:	8b 45 f4             	mov    -0xc(%ebp),%eax
 246:	8d 50 01             	lea    0x1(%eax),%edx
 249:	89 55 f4             	mov    %edx,-0xc(%ebp)
 24c:	89 c2                	mov    %eax,%edx
 24e:	8b 45 08             	mov    0x8(%ebp),%eax
 251:	01 c2                	add    %eax,%edx
 253:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 257:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 259:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 25d:	3c 0a                	cmp    $0xa,%al
 25f:	74 16                	je     277 <gets+0x5f>
 261:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 265:	3c 0d                	cmp    $0xd,%al
 267:	74 0e                	je     277 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 269:	8b 45 f4             	mov    -0xc(%ebp),%eax
 26c:	83 c0 01             	add    $0x1,%eax
 26f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 272:	7c b3                	jl     227 <gets+0xf>
 274:	eb 01                	jmp    277 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 276:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 277:	8b 55 f4             	mov    -0xc(%ebp),%edx
 27a:	8b 45 08             	mov    0x8(%ebp),%eax
 27d:	01 d0                	add    %edx,%eax
 27f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 282:	8b 45 08             	mov    0x8(%ebp),%eax
}
 285:	c9                   	leave  
 286:	c3                   	ret    

00000287 <stat>:

int
stat(char *n, struct stat *st)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
 28a:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 28d:	83 ec 08             	sub    $0x8,%esp
 290:	6a 00                	push   $0x0
 292:	ff 75 08             	pushl  0x8(%ebp)
 295:	e8 1c 01 00 00       	call   3b6 <open>
 29a:	83 c4 10             	add    $0x10,%esp
 29d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2a0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2a4:	79 07                	jns    2ad <stat+0x26>
    return -1;
 2a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ab:	eb 25                	jmp    2d2 <stat+0x4b>
  r = fstat(fd, st);
 2ad:	83 ec 08             	sub    $0x8,%esp
 2b0:	ff 75 0c             	pushl  0xc(%ebp)
 2b3:	ff 75 f4             	pushl  -0xc(%ebp)
 2b6:	e8 13 01 00 00       	call   3ce <fstat>
 2bb:	83 c4 10             	add    $0x10,%esp
 2be:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2c1:	83 ec 0c             	sub    $0xc,%esp
 2c4:	ff 75 f4             	pushl  -0xc(%ebp)
 2c7:	e8 d2 00 00 00       	call   39e <close>
 2cc:	83 c4 10             	add    $0x10,%esp
  return r;
 2cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2d2:	c9                   	leave  
 2d3:	c3                   	ret    

000002d4 <atoi>:

int
atoi(const char *s)
{
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2da:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2e1:	eb 25                	jmp    308 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2e3:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2e6:	89 d0                	mov    %edx,%eax
 2e8:	c1 e0 02             	shl    $0x2,%eax
 2eb:	01 d0                	add    %edx,%eax
 2ed:	01 c0                	add    %eax,%eax
 2ef:	89 c1                	mov    %eax,%ecx
 2f1:	8b 45 08             	mov    0x8(%ebp),%eax
 2f4:	8d 50 01             	lea    0x1(%eax),%edx
 2f7:	89 55 08             	mov    %edx,0x8(%ebp)
 2fa:	0f b6 00             	movzbl (%eax),%eax
 2fd:	0f be c0             	movsbl %al,%eax
 300:	01 c8                	add    %ecx,%eax
 302:	83 e8 30             	sub    $0x30,%eax
 305:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 308:	8b 45 08             	mov    0x8(%ebp),%eax
 30b:	0f b6 00             	movzbl (%eax),%eax
 30e:	3c 2f                	cmp    $0x2f,%al
 310:	7e 0a                	jle    31c <atoi+0x48>
 312:	8b 45 08             	mov    0x8(%ebp),%eax
 315:	0f b6 00             	movzbl (%eax),%eax
 318:	3c 39                	cmp    $0x39,%al
 31a:	7e c7                	jle    2e3 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 31c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 31f:	c9                   	leave  
 320:	c3                   	ret    

00000321 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
 324:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 327:	8b 45 08             	mov    0x8(%ebp),%eax
 32a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 32d:	8b 45 0c             	mov    0xc(%ebp),%eax
 330:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 333:	eb 17                	jmp    34c <memmove+0x2b>
    *dst++ = *src++;
 335:	8b 45 fc             	mov    -0x4(%ebp),%eax
 338:	8d 50 01             	lea    0x1(%eax),%edx
 33b:	89 55 fc             	mov    %edx,-0x4(%ebp)
 33e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 341:	8d 4a 01             	lea    0x1(%edx),%ecx
 344:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 347:	0f b6 12             	movzbl (%edx),%edx
 34a:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 34c:	8b 45 10             	mov    0x10(%ebp),%eax
 34f:	8d 50 ff             	lea    -0x1(%eax),%edx
 352:	89 55 10             	mov    %edx,0x10(%ebp)
 355:	85 c0                	test   %eax,%eax
 357:	7f dc                	jg     335 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 359:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35c:	c9                   	leave  
 35d:	c3                   	ret    

0000035e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35e:	b8 01 00 00 00       	mov    $0x1,%eax
 363:	cd 40                	int    $0x40
 365:	c3                   	ret    

00000366 <msend>:
SYSCALL(msend)
 366:	b8 16 00 00 00       	mov    $0x16,%eax
 36b:	cd 40                	int    $0x40
 36d:	c3                   	ret    

0000036e <mrcve>:
SYSCALL(mrcve)
 36e:	b8 17 00 00 00       	mov    $0x17,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret    

00000376 <exit>:
SYSCALL(exit)
 376:	b8 02 00 00 00       	mov    $0x2,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret    

0000037e <wait>:
SYSCALL(wait)
 37e:	b8 03 00 00 00       	mov    $0x3,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <pipe>:
SYSCALL(pipe)
 386:	b8 04 00 00 00       	mov    $0x4,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <read>:
SYSCALL(read)
 38e:	b8 05 00 00 00       	mov    $0x5,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <write>:
SYSCALL(write)
 396:	b8 10 00 00 00       	mov    $0x10,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <close>:
SYSCALL(close)
 39e:	b8 15 00 00 00       	mov    $0x15,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <kill>:
SYSCALL(kill)
 3a6:	b8 06 00 00 00       	mov    $0x6,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <exec>:
SYSCALL(exec)
 3ae:	b8 07 00 00 00       	mov    $0x7,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <open>:
SYSCALL(open)
 3b6:	b8 0f 00 00 00       	mov    $0xf,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <mknod>:
SYSCALL(mknod)
 3be:	b8 11 00 00 00       	mov    $0x11,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <unlink>:
SYSCALL(unlink)
 3c6:	b8 12 00 00 00       	mov    $0x12,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <fstat>:
SYSCALL(fstat)
 3ce:	b8 08 00 00 00       	mov    $0x8,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <link>:
SYSCALL(link)
 3d6:	b8 13 00 00 00       	mov    $0x13,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <mkdir>:
SYSCALL(mkdir)
 3de:	b8 14 00 00 00       	mov    $0x14,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <chdir>:
SYSCALL(chdir)
 3e6:	b8 09 00 00 00       	mov    $0x9,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <dup>:
SYSCALL(dup)
 3ee:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <getpid>:
SYSCALL(getpid)
 3f6:	b8 0b 00 00 00       	mov    $0xb,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <sbrk>:
SYSCALL(sbrk)
 3fe:	b8 0c 00 00 00       	mov    $0xc,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <sleep>:
SYSCALL(sleep)
 406:	b8 0d 00 00 00       	mov    $0xd,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <uptime>:
SYSCALL(uptime)
 40e:	b8 0e 00 00 00       	mov    $0xe,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	83 ec 18             	sub    $0x18,%esp
 41c:	8b 45 0c             	mov    0xc(%ebp),%eax
 41f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 422:	83 ec 04             	sub    $0x4,%esp
 425:	6a 01                	push   $0x1
 427:	8d 45 f4             	lea    -0xc(%ebp),%eax
 42a:	50                   	push   %eax
 42b:	ff 75 08             	pushl  0x8(%ebp)
 42e:	e8 63 ff ff ff       	call   396 <write>
 433:	83 c4 10             	add    $0x10,%esp
}
 436:	90                   	nop
 437:	c9                   	leave  
 438:	c3                   	ret    

00000439 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	53                   	push   %ebx
 43d:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 440:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 447:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 44b:	74 17                	je     464 <printint+0x2b>
 44d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 451:	79 11                	jns    464 <printint+0x2b>
    neg = 1;
 453:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 45a:	8b 45 0c             	mov    0xc(%ebp),%eax
 45d:	f7 d8                	neg    %eax
 45f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 462:	eb 06                	jmp    46a <printint+0x31>
  } else {
    x = xx;
 464:	8b 45 0c             	mov    0xc(%ebp),%eax
 467:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 46a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 471:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 474:	8d 41 01             	lea    0x1(%ecx),%eax
 477:	89 45 f4             	mov    %eax,-0xc(%ebp)
 47a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 47d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 480:	ba 00 00 00 00       	mov    $0x0,%edx
 485:	f7 f3                	div    %ebx
 487:	89 d0                	mov    %edx,%eax
 489:	0f b6 80 3c 0b 00 00 	movzbl 0xb3c(%eax),%eax
 490:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 494:	8b 5d 10             	mov    0x10(%ebp),%ebx
 497:	8b 45 ec             	mov    -0x14(%ebp),%eax
 49a:	ba 00 00 00 00       	mov    $0x0,%edx
 49f:	f7 f3                	div    %ebx
 4a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4a4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4a8:	75 c7                	jne    471 <printint+0x38>
  if(neg)
 4aa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4ae:	74 2d                	je     4dd <printint+0xa4>
    buf[i++] = '-';
 4b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4b3:	8d 50 01             	lea    0x1(%eax),%edx
 4b6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4b9:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4be:	eb 1d                	jmp    4dd <printint+0xa4>
    putc(fd, buf[i]);
 4c0:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4c6:	01 d0                	add    %edx,%eax
 4c8:	0f b6 00             	movzbl (%eax),%eax
 4cb:	0f be c0             	movsbl %al,%eax
 4ce:	83 ec 08             	sub    $0x8,%esp
 4d1:	50                   	push   %eax
 4d2:	ff 75 08             	pushl  0x8(%ebp)
 4d5:	e8 3c ff ff ff       	call   416 <putc>
 4da:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4dd:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4e5:	79 d9                	jns    4c0 <printint+0x87>
    putc(fd, buf[i]);
}
 4e7:	90                   	nop
 4e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4eb:	c9                   	leave  
 4ec:	c3                   	ret    

000004ed <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4ed:	55                   	push   %ebp
 4ee:	89 e5                	mov    %esp,%ebp
 4f0:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4fa:	8d 45 0c             	lea    0xc(%ebp),%eax
 4fd:	83 c0 04             	add    $0x4,%eax
 500:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 503:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 50a:	e9 59 01 00 00       	jmp    668 <printf+0x17b>
    c = fmt[i] & 0xff;
 50f:	8b 55 0c             	mov    0xc(%ebp),%edx
 512:	8b 45 f0             	mov    -0x10(%ebp),%eax
 515:	01 d0                	add    %edx,%eax
 517:	0f b6 00             	movzbl (%eax),%eax
 51a:	0f be c0             	movsbl %al,%eax
 51d:	25 ff 00 00 00       	and    $0xff,%eax
 522:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 525:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 529:	75 2c                	jne    557 <printf+0x6a>
      if(c == '%'){
 52b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 52f:	75 0c                	jne    53d <printf+0x50>
        state = '%';
 531:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 538:	e9 27 01 00 00       	jmp    664 <printf+0x177>
      } else {
        putc(fd, c);
 53d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 540:	0f be c0             	movsbl %al,%eax
 543:	83 ec 08             	sub    $0x8,%esp
 546:	50                   	push   %eax
 547:	ff 75 08             	pushl  0x8(%ebp)
 54a:	e8 c7 fe ff ff       	call   416 <putc>
 54f:	83 c4 10             	add    $0x10,%esp
 552:	e9 0d 01 00 00       	jmp    664 <printf+0x177>
      }
    } else if(state == '%'){
 557:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 55b:	0f 85 03 01 00 00    	jne    664 <printf+0x177>
      if(c == 'd'){
 561:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 565:	75 1e                	jne    585 <printf+0x98>
        printint(fd, *ap, 10, 1);
 567:	8b 45 e8             	mov    -0x18(%ebp),%eax
 56a:	8b 00                	mov    (%eax),%eax
 56c:	6a 01                	push   $0x1
 56e:	6a 0a                	push   $0xa
 570:	50                   	push   %eax
 571:	ff 75 08             	pushl  0x8(%ebp)
 574:	e8 c0 fe ff ff       	call   439 <printint>
 579:	83 c4 10             	add    $0x10,%esp
        ap++;
 57c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 580:	e9 d8 00 00 00       	jmp    65d <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 585:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 589:	74 06                	je     591 <printf+0xa4>
 58b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 58f:	75 1e                	jne    5af <printf+0xc2>
        printint(fd, *ap, 16, 0);
 591:	8b 45 e8             	mov    -0x18(%ebp),%eax
 594:	8b 00                	mov    (%eax),%eax
 596:	6a 00                	push   $0x0
 598:	6a 10                	push   $0x10
 59a:	50                   	push   %eax
 59b:	ff 75 08             	pushl  0x8(%ebp)
 59e:	e8 96 fe ff ff       	call   439 <printint>
 5a3:	83 c4 10             	add    $0x10,%esp
        ap++;
 5a6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5aa:	e9 ae 00 00 00       	jmp    65d <printf+0x170>
      } else if(c == 's'){
 5af:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5b3:	75 43                	jne    5f8 <printf+0x10b>
        s = (char*)*ap;
 5b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5b8:	8b 00                	mov    (%eax),%eax
 5ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5bd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5c5:	75 25                	jne    5ec <printf+0xff>
          s = "(null)";
 5c7:	c7 45 f4 c9 08 00 00 	movl   $0x8c9,-0xc(%ebp)
        while(*s != 0){
 5ce:	eb 1c                	jmp    5ec <printf+0xff>
          putc(fd, *s);
 5d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5d3:	0f b6 00             	movzbl (%eax),%eax
 5d6:	0f be c0             	movsbl %al,%eax
 5d9:	83 ec 08             	sub    $0x8,%esp
 5dc:	50                   	push   %eax
 5dd:	ff 75 08             	pushl  0x8(%ebp)
 5e0:	e8 31 fe ff ff       	call   416 <putc>
 5e5:	83 c4 10             	add    $0x10,%esp
          s++;
 5e8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ef:	0f b6 00             	movzbl (%eax),%eax
 5f2:	84 c0                	test   %al,%al
 5f4:	75 da                	jne    5d0 <printf+0xe3>
 5f6:	eb 65                	jmp    65d <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5f8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5fc:	75 1d                	jne    61b <printf+0x12e>
        putc(fd, *ap);
 5fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
 601:	8b 00                	mov    (%eax),%eax
 603:	0f be c0             	movsbl %al,%eax
 606:	83 ec 08             	sub    $0x8,%esp
 609:	50                   	push   %eax
 60a:	ff 75 08             	pushl  0x8(%ebp)
 60d:	e8 04 fe ff ff       	call   416 <putc>
 612:	83 c4 10             	add    $0x10,%esp
        ap++;
 615:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 619:	eb 42                	jmp    65d <printf+0x170>
      } else if(c == '%'){
 61b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 61f:	75 17                	jne    638 <printf+0x14b>
        putc(fd, c);
 621:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 624:	0f be c0             	movsbl %al,%eax
 627:	83 ec 08             	sub    $0x8,%esp
 62a:	50                   	push   %eax
 62b:	ff 75 08             	pushl  0x8(%ebp)
 62e:	e8 e3 fd ff ff       	call   416 <putc>
 633:	83 c4 10             	add    $0x10,%esp
 636:	eb 25                	jmp    65d <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 638:	83 ec 08             	sub    $0x8,%esp
 63b:	6a 25                	push   $0x25
 63d:	ff 75 08             	pushl  0x8(%ebp)
 640:	e8 d1 fd ff ff       	call   416 <putc>
 645:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 648:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 64b:	0f be c0             	movsbl %al,%eax
 64e:	83 ec 08             	sub    $0x8,%esp
 651:	50                   	push   %eax
 652:	ff 75 08             	pushl  0x8(%ebp)
 655:	e8 bc fd ff ff       	call   416 <putc>
 65a:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 65d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 664:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 668:	8b 55 0c             	mov    0xc(%ebp),%edx
 66b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 66e:	01 d0                	add    %edx,%eax
 670:	0f b6 00             	movzbl (%eax),%eax
 673:	84 c0                	test   %al,%al
 675:	0f 85 94 fe ff ff    	jne    50f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 67b:	90                   	nop
 67c:	c9                   	leave  
 67d:	c3                   	ret    

0000067e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 67e:	55                   	push   %ebp
 67f:	89 e5                	mov    %esp,%ebp
 681:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 684:	8b 45 08             	mov    0x8(%ebp),%eax
 687:	83 e8 08             	sub    $0x8,%eax
 68a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 68d:	a1 68 0b 00 00       	mov    0xb68,%eax
 692:	89 45 fc             	mov    %eax,-0x4(%ebp)
 695:	eb 24                	jmp    6bb <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 697:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69a:	8b 00                	mov    (%eax),%eax
 69c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 69f:	77 12                	ja     6b3 <free+0x35>
 6a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6a7:	77 24                	ja     6cd <free+0x4f>
 6a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ac:	8b 00                	mov    (%eax),%eax
 6ae:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6b1:	77 1a                	ja     6cd <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b6:	8b 00                	mov    (%eax),%eax
 6b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6be:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6c1:	76 d4                	jbe    697 <free+0x19>
 6c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c6:	8b 00                	mov    (%eax),%eax
 6c8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6cb:	76 ca                	jbe    697 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d0:	8b 40 04             	mov    0x4(%eax),%eax
 6d3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6dd:	01 c2                	add    %eax,%edx
 6df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e2:	8b 00                	mov    (%eax),%eax
 6e4:	39 c2                	cmp    %eax,%edx
 6e6:	75 24                	jne    70c <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6eb:	8b 50 04             	mov    0x4(%eax),%edx
 6ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f1:	8b 00                	mov    (%eax),%eax
 6f3:	8b 40 04             	mov    0x4(%eax),%eax
 6f6:	01 c2                	add    %eax,%edx
 6f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fb:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 701:	8b 00                	mov    (%eax),%eax
 703:	8b 10                	mov    (%eax),%edx
 705:	8b 45 f8             	mov    -0x8(%ebp),%eax
 708:	89 10                	mov    %edx,(%eax)
 70a:	eb 0a                	jmp    716 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 70c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70f:	8b 10                	mov    (%eax),%edx
 711:	8b 45 f8             	mov    -0x8(%ebp),%eax
 714:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 716:	8b 45 fc             	mov    -0x4(%ebp),%eax
 719:	8b 40 04             	mov    0x4(%eax),%eax
 71c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 723:	8b 45 fc             	mov    -0x4(%ebp),%eax
 726:	01 d0                	add    %edx,%eax
 728:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 72b:	75 20                	jne    74d <free+0xcf>
    p->s.size += bp->s.size;
 72d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 730:	8b 50 04             	mov    0x4(%eax),%edx
 733:	8b 45 f8             	mov    -0x8(%ebp),%eax
 736:	8b 40 04             	mov    0x4(%eax),%eax
 739:	01 c2                	add    %eax,%edx
 73b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 741:	8b 45 f8             	mov    -0x8(%ebp),%eax
 744:	8b 10                	mov    (%eax),%edx
 746:	8b 45 fc             	mov    -0x4(%ebp),%eax
 749:	89 10                	mov    %edx,(%eax)
 74b:	eb 08                	jmp    755 <free+0xd7>
  } else
    p->s.ptr = bp;
 74d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 750:	8b 55 f8             	mov    -0x8(%ebp),%edx
 753:	89 10                	mov    %edx,(%eax)
  freep = p;
 755:	8b 45 fc             	mov    -0x4(%ebp),%eax
 758:	a3 68 0b 00 00       	mov    %eax,0xb68
}
 75d:	90                   	nop
 75e:	c9                   	leave  
 75f:	c3                   	ret    

00000760 <morecore>:

static Header*
morecore(uint nu)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 766:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 76d:	77 07                	ja     776 <morecore+0x16>
    nu = 4096;
 76f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 776:	8b 45 08             	mov    0x8(%ebp),%eax
 779:	c1 e0 03             	shl    $0x3,%eax
 77c:	83 ec 0c             	sub    $0xc,%esp
 77f:	50                   	push   %eax
 780:	e8 79 fc ff ff       	call   3fe <sbrk>
 785:	83 c4 10             	add    $0x10,%esp
 788:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 78b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 78f:	75 07                	jne    798 <morecore+0x38>
    return 0;
 791:	b8 00 00 00 00       	mov    $0x0,%eax
 796:	eb 26                	jmp    7be <morecore+0x5e>
  hp = (Header*)p;
 798:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 79e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a1:	8b 55 08             	mov    0x8(%ebp),%edx
 7a4:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7aa:	83 c0 08             	add    $0x8,%eax
 7ad:	83 ec 0c             	sub    $0xc,%esp
 7b0:	50                   	push   %eax
 7b1:	e8 c8 fe ff ff       	call   67e <free>
 7b6:	83 c4 10             	add    $0x10,%esp
  return freep;
 7b9:	a1 68 0b 00 00       	mov    0xb68,%eax
}
 7be:	c9                   	leave  
 7bf:	c3                   	ret    

000007c0 <malloc>:

void*
malloc(uint nbytes)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c6:	8b 45 08             	mov    0x8(%ebp),%eax
 7c9:	83 c0 07             	add    $0x7,%eax
 7cc:	c1 e8 03             	shr    $0x3,%eax
 7cf:	83 c0 01             	add    $0x1,%eax
 7d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7d5:	a1 68 0b 00 00       	mov    0xb68,%eax
 7da:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7dd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7e1:	75 23                	jne    806 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7e3:	c7 45 f0 60 0b 00 00 	movl   $0xb60,-0x10(%ebp)
 7ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ed:	a3 68 0b 00 00       	mov    %eax,0xb68
 7f2:	a1 68 0b 00 00       	mov    0xb68,%eax
 7f7:	a3 60 0b 00 00       	mov    %eax,0xb60
    base.s.size = 0;
 7fc:	c7 05 64 0b 00 00 00 	movl   $0x0,0xb64
 803:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 806:	8b 45 f0             	mov    -0x10(%ebp),%eax
 809:	8b 00                	mov    (%eax),%eax
 80b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 80e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 811:	8b 40 04             	mov    0x4(%eax),%eax
 814:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 817:	72 4d                	jb     866 <malloc+0xa6>
      if(p->s.size == nunits)
 819:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81c:	8b 40 04             	mov    0x4(%eax),%eax
 81f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 822:	75 0c                	jne    830 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 824:	8b 45 f4             	mov    -0xc(%ebp),%eax
 827:	8b 10                	mov    (%eax),%edx
 829:	8b 45 f0             	mov    -0x10(%ebp),%eax
 82c:	89 10                	mov    %edx,(%eax)
 82e:	eb 26                	jmp    856 <malloc+0x96>
      else {
        p->s.size -= nunits;
 830:	8b 45 f4             	mov    -0xc(%ebp),%eax
 833:	8b 40 04             	mov    0x4(%eax),%eax
 836:	2b 45 ec             	sub    -0x14(%ebp),%eax
 839:	89 c2                	mov    %eax,%edx
 83b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 841:	8b 45 f4             	mov    -0xc(%ebp),%eax
 844:	8b 40 04             	mov    0x4(%eax),%eax
 847:	c1 e0 03             	shl    $0x3,%eax
 84a:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 84d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 850:	8b 55 ec             	mov    -0x14(%ebp),%edx
 853:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 856:	8b 45 f0             	mov    -0x10(%ebp),%eax
 859:	a3 68 0b 00 00       	mov    %eax,0xb68
      return (void*)(p + 1);
 85e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 861:	83 c0 08             	add    $0x8,%eax
 864:	eb 3b                	jmp    8a1 <malloc+0xe1>
    }
    if(p == freep)
 866:	a1 68 0b 00 00       	mov    0xb68,%eax
 86b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 86e:	75 1e                	jne    88e <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 870:	83 ec 0c             	sub    $0xc,%esp
 873:	ff 75 ec             	pushl  -0x14(%ebp)
 876:	e8 e5 fe ff ff       	call   760 <morecore>
 87b:	83 c4 10             	add    $0x10,%esp
 87e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 881:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 885:	75 07                	jne    88e <malloc+0xce>
        return 0;
 887:	b8 00 00 00 00       	mov    $0x0,%eax
 88c:	eb 13                	jmp    8a1 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 88e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 891:	89 45 f0             	mov    %eax,-0x10(%ebp)
 894:	8b 45 f4             	mov    -0xc(%ebp),%eax
 897:	8b 00                	mov    (%eax),%eax
 899:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 89c:	e9 6d ff ff ff       	jmp    80e <malloc+0x4e>
}
 8a1:	c9                   	leave  
 8a2:	c3                   	ret    

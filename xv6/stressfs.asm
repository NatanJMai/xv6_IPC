
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  14:	c7 45 e6 73 74 72 65 	movl   $0x65727473,-0x1a(%ebp)
  1b:	c7 45 ea 73 73 66 73 	movl   $0x73667373,-0x16(%ebp)
  22:	66 c7 45 ee 30 00    	movw   $0x30,-0x12(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 e6 08 00 00       	push   $0x8e6
  30:	6a 01                	push   $0x1
  32:	e8 f9 04 00 00       	call   530 <printf>
  37:	83 c4 10             	add    $0x10,%esp
  memset(data, 'a', sizeof(data));
  3a:	83 ec 04             	sub    $0x4,%esp
  3d:	68 00 02 00 00       	push   $0x200
  42:	6a 61                	push   $0x61
  44:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
  4a:	50                   	push   %eax
  4b:	e8 be 01 00 00       	call   20e <memset>
  50:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 4; i++)
  53:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  5a:	eb 0d                	jmp    69 <main+0x69>
    if(fork() > 0)
  5c:	e8 40 03 00 00       	call   3a1 <fork>
  61:	85 c0                	test   %eax,%eax
  63:	7f 0c                	jg     71 <main+0x71>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  65:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  69:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
  6d:	7e ed                	jle    5c <main+0x5c>
  6f:	eb 01                	jmp    72 <main+0x72>
    if(fork() > 0)
      break;
  71:	90                   	nop

  printf(1, "write %d\n", i);
  72:	83 ec 04             	sub    $0x4,%esp
  75:	ff 75 f4             	pushl  -0xc(%ebp)
  78:	68 f9 08 00 00       	push   $0x8f9
  7d:	6a 01                	push   $0x1
  7f:	e8 ac 04 00 00       	call   530 <printf>
  84:	83 c4 10             	add    $0x10,%esp

  path[8] += i;
  87:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
  8b:	89 c2                	mov    %eax,%edx
  8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  90:	01 d0                	add    %edx,%eax
  92:	88 45 ee             	mov    %al,-0x12(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  95:	83 ec 08             	sub    $0x8,%esp
  98:	68 02 02 00 00       	push   $0x202
  9d:	8d 45 e6             	lea    -0x1a(%ebp),%eax
  a0:	50                   	push   %eax
  a1:	e8 53 03 00 00       	call   3f9 <open>
  a6:	83 c4 10             	add    $0x10,%esp
  a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 20; i++)
  ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  b3:	eb 1e                	jmp    d3 <main+0xd3>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b5:	83 ec 04             	sub    $0x4,%esp
  b8:	68 00 02 00 00       	push   $0x200
  bd:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
  c3:	50                   	push   %eax
  c4:	ff 75 f0             	pushl  -0x10(%ebp)
  c7:	e8 0d 03 00 00       	call   3d9 <write>
  cc:	83 c4 10             	add    $0x10,%esp

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
  cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  d3:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
  d7:	7e dc                	jle    b5 <main+0xb5>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
  d9:	83 ec 0c             	sub    $0xc,%esp
  dc:	ff 75 f0             	pushl  -0x10(%ebp)
  df:	e8 fd 02 00 00       	call   3e1 <close>
  e4:	83 c4 10             	add    $0x10,%esp

  printf(1, "read\n");
  e7:	83 ec 08             	sub    $0x8,%esp
  ea:	68 03 09 00 00       	push   $0x903
  ef:	6a 01                	push   $0x1
  f1:	e8 3a 04 00 00       	call   530 <printf>
  f6:	83 c4 10             	add    $0x10,%esp

  fd = open(path, O_RDONLY);
  f9:	83 ec 08             	sub    $0x8,%esp
  fc:	6a 00                	push   $0x0
  fe:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 101:	50                   	push   %eax
 102:	e8 f2 02 00 00       	call   3f9 <open>
 107:	83 c4 10             	add    $0x10,%esp
 10a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for (i = 0; i < 20; i++)
 10d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 114:	eb 1e                	jmp    134 <main+0x134>
    read(fd, data, sizeof(data));
 116:	83 ec 04             	sub    $0x4,%esp
 119:	68 00 02 00 00       	push   $0x200
 11e:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
 124:	50                   	push   %eax
 125:	ff 75 f0             	pushl  -0x10(%ebp)
 128:	e8 a4 02 00 00       	call   3d1 <read>
 12d:	83 c4 10             	add    $0x10,%esp
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 130:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 134:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
 138:	7e dc                	jle    116 <main+0x116>
    read(fd, data, sizeof(data));
  close(fd);
 13a:	83 ec 0c             	sub    $0xc,%esp
 13d:	ff 75 f0             	pushl  -0x10(%ebp)
 140:	e8 9c 02 00 00       	call   3e1 <close>
 145:	83 c4 10             	add    $0x10,%esp

  wait();
 148:	e8 74 02 00 00       	call   3c1 <wait>
  
  exit();
 14d:	e8 67 02 00 00       	call   3b9 <exit>

00000152 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	57                   	push   %edi
 156:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 157:	8b 4d 08             	mov    0x8(%ebp),%ecx
 15a:	8b 55 10             	mov    0x10(%ebp),%edx
 15d:	8b 45 0c             	mov    0xc(%ebp),%eax
 160:	89 cb                	mov    %ecx,%ebx
 162:	89 df                	mov    %ebx,%edi
 164:	89 d1                	mov    %edx,%ecx
 166:	fc                   	cld    
 167:	f3 aa                	rep stos %al,%es:(%edi)
 169:	89 ca                	mov    %ecx,%edx
 16b:	89 fb                	mov    %edi,%ebx
 16d:	89 5d 08             	mov    %ebx,0x8(%ebp)
 170:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 173:	90                   	nop
 174:	5b                   	pop    %ebx
 175:	5f                   	pop    %edi
 176:	5d                   	pop    %ebp
 177:	c3                   	ret    

00000178 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 17e:	8b 45 08             	mov    0x8(%ebp),%eax
 181:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 184:	90                   	nop
 185:	8b 45 08             	mov    0x8(%ebp),%eax
 188:	8d 50 01             	lea    0x1(%eax),%edx
 18b:	89 55 08             	mov    %edx,0x8(%ebp)
 18e:	8b 55 0c             	mov    0xc(%ebp),%edx
 191:	8d 4a 01             	lea    0x1(%edx),%ecx
 194:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 197:	0f b6 12             	movzbl (%edx),%edx
 19a:	88 10                	mov    %dl,(%eax)
 19c:	0f b6 00             	movzbl (%eax),%eax
 19f:	84 c0                	test   %al,%al
 1a1:	75 e2                	jne    185 <strcpy+0xd>
    ;
  return os;
 1a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1a6:	c9                   	leave  
 1a7:	c3                   	ret    

000001a8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1ab:	eb 08                	jmp    1b5 <strcmp+0xd>
    p++, q++;
 1ad:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1b1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1b5:	8b 45 08             	mov    0x8(%ebp),%eax
 1b8:	0f b6 00             	movzbl (%eax),%eax
 1bb:	84 c0                	test   %al,%al
 1bd:	74 10                	je     1cf <strcmp+0x27>
 1bf:	8b 45 08             	mov    0x8(%ebp),%eax
 1c2:	0f b6 10             	movzbl (%eax),%edx
 1c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c8:	0f b6 00             	movzbl (%eax),%eax
 1cb:	38 c2                	cmp    %al,%dl
 1cd:	74 de                	je     1ad <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1cf:	8b 45 08             	mov    0x8(%ebp),%eax
 1d2:	0f b6 00             	movzbl (%eax),%eax
 1d5:	0f b6 d0             	movzbl %al,%edx
 1d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1db:	0f b6 00             	movzbl (%eax),%eax
 1de:	0f b6 c0             	movzbl %al,%eax
 1e1:	29 c2                	sub    %eax,%edx
 1e3:	89 d0                	mov    %edx,%eax
}
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    

000001e7 <strlen>:

uint
strlen(char *s)
{
 1e7:	55                   	push   %ebp
 1e8:	89 e5                	mov    %esp,%ebp
 1ea:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1ed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1f4:	eb 04                	jmp    1fa <strlen+0x13>
 1f6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1fa:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
 200:	01 d0                	add    %edx,%eax
 202:	0f b6 00             	movzbl (%eax),%eax
 205:	84 c0                	test   %al,%al
 207:	75 ed                	jne    1f6 <strlen+0xf>
    ;
  return n;
 209:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 20c:	c9                   	leave  
 20d:	c3                   	ret    

0000020e <memset>:

void*
memset(void *dst, int c, uint n)
{
 20e:	55                   	push   %ebp
 20f:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 211:	8b 45 10             	mov    0x10(%ebp),%eax
 214:	50                   	push   %eax
 215:	ff 75 0c             	pushl  0xc(%ebp)
 218:	ff 75 08             	pushl  0x8(%ebp)
 21b:	e8 32 ff ff ff       	call   152 <stosb>
 220:	83 c4 0c             	add    $0xc,%esp
  return dst;
 223:	8b 45 08             	mov    0x8(%ebp),%eax
}
 226:	c9                   	leave  
 227:	c3                   	ret    

00000228 <strchr>:

char*
strchr(const char *s, char c)
{
 228:	55                   	push   %ebp
 229:	89 e5                	mov    %esp,%ebp
 22b:	83 ec 04             	sub    $0x4,%esp
 22e:	8b 45 0c             	mov    0xc(%ebp),%eax
 231:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 234:	eb 14                	jmp    24a <strchr+0x22>
    if(*s == c)
 236:	8b 45 08             	mov    0x8(%ebp),%eax
 239:	0f b6 00             	movzbl (%eax),%eax
 23c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 23f:	75 05                	jne    246 <strchr+0x1e>
      return (char*)s;
 241:	8b 45 08             	mov    0x8(%ebp),%eax
 244:	eb 13                	jmp    259 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 246:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 24a:	8b 45 08             	mov    0x8(%ebp),%eax
 24d:	0f b6 00             	movzbl (%eax),%eax
 250:	84 c0                	test   %al,%al
 252:	75 e2                	jne    236 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 254:	b8 00 00 00 00       	mov    $0x0,%eax
}
 259:	c9                   	leave  
 25a:	c3                   	ret    

0000025b <gets>:

char*
gets(char *buf, int max)
{
 25b:	55                   	push   %ebp
 25c:	89 e5                	mov    %esp,%ebp
 25e:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 261:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 268:	eb 42                	jmp    2ac <gets+0x51>
    cc = read(0, &c, 1);
 26a:	83 ec 04             	sub    $0x4,%esp
 26d:	6a 01                	push   $0x1
 26f:	8d 45 ef             	lea    -0x11(%ebp),%eax
 272:	50                   	push   %eax
 273:	6a 00                	push   $0x0
 275:	e8 57 01 00 00       	call   3d1 <read>
 27a:	83 c4 10             	add    $0x10,%esp
 27d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 280:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 284:	7e 33                	jle    2b9 <gets+0x5e>
      break;
    buf[i++] = c;
 286:	8b 45 f4             	mov    -0xc(%ebp),%eax
 289:	8d 50 01             	lea    0x1(%eax),%edx
 28c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 28f:	89 c2                	mov    %eax,%edx
 291:	8b 45 08             	mov    0x8(%ebp),%eax
 294:	01 c2                	add    %eax,%edx
 296:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 29a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 29c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a0:	3c 0a                	cmp    $0xa,%al
 2a2:	74 16                	je     2ba <gets+0x5f>
 2a4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a8:	3c 0d                	cmp    $0xd,%al
 2aa:	74 0e                	je     2ba <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2af:	83 c0 01             	add    $0x1,%eax
 2b2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2b5:	7c b3                	jl     26a <gets+0xf>
 2b7:	eb 01                	jmp    2ba <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 2b9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2bd:	8b 45 08             	mov    0x8(%ebp),%eax
 2c0:	01 d0                	add    %edx,%eax
 2c2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2c5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c8:	c9                   	leave  
 2c9:	c3                   	ret    

000002ca <stat>:

int
stat(char *n, struct stat *st)
{
 2ca:	55                   	push   %ebp
 2cb:	89 e5                	mov    %esp,%ebp
 2cd:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d0:	83 ec 08             	sub    $0x8,%esp
 2d3:	6a 00                	push   $0x0
 2d5:	ff 75 08             	pushl  0x8(%ebp)
 2d8:	e8 1c 01 00 00       	call   3f9 <open>
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e7:	79 07                	jns    2f0 <stat+0x26>
    return -1;
 2e9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ee:	eb 25                	jmp    315 <stat+0x4b>
  r = fstat(fd, st);
 2f0:	83 ec 08             	sub    $0x8,%esp
 2f3:	ff 75 0c             	pushl  0xc(%ebp)
 2f6:	ff 75 f4             	pushl  -0xc(%ebp)
 2f9:	e8 13 01 00 00       	call   411 <fstat>
 2fe:	83 c4 10             	add    $0x10,%esp
 301:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 304:	83 ec 0c             	sub    $0xc,%esp
 307:	ff 75 f4             	pushl  -0xc(%ebp)
 30a:	e8 d2 00 00 00       	call   3e1 <close>
 30f:	83 c4 10             	add    $0x10,%esp
  return r;
 312:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 315:	c9                   	leave  
 316:	c3                   	ret    

00000317 <atoi>:

int
atoi(const char *s)
{
 317:	55                   	push   %ebp
 318:	89 e5                	mov    %esp,%ebp
 31a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 31d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 324:	eb 25                	jmp    34b <atoi+0x34>
    n = n*10 + *s++ - '0';
 326:	8b 55 fc             	mov    -0x4(%ebp),%edx
 329:	89 d0                	mov    %edx,%eax
 32b:	c1 e0 02             	shl    $0x2,%eax
 32e:	01 d0                	add    %edx,%eax
 330:	01 c0                	add    %eax,%eax
 332:	89 c1                	mov    %eax,%ecx
 334:	8b 45 08             	mov    0x8(%ebp),%eax
 337:	8d 50 01             	lea    0x1(%eax),%edx
 33a:	89 55 08             	mov    %edx,0x8(%ebp)
 33d:	0f b6 00             	movzbl (%eax),%eax
 340:	0f be c0             	movsbl %al,%eax
 343:	01 c8                	add    %ecx,%eax
 345:	83 e8 30             	sub    $0x30,%eax
 348:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 34b:	8b 45 08             	mov    0x8(%ebp),%eax
 34e:	0f b6 00             	movzbl (%eax),%eax
 351:	3c 2f                	cmp    $0x2f,%al
 353:	7e 0a                	jle    35f <atoi+0x48>
 355:	8b 45 08             	mov    0x8(%ebp),%eax
 358:	0f b6 00             	movzbl (%eax),%eax
 35b:	3c 39                	cmp    $0x39,%al
 35d:	7e c7                	jle    326 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 35f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 362:	c9                   	leave  
 363:	c3                   	ret    

00000364 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
 36d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 370:	8b 45 0c             	mov    0xc(%ebp),%eax
 373:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 376:	eb 17                	jmp    38f <memmove+0x2b>
    *dst++ = *src++;
 378:	8b 45 fc             	mov    -0x4(%ebp),%eax
 37b:	8d 50 01             	lea    0x1(%eax),%edx
 37e:	89 55 fc             	mov    %edx,-0x4(%ebp)
 381:	8b 55 f8             	mov    -0x8(%ebp),%edx
 384:	8d 4a 01             	lea    0x1(%edx),%ecx
 387:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 38a:	0f b6 12             	movzbl (%edx),%edx
 38d:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 38f:	8b 45 10             	mov    0x10(%ebp),%eax
 392:	8d 50 ff             	lea    -0x1(%eax),%edx
 395:	89 55 10             	mov    %edx,0x10(%ebp)
 398:	85 c0                	test   %eax,%eax
 39a:	7f dc                	jg     378 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 39c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 39f:	c9                   	leave  
 3a0:	c3                   	ret    

000003a1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3a1:	b8 01 00 00 00       	mov    $0x1,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <msend>:
SYSCALL(msend)
 3a9:	b8 16 00 00 00       	mov    $0x16,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <mrcve>:
SYSCALL(mrcve)
 3b1:	b8 17 00 00 00       	mov    $0x17,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <exit>:
SYSCALL(exit)
 3b9:	b8 02 00 00 00       	mov    $0x2,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <wait>:
SYSCALL(wait)
 3c1:	b8 03 00 00 00       	mov    $0x3,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <pipe>:
SYSCALL(pipe)
 3c9:	b8 04 00 00 00       	mov    $0x4,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <read>:
SYSCALL(read)
 3d1:	b8 05 00 00 00       	mov    $0x5,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <write>:
SYSCALL(write)
 3d9:	b8 10 00 00 00       	mov    $0x10,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <close>:
SYSCALL(close)
 3e1:	b8 15 00 00 00       	mov    $0x15,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <kill>:
SYSCALL(kill)
 3e9:	b8 06 00 00 00       	mov    $0x6,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <exec>:
SYSCALL(exec)
 3f1:	b8 07 00 00 00       	mov    $0x7,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <open>:
SYSCALL(open)
 3f9:	b8 0f 00 00 00       	mov    $0xf,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <mknod>:
SYSCALL(mknod)
 401:	b8 11 00 00 00       	mov    $0x11,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <unlink>:
SYSCALL(unlink)
 409:	b8 12 00 00 00       	mov    $0x12,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <fstat>:
SYSCALL(fstat)
 411:	b8 08 00 00 00       	mov    $0x8,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <link>:
SYSCALL(link)
 419:	b8 13 00 00 00       	mov    $0x13,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <mkdir>:
SYSCALL(mkdir)
 421:	b8 14 00 00 00       	mov    $0x14,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <chdir>:
SYSCALL(chdir)
 429:	b8 09 00 00 00       	mov    $0x9,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <dup>:
SYSCALL(dup)
 431:	b8 0a 00 00 00       	mov    $0xa,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <getpid>:
SYSCALL(getpid)
 439:	b8 0b 00 00 00       	mov    $0xb,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <sbrk>:
SYSCALL(sbrk)
 441:	b8 0c 00 00 00       	mov    $0xc,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <sleep>:
SYSCALL(sleep)
 449:	b8 0d 00 00 00       	mov    $0xd,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <uptime>:
SYSCALL(uptime)
 451:	b8 0e 00 00 00       	mov    $0xe,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 459:	55                   	push   %ebp
 45a:	89 e5                	mov    %esp,%ebp
 45c:	83 ec 18             	sub    $0x18,%esp
 45f:	8b 45 0c             	mov    0xc(%ebp),%eax
 462:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 465:	83 ec 04             	sub    $0x4,%esp
 468:	6a 01                	push   $0x1
 46a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 46d:	50                   	push   %eax
 46e:	ff 75 08             	pushl  0x8(%ebp)
 471:	e8 63 ff ff ff       	call   3d9 <write>
 476:	83 c4 10             	add    $0x10,%esp
}
 479:	90                   	nop
 47a:	c9                   	leave  
 47b:	c3                   	ret    

0000047c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 47c:	55                   	push   %ebp
 47d:	89 e5                	mov    %esp,%ebp
 47f:	53                   	push   %ebx
 480:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 483:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 48a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 48e:	74 17                	je     4a7 <printint+0x2b>
 490:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 494:	79 11                	jns    4a7 <printint+0x2b>
    neg = 1;
 496:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 49d:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a0:	f7 d8                	neg    %eax
 4a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4a5:	eb 06                	jmp    4ad <printint+0x31>
  } else {
    x = xx;
 4a7:	8b 45 0c             	mov    0xc(%ebp),%eax
 4aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4ad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4b4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4b7:	8d 41 01             	lea    0x1(%ecx),%eax
 4ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4bd:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4c3:	ba 00 00 00 00       	mov    $0x0,%edx
 4c8:	f7 f3                	div    %ebx
 4ca:	89 d0                	mov    %edx,%eax
 4cc:	0f b6 80 58 0b 00 00 	movzbl 0xb58(%eax),%eax
 4d3:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4d7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4da:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4dd:	ba 00 00 00 00       	mov    $0x0,%edx
 4e2:	f7 f3                	div    %ebx
 4e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4e7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4eb:	75 c7                	jne    4b4 <printint+0x38>
  if(neg)
 4ed:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4f1:	74 2d                	je     520 <printint+0xa4>
    buf[i++] = '-';
 4f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f6:	8d 50 01             	lea    0x1(%eax),%edx
 4f9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4fc:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 501:	eb 1d                	jmp    520 <printint+0xa4>
    putc(fd, buf[i]);
 503:	8d 55 dc             	lea    -0x24(%ebp),%edx
 506:	8b 45 f4             	mov    -0xc(%ebp),%eax
 509:	01 d0                	add    %edx,%eax
 50b:	0f b6 00             	movzbl (%eax),%eax
 50e:	0f be c0             	movsbl %al,%eax
 511:	83 ec 08             	sub    $0x8,%esp
 514:	50                   	push   %eax
 515:	ff 75 08             	pushl  0x8(%ebp)
 518:	e8 3c ff ff ff       	call   459 <putc>
 51d:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 520:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 524:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 528:	79 d9                	jns    503 <printint+0x87>
    putc(fd, buf[i]);
}
 52a:	90                   	nop
 52b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 52e:	c9                   	leave  
 52f:	c3                   	ret    

00000530 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 536:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 53d:	8d 45 0c             	lea    0xc(%ebp),%eax
 540:	83 c0 04             	add    $0x4,%eax
 543:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 546:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 54d:	e9 59 01 00 00       	jmp    6ab <printf+0x17b>
    c = fmt[i] & 0xff;
 552:	8b 55 0c             	mov    0xc(%ebp),%edx
 555:	8b 45 f0             	mov    -0x10(%ebp),%eax
 558:	01 d0                	add    %edx,%eax
 55a:	0f b6 00             	movzbl (%eax),%eax
 55d:	0f be c0             	movsbl %al,%eax
 560:	25 ff 00 00 00       	and    $0xff,%eax
 565:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 568:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 56c:	75 2c                	jne    59a <printf+0x6a>
      if(c == '%'){
 56e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 572:	75 0c                	jne    580 <printf+0x50>
        state = '%';
 574:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 57b:	e9 27 01 00 00       	jmp    6a7 <printf+0x177>
      } else {
        putc(fd, c);
 580:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 583:	0f be c0             	movsbl %al,%eax
 586:	83 ec 08             	sub    $0x8,%esp
 589:	50                   	push   %eax
 58a:	ff 75 08             	pushl  0x8(%ebp)
 58d:	e8 c7 fe ff ff       	call   459 <putc>
 592:	83 c4 10             	add    $0x10,%esp
 595:	e9 0d 01 00 00       	jmp    6a7 <printf+0x177>
      }
    } else if(state == '%'){
 59a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 59e:	0f 85 03 01 00 00    	jne    6a7 <printf+0x177>
      if(c == 'd'){
 5a4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5a8:	75 1e                	jne    5c8 <printf+0x98>
        printint(fd, *ap, 10, 1);
 5aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ad:	8b 00                	mov    (%eax),%eax
 5af:	6a 01                	push   $0x1
 5b1:	6a 0a                	push   $0xa
 5b3:	50                   	push   %eax
 5b4:	ff 75 08             	pushl  0x8(%ebp)
 5b7:	e8 c0 fe ff ff       	call   47c <printint>
 5bc:	83 c4 10             	add    $0x10,%esp
        ap++;
 5bf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5c3:	e9 d8 00 00 00       	jmp    6a0 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 5c8:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5cc:	74 06                	je     5d4 <printf+0xa4>
 5ce:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5d2:	75 1e                	jne    5f2 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 5d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d7:	8b 00                	mov    (%eax),%eax
 5d9:	6a 00                	push   $0x0
 5db:	6a 10                	push   $0x10
 5dd:	50                   	push   %eax
 5de:	ff 75 08             	pushl  0x8(%ebp)
 5e1:	e8 96 fe ff ff       	call   47c <printint>
 5e6:	83 c4 10             	add    $0x10,%esp
        ap++;
 5e9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5ed:	e9 ae 00 00 00       	jmp    6a0 <printf+0x170>
      } else if(c == 's'){
 5f2:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5f6:	75 43                	jne    63b <printf+0x10b>
        s = (char*)*ap;
 5f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5fb:	8b 00                	mov    (%eax),%eax
 5fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 600:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 604:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 608:	75 25                	jne    62f <printf+0xff>
          s = "(null)";
 60a:	c7 45 f4 09 09 00 00 	movl   $0x909,-0xc(%ebp)
        while(*s != 0){
 611:	eb 1c                	jmp    62f <printf+0xff>
          putc(fd, *s);
 613:	8b 45 f4             	mov    -0xc(%ebp),%eax
 616:	0f b6 00             	movzbl (%eax),%eax
 619:	0f be c0             	movsbl %al,%eax
 61c:	83 ec 08             	sub    $0x8,%esp
 61f:	50                   	push   %eax
 620:	ff 75 08             	pushl  0x8(%ebp)
 623:	e8 31 fe ff ff       	call   459 <putc>
 628:	83 c4 10             	add    $0x10,%esp
          s++;
 62b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 62f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 632:	0f b6 00             	movzbl (%eax),%eax
 635:	84 c0                	test   %al,%al
 637:	75 da                	jne    613 <printf+0xe3>
 639:	eb 65                	jmp    6a0 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 63b:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 63f:	75 1d                	jne    65e <printf+0x12e>
        putc(fd, *ap);
 641:	8b 45 e8             	mov    -0x18(%ebp),%eax
 644:	8b 00                	mov    (%eax),%eax
 646:	0f be c0             	movsbl %al,%eax
 649:	83 ec 08             	sub    $0x8,%esp
 64c:	50                   	push   %eax
 64d:	ff 75 08             	pushl  0x8(%ebp)
 650:	e8 04 fe ff ff       	call   459 <putc>
 655:	83 c4 10             	add    $0x10,%esp
        ap++;
 658:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 65c:	eb 42                	jmp    6a0 <printf+0x170>
      } else if(c == '%'){
 65e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 662:	75 17                	jne    67b <printf+0x14b>
        putc(fd, c);
 664:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 667:	0f be c0             	movsbl %al,%eax
 66a:	83 ec 08             	sub    $0x8,%esp
 66d:	50                   	push   %eax
 66e:	ff 75 08             	pushl  0x8(%ebp)
 671:	e8 e3 fd ff ff       	call   459 <putc>
 676:	83 c4 10             	add    $0x10,%esp
 679:	eb 25                	jmp    6a0 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 67b:	83 ec 08             	sub    $0x8,%esp
 67e:	6a 25                	push   $0x25
 680:	ff 75 08             	pushl  0x8(%ebp)
 683:	e8 d1 fd ff ff       	call   459 <putc>
 688:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 68b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 68e:	0f be c0             	movsbl %al,%eax
 691:	83 ec 08             	sub    $0x8,%esp
 694:	50                   	push   %eax
 695:	ff 75 08             	pushl  0x8(%ebp)
 698:	e8 bc fd ff ff       	call   459 <putc>
 69d:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6a0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6a7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6ab:	8b 55 0c             	mov    0xc(%ebp),%edx
 6ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6b1:	01 d0                	add    %edx,%eax
 6b3:	0f b6 00             	movzbl (%eax),%eax
 6b6:	84 c0                	test   %al,%al
 6b8:	0f 85 94 fe ff ff    	jne    552 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6be:	90                   	nop
 6bf:	c9                   	leave  
 6c0:	c3                   	ret    

000006c1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c1:	55                   	push   %ebp
 6c2:	89 e5                	mov    %esp,%ebp
 6c4:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6c7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ca:	83 e8 08             	sub    $0x8,%eax
 6cd:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d0:	a1 74 0b 00 00       	mov    0xb74,%eax
 6d5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6d8:	eb 24                	jmp    6fe <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6da:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6dd:	8b 00                	mov    (%eax),%eax
 6df:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6e2:	77 12                	ja     6f6 <free+0x35>
 6e4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6ea:	77 24                	ja     710 <free+0x4f>
 6ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ef:	8b 00                	mov    (%eax),%eax
 6f1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6f4:	77 1a                	ja     710 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f9:	8b 00                	mov    (%eax),%eax
 6fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6fe:	8b 45 f8             	mov    -0x8(%ebp),%eax
 701:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 704:	76 d4                	jbe    6da <free+0x19>
 706:	8b 45 fc             	mov    -0x4(%ebp),%eax
 709:	8b 00                	mov    (%eax),%eax
 70b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 70e:	76 ca                	jbe    6da <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 710:	8b 45 f8             	mov    -0x8(%ebp),%eax
 713:	8b 40 04             	mov    0x4(%eax),%eax
 716:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 71d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 720:	01 c2                	add    %eax,%edx
 722:	8b 45 fc             	mov    -0x4(%ebp),%eax
 725:	8b 00                	mov    (%eax),%eax
 727:	39 c2                	cmp    %eax,%edx
 729:	75 24                	jne    74f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 72b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72e:	8b 50 04             	mov    0x4(%eax),%edx
 731:	8b 45 fc             	mov    -0x4(%ebp),%eax
 734:	8b 00                	mov    (%eax),%eax
 736:	8b 40 04             	mov    0x4(%eax),%eax
 739:	01 c2                	add    %eax,%edx
 73b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73e:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 741:	8b 45 fc             	mov    -0x4(%ebp),%eax
 744:	8b 00                	mov    (%eax),%eax
 746:	8b 10                	mov    (%eax),%edx
 748:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74b:	89 10                	mov    %edx,(%eax)
 74d:	eb 0a                	jmp    759 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 74f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 752:	8b 10                	mov    (%eax),%edx
 754:	8b 45 f8             	mov    -0x8(%ebp),%eax
 757:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 759:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75c:	8b 40 04             	mov    0x4(%eax),%eax
 75f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 766:	8b 45 fc             	mov    -0x4(%ebp),%eax
 769:	01 d0                	add    %edx,%eax
 76b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76e:	75 20                	jne    790 <free+0xcf>
    p->s.size += bp->s.size;
 770:	8b 45 fc             	mov    -0x4(%ebp),%eax
 773:	8b 50 04             	mov    0x4(%eax),%edx
 776:	8b 45 f8             	mov    -0x8(%ebp),%eax
 779:	8b 40 04             	mov    0x4(%eax),%eax
 77c:	01 c2                	add    %eax,%edx
 77e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 781:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 784:	8b 45 f8             	mov    -0x8(%ebp),%eax
 787:	8b 10                	mov    (%eax),%edx
 789:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78c:	89 10                	mov    %edx,(%eax)
 78e:	eb 08                	jmp    798 <free+0xd7>
  } else
    p->s.ptr = bp;
 790:	8b 45 fc             	mov    -0x4(%ebp),%eax
 793:	8b 55 f8             	mov    -0x8(%ebp),%edx
 796:	89 10                	mov    %edx,(%eax)
  freep = p;
 798:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79b:	a3 74 0b 00 00       	mov    %eax,0xb74
}
 7a0:	90                   	nop
 7a1:	c9                   	leave  
 7a2:	c3                   	ret    

000007a3 <morecore>:

static Header*
morecore(uint nu)
{
 7a3:	55                   	push   %ebp
 7a4:	89 e5                	mov    %esp,%ebp
 7a6:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7a9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7b0:	77 07                	ja     7b9 <morecore+0x16>
    nu = 4096;
 7b2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7b9:	8b 45 08             	mov    0x8(%ebp),%eax
 7bc:	c1 e0 03             	shl    $0x3,%eax
 7bf:	83 ec 0c             	sub    $0xc,%esp
 7c2:	50                   	push   %eax
 7c3:	e8 79 fc ff ff       	call   441 <sbrk>
 7c8:	83 c4 10             	add    $0x10,%esp
 7cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7ce:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7d2:	75 07                	jne    7db <morecore+0x38>
    return 0;
 7d4:	b8 00 00 00 00       	mov    $0x0,%eax
 7d9:	eb 26                	jmp    801 <morecore+0x5e>
  hp = (Header*)p;
 7db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7de:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e4:	8b 55 08             	mov    0x8(%ebp),%edx
 7e7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ed:	83 c0 08             	add    $0x8,%eax
 7f0:	83 ec 0c             	sub    $0xc,%esp
 7f3:	50                   	push   %eax
 7f4:	e8 c8 fe ff ff       	call   6c1 <free>
 7f9:	83 c4 10             	add    $0x10,%esp
  return freep;
 7fc:	a1 74 0b 00 00       	mov    0xb74,%eax
}
 801:	c9                   	leave  
 802:	c3                   	ret    

00000803 <malloc>:

void*
malloc(uint nbytes)
{
 803:	55                   	push   %ebp
 804:	89 e5                	mov    %esp,%ebp
 806:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 809:	8b 45 08             	mov    0x8(%ebp),%eax
 80c:	83 c0 07             	add    $0x7,%eax
 80f:	c1 e8 03             	shr    $0x3,%eax
 812:	83 c0 01             	add    $0x1,%eax
 815:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 818:	a1 74 0b 00 00       	mov    0xb74,%eax
 81d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 820:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 824:	75 23                	jne    849 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 826:	c7 45 f0 6c 0b 00 00 	movl   $0xb6c,-0x10(%ebp)
 82d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 830:	a3 74 0b 00 00       	mov    %eax,0xb74
 835:	a1 74 0b 00 00       	mov    0xb74,%eax
 83a:	a3 6c 0b 00 00       	mov    %eax,0xb6c
    base.s.size = 0;
 83f:	c7 05 70 0b 00 00 00 	movl   $0x0,0xb70
 846:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 849:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84c:	8b 00                	mov    (%eax),%eax
 84e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 851:	8b 45 f4             	mov    -0xc(%ebp),%eax
 854:	8b 40 04             	mov    0x4(%eax),%eax
 857:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 85a:	72 4d                	jb     8a9 <malloc+0xa6>
      if(p->s.size == nunits)
 85c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85f:	8b 40 04             	mov    0x4(%eax),%eax
 862:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 865:	75 0c                	jne    873 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 867:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86a:	8b 10                	mov    (%eax),%edx
 86c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86f:	89 10                	mov    %edx,(%eax)
 871:	eb 26                	jmp    899 <malloc+0x96>
      else {
        p->s.size -= nunits;
 873:	8b 45 f4             	mov    -0xc(%ebp),%eax
 876:	8b 40 04             	mov    0x4(%eax),%eax
 879:	2b 45 ec             	sub    -0x14(%ebp),%eax
 87c:	89 c2                	mov    %eax,%edx
 87e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 881:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 884:	8b 45 f4             	mov    -0xc(%ebp),%eax
 887:	8b 40 04             	mov    0x4(%eax),%eax
 88a:	c1 e0 03             	shl    $0x3,%eax
 88d:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 890:	8b 45 f4             	mov    -0xc(%ebp),%eax
 893:	8b 55 ec             	mov    -0x14(%ebp),%edx
 896:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 899:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89c:	a3 74 0b 00 00       	mov    %eax,0xb74
      return (void*)(p + 1);
 8a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a4:	83 c0 08             	add    $0x8,%eax
 8a7:	eb 3b                	jmp    8e4 <malloc+0xe1>
    }
    if(p == freep)
 8a9:	a1 74 0b 00 00       	mov    0xb74,%eax
 8ae:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8b1:	75 1e                	jne    8d1 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 8b3:	83 ec 0c             	sub    $0xc,%esp
 8b6:	ff 75 ec             	pushl  -0x14(%ebp)
 8b9:	e8 e5 fe ff ff       	call   7a3 <morecore>
 8be:	83 c4 10             	add    $0x10,%esp
 8c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8c4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8c8:	75 07                	jne    8d1 <malloc+0xce>
        return 0;
 8ca:	b8 00 00 00 00       	mov    $0x0,%eax
 8cf:	eb 13                	jmp    8e4 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8da:	8b 00                	mov    (%eax),%eax
 8dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8df:	e9 6d ff ff ff       	jmp    851 <malloc+0x4e>
}
 8e4:	c9                   	leave  
 8e5:	c3                   	ret    

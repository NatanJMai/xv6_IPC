
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 14             	sub    $0x14,%esp
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   7:	83 ec 0c             	sub    $0xc,%esp
   a:	ff 75 08             	pushl  0x8(%ebp)
   d:	e8 c9 03 00 00       	call   3db <strlen>
  12:	83 c4 10             	add    $0x10,%esp
  15:	89 c2                	mov    %eax,%edx
  17:	8b 45 08             	mov    0x8(%ebp),%eax
  1a:	01 d0                	add    %edx,%eax
  1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1f:	eb 04                	jmp    25 <fmtname+0x25>
  21:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  25:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28:	3b 45 08             	cmp    0x8(%ebp),%eax
  2b:	72 0a                	jb     37 <fmtname+0x37>
  2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30:	0f b6 00             	movzbl (%eax),%eax
  33:	3c 2f                	cmp    $0x2f,%al
  35:	75 ea                	jne    21 <fmtname+0x21>
    ;
  p++;
  37:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  3b:	83 ec 0c             	sub    $0xc,%esp
  3e:	ff 75 f4             	pushl  -0xc(%ebp)
  41:	e8 95 03 00 00       	call   3db <strlen>
  46:	83 c4 10             	add    $0x10,%esp
  49:	83 f8 0d             	cmp    $0xd,%eax
  4c:	76 05                	jbe    53 <fmtname+0x53>
    return p;
  4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  51:	eb 60                	jmp    b3 <fmtname+0xb3>
  memmove(buf, p, strlen(p));
  53:	83 ec 0c             	sub    $0xc,%esp
  56:	ff 75 f4             	pushl  -0xc(%ebp)
  59:	e8 7d 03 00 00       	call   3db <strlen>
  5e:	83 c4 10             	add    $0x10,%esp
  61:	83 ec 04             	sub    $0x4,%esp
  64:	50                   	push   %eax
  65:	ff 75 f4             	pushl  -0xc(%ebp)
  68:	68 e0 0d 00 00       	push   $0xde0
  6d:	e8 e6 04 00 00       	call   558 <memmove>
  72:	83 c4 10             	add    $0x10,%esp
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  75:	83 ec 0c             	sub    $0xc,%esp
  78:	ff 75 f4             	pushl  -0xc(%ebp)
  7b:	e8 5b 03 00 00       	call   3db <strlen>
  80:	83 c4 10             	add    $0x10,%esp
  83:	ba 0e 00 00 00       	mov    $0xe,%edx
  88:	89 d3                	mov    %edx,%ebx
  8a:	29 c3                	sub    %eax,%ebx
  8c:	83 ec 0c             	sub    $0xc,%esp
  8f:	ff 75 f4             	pushl  -0xc(%ebp)
  92:	e8 44 03 00 00       	call   3db <strlen>
  97:	83 c4 10             	add    $0x10,%esp
  9a:	05 e0 0d 00 00       	add    $0xde0,%eax
  9f:	83 ec 04             	sub    $0x4,%esp
  a2:	53                   	push   %ebx
  a3:	6a 20                	push   $0x20
  a5:	50                   	push   %eax
  a6:	e8 57 03 00 00       	call   402 <memset>
  ab:	83 c4 10             	add    $0x10,%esp
  return buf;
  ae:	b8 e0 0d 00 00       	mov    $0xde0,%eax
}
  b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b6:	c9                   	leave  
  b7:	c3                   	ret    

000000b8 <ls>:

void
ls(char *path)
{
  b8:	55                   	push   %ebp
  b9:	89 e5                	mov    %esp,%ebp
  bb:	57                   	push   %edi
  bc:	56                   	push   %esi
  bd:	53                   	push   %ebx
  be:	81 ec 3c 02 00 00    	sub    $0x23c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
  c4:	83 ec 08             	sub    $0x8,%esp
  c7:	6a 00                	push   $0x0
  c9:	ff 75 08             	pushl  0x8(%ebp)
  cc:	e8 1c 05 00 00       	call   5ed <open>
  d1:	83 c4 10             	add    $0x10,%esp
  d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  db:	79 1a                	jns    f7 <ls+0x3f>
    printf(2, "ls: cannot open %s\n", path);
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 75 08             	pushl  0x8(%ebp)
  e3:	68 da 0a 00 00       	push   $0xada
  e8:	6a 02                	push   $0x2
  ea:	e8 35 06 00 00       	call   724 <printf>
  ef:	83 c4 10             	add    $0x10,%esp
    return;
  f2:	e9 e3 01 00 00       	jmp    2da <ls+0x222>
  }
  
  if(fstat(fd, &st) < 0){
  f7:	83 ec 08             	sub    $0x8,%esp
  fa:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 100:	50                   	push   %eax
 101:	ff 75 e4             	pushl  -0x1c(%ebp)
 104:	e8 fc 04 00 00       	call   605 <fstat>
 109:	83 c4 10             	add    $0x10,%esp
 10c:	85 c0                	test   %eax,%eax
 10e:	79 28                	jns    138 <ls+0x80>
    printf(2, "ls: cannot stat %s\n", path);
 110:	83 ec 04             	sub    $0x4,%esp
 113:	ff 75 08             	pushl  0x8(%ebp)
 116:	68 ee 0a 00 00       	push   $0xaee
 11b:	6a 02                	push   $0x2
 11d:	e8 02 06 00 00       	call   724 <printf>
 122:	83 c4 10             	add    $0x10,%esp
    close(fd);
 125:	83 ec 0c             	sub    $0xc,%esp
 128:	ff 75 e4             	pushl  -0x1c(%ebp)
 12b:	e8 a5 04 00 00       	call   5d5 <close>
 130:	83 c4 10             	add    $0x10,%esp
    return;
 133:	e9 a2 01 00 00       	jmp    2da <ls+0x222>
  }
  
  switch(st.type){
 138:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 13f:	98                   	cwtl   
 140:	83 f8 01             	cmp    $0x1,%eax
 143:	74 48                	je     18d <ls+0xd5>
 145:	83 f8 02             	cmp    $0x2,%eax
 148:	0f 85 7e 01 00 00    	jne    2cc <ls+0x214>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 14e:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 154:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 15a:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 161:	0f bf d8             	movswl %ax,%ebx
 164:	83 ec 0c             	sub    $0xc,%esp
 167:	ff 75 08             	pushl  0x8(%ebp)
 16a:	e8 91 fe ff ff       	call   0 <fmtname>
 16f:	83 c4 10             	add    $0x10,%esp
 172:	83 ec 08             	sub    $0x8,%esp
 175:	57                   	push   %edi
 176:	56                   	push   %esi
 177:	53                   	push   %ebx
 178:	50                   	push   %eax
 179:	68 02 0b 00 00       	push   $0xb02
 17e:	6a 01                	push   $0x1
 180:	e8 9f 05 00 00       	call   724 <printf>
 185:	83 c4 20             	add    $0x20,%esp
    break;
 188:	e9 3f 01 00 00       	jmp    2cc <ls+0x214>
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 18d:	83 ec 0c             	sub    $0xc,%esp
 190:	ff 75 08             	pushl  0x8(%ebp)
 193:	e8 43 02 00 00       	call   3db <strlen>
 198:	83 c4 10             	add    $0x10,%esp
 19b:	83 c0 10             	add    $0x10,%eax
 19e:	3d 00 02 00 00       	cmp    $0x200,%eax
 1a3:	76 17                	jbe    1bc <ls+0x104>
      printf(1, "ls: path too long\n");
 1a5:	83 ec 08             	sub    $0x8,%esp
 1a8:	68 0f 0b 00 00       	push   $0xb0f
 1ad:	6a 01                	push   $0x1
 1af:	e8 70 05 00 00       	call   724 <printf>
 1b4:	83 c4 10             	add    $0x10,%esp
      break;
 1b7:	e9 10 01 00 00       	jmp    2cc <ls+0x214>
    }
    strcpy(buf, path);
 1bc:	83 ec 08             	sub    $0x8,%esp
 1bf:	ff 75 08             	pushl  0x8(%ebp)
 1c2:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1c8:	50                   	push   %eax
 1c9:	e8 9e 01 00 00       	call   36c <strcpy>
 1ce:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1da:	50                   	push   %eax
 1db:	e8 fb 01 00 00       	call   3db <strlen>
 1e0:	83 c4 10             	add    $0x10,%esp
 1e3:	89 c2                	mov    %eax,%edx
 1e5:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1eb:	01 d0                	add    %edx,%eax
 1ed:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
 1f0:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1f3:	8d 50 01             	lea    0x1(%eax),%edx
 1f6:	89 55 e0             	mov    %edx,-0x20(%ebp)
 1f9:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1fc:	e9 aa 00 00 00       	jmp    2ab <ls+0x1f3>
      if(de.inum == 0)
 201:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 208:	66 85 c0             	test   %ax,%ax
 20b:	75 05                	jne    212 <ls+0x15a>
        continue;
 20d:	e9 99 00 00 00       	jmp    2ab <ls+0x1f3>
      memmove(p, de.name, DIRSIZ);
 212:	83 ec 04             	sub    $0x4,%esp
 215:	6a 0e                	push   $0xe
 217:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 21d:	83 c0 02             	add    $0x2,%eax
 220:	50                   	push   %eax
 221:	ff 75 e0             	pushl  -0x20(%ebp)
 224:	e8 2f 03 00 00       	call   558 <memmove>
 229:	83 c4 10             	add    $0x10,%esp
      p[DIRSIZ] = 0;
 22c:	8b 45 e0             	mov    -0x20(%ebp),%eax
 22f:	83 c0 0e             	add    $0xe,%eax
 232:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 235:	83 ec 08             	sub    $0x8,%esp
 238:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 23e:	50                   	push   %eax
 23f:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 245:	50                   	push   %eax
 246:	e8 73 02 00 00       	call   4be <stat>
 24b:	83 c4 10             	add    $0x10,%esp
 24e:	85 c0                	test   %eax,%eax
 250:	79 1b                	jns    26d <ls+0x1b5>
        printf(1, "ls: cannot stat %s\n", buf);
 252:	83 ec 04             	sub    $0x4,%esp
 255:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 25b:	50                   	push   %eax
 25c:	68 ee 0a 00 00       	push   $0xaee
 261:	6a 01                	push   $0x1
 263:	e8 bc 04 00 00       	call   724 <printf>
 268:	83 c4 10             	add    $0x10,%esp
        continue;
 26b:	eb 3e                	jmp    2ab <ls+0x1f3>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 26d:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 273:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 279:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 280:	0f bf d8             	movswl %ax,%ebx
 283:	83 ec 0c             	sub    $0xc,%esp
 286:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 28c:	50                   	push   %eax
 28d:	e8 6e fd ff ff       	call   0 <fmtname>
 292:	83 c4 10             	add    $0x10,%esp
 295:	83 ec 08             	sub    $0x8,%esp
 298:	57                   	push   %edi
 299:	56                   	push   %esi
 29a:	53                   	push   %ebx
 29b:	50                   	push   %eax
 29c:	68 02 0b 00 00       	push   $0xb02
 2a1:	6a 01                	push   $0x1
 2a3:	e8 7c 04 00 00       	call   724 <printf>
 2a8:	83 c4 20             	add    $0x20,%esp
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2ab:	83 ec 04             	sub    $0x4,%esp
 2ae:	6a 10                	push   $0x10
 2b0:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2b6:	50                   	push   %eax
 2b7:	ff 75 e4             	pushl  -0x1c(%ebp)
 2ba:	e8 06 03 00 00       	call   5c5 <read>
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	83 f8 10             	cmp    $0x10,%eax
 2c5:	0f 84 36 ff ff ff    	je     201 <ls+0x149>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
 2cb:	90                   	nop
  }
  close(fd);
 2cc:	83 ec 0c             	sub    $0xc,%esp
 2cf:	ff 75 e4             	pushl  -0x1c(%ebp)
 2d2:	e8 fe 02 00 00       	call   5d5 <close>
 2d7:	83 c4 10             	add    $0x10,%esp
}
 2da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2dd:	5b                   	pop    %ebx
 2de:	5e                   	pop    %esi
 2df:	5f                   	pop    %edi
 2e0:	5d                   	pop    %ebp
 2e1:	c3                   	ret    

000002e2 <main>:

int
main(int argc, char *argv[])
{
 2e2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2e6:	83 e4 f0             	and    $0xfffffff0,%esp
 2e9:	ff 71 fc             	pushl  -0x4(%ecx)
 2ec:	55                   	push   %ebp
 2ed:	89 e5                	mov    %esp,%ebp
 2ef:	53                   	push   %ebx
 2f0:	51                   	push   %ecx
 2f1:	83 ec 10             	sub    $0x10,%esp
 2f4:	89 cb                	mov    %ecx,%ebx
  int i;

  if(argc < 2){
 2f6:	83 3b 01             	cmpl   $0x1,(%ebx)
 2f9:	7f 15                	jg     310 <main+0x2e>
    ls(".");
 2fb:	83 ec 0c             	sub    $0xc,%esp
 2fe:	68 22 0b 00 00       	push   $0xb22
 303:	e8 b0 fd ff ff       	call   b8 <ls>
 308:	83 c4 10             	add    $0x10,%esp
    exit();
 30b:	e8 9d 02 00 00       	call   5ad <exit>
  }
  for(i=1; i<argc; i++)
 310:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
 317:	eb 21                	jmp    33a <main+0x58>
    ls(argv[i]);
 319:	8b 45 f4             	mov    -0xc(%ebp),%eax
 31c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 323:	8b 43 04             	mov    0x4(%ebx),%eax
 326:	01 d0                	add    %edx,%eax
 328:	8b 00                	mov    (%eax),%eax
 32a:	83 ec 0c             	sub    $0xc,%esp
 32d:	50                   	push   %eax
 32e:	e8 85 fd ff ff       	call   b8 <ls>
 333:	83 c4 10             	add    $0x10,%esp

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 336:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 33a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 33d:	3b 03                	cmp    (%ebx),%eax
 33f:	7c d8                	jl     319 <main+0x37>
    ls(argv[i]);
  exit();
 341:	e8 67 02 00 00       	call   5ad <exit>

00000346 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 346:	55                   	push   %ebp
 347:	89 e5                	mov    %esp,%ebp
 349:	57                   	push   %edi
 34a:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 34b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 34e:	8b 55 10             	mov    0x10(%ebp),%edx
 351:	8b 45 0c             	mov    0xc(%ebp),%eax
 354:	89 cb                	mov    %ecx,%ebx
 356:	89 df                	mov    %ebx,%edi
 358:	89 d1                	mov    %edx,%ecx
 35a:	fc                   	cld    
 35b:	f3 aa                	rep stos %al,%es:(%edi)
 35d:	89 ca                	mov    %ecx,%edx
 35f:	89 fb                	mov    %edi,%ebx
 361:	89 5d 08             	mov    %ebx,0x8(%ebp)
 364:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 367:	90                   	nop
 368:	5b                   	pop    %ebx
 369:	5f                   	pop    %edi
 36a:	5d                   	pop    %ebp
 36b:	c3                   	ret    

0000036c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 36c:	55                   	push   %ebp
 36d:	89 e5                	mov    %esp,%ebp
 36f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 372:	8b 45 08             	mov    0x8(%ebp),%eax
 375:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 378:	90                   	nop
 379:	8b 45 08             	mov    0x8(%ebp),%eax
 37c:	8d 50 01             	lea    0x1(%eax),%edx
 37f:	89 55 08             	mov    %edx,0x8(%ebp)
 382:	8b 55 0c             	mov    0xc(%ebp),%edx
 385:	8d 4a 01             	lea    0x1(%edx),%ecx
 388:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 38b:	0f b6 12             	movzbl (%edx),%edx
 38e:	88 10                	mov    %dl,(%eax)
 390:	0f b6 00             	movzbl (%eax),%eax
 393:	84 c0                	test   %al,%al
 395:	75 e2                	jne    379 <strcpy+0xd>
    ;
  return os;
 397:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 39a:	c9                   	leave  
 39b:	c3                   	ret    

0000039c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 39c:	55                   	push   %ebp
 39d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 39f:	eb 08                	jmp    3a9 <strcmp+0xd>
    p++, q++;
 3a1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3a5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3a9:	8b 45 08             	mov    0x8(%ebp),%eax
 3ac:	0f b6 00             	movzbl (%eax),%eax
 3af:	84 c0                	test   %al,%al
 3b1:	74 10                	je     3c3 <strcmp+0x27>
 3b3:	8b 45 08             	mov    0x8(%ebp),%eax
 3b6:	0f b6 10             	movzbl (%eax),%edx
 3b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bc:	0f b6 00             	movzbl (%eax),%eax
 3bf:	38 c2                	cmp    %al,%dl
 3c1:	74 de                	je     3a1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3c3:	8b 45 08             	mov    0x8(%ebp),%eax
 3c6:	0f b6 00             	movzbl (%eax),%eax
 3c9:	0f b6 d0             	movzbl %al,%edx
 3cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cf:	0f b6 00             	movzbl (%eax),%eax
 3d2:	0f b6 c0             	movzbl %al,%eax
 3d5:	29 c2                	sub    %eax,%edx
 3d7:	89 d0                	mov    %edx,%eax
}
 3d9:	5d                   	pop    %ebp
 3da:	c3                   	ret    

000003db <strlen>:

uint
strlen(char *s)
{
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
 3de:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3e1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3e8:	eb 04                	jmp    3ee <strlen+0x13>
 3ea:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3ee:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3f1:	8b 45 08             	mov    0x8(%ebp),%eax
 3f4:	01 d0                	add    %edx,%eax
 3f6:	0f b6 00             	movzbl (%eax),%eax
 3f9:	84 c0                	test   %al,%al
 3fb:	75 ed                	jne    3ea <strlen+0xf>
    ;
  return n;
 3fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 400:	c9                   	leave  
 401:	c3                   	ret    

00000402 <memset>:

void*
memset(void *dst, int c, uint n)
{
 402:	55                   	push   %ebp
 403:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 405:	8b 45 10             	mov    0x10(%ebp),%eax
 408:	50                   	push   %eax
 409:	ff 75 0c             	pushl  0xc(%ebp)
 40c:	ff 75 08             	pushl  0x8(%ebp)
 40f:	e8 32 ff ff ff       	call   346 <stosb>
 414:	83 c4 0c             	add    $0xc,%esp
  return dst;
 417:	8b 45 08             	mov    0x8(%ebp),%eax
}
 41a:	c9                   	leave  
 41b:	c3                   	ret    

0000041c <strchr>:

char*
strchr(const char *s, char c)
{
 41c:	55                   	push   %ebp
 41d:	89 e5                	mov    %esp,%ebp
 41f:	83 ec 04             	sub    $0x4,%esp
 422:	8b 45 0c             	mov    0xc(%ebp),%eax
 425:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 428:	eb 14                	jmp    43e <strchr+0x22>
    if(*s == c)
 42a:	8b 45 08             	mov    0x8(%ebp),%eax
 42d:	0f b6 00             	movzbl (%eax),%eax
 430:	3a 45 fc             	cmp    -0x4(%ebp),%al
 433:	75 05                	jne    43a <strchr+0x1e>
      return (char*)s;
 435:	8b 45 08             	mov    0x8(%ebp),%eax
 438:	eb 13                	jmp    44d <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 43a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 43e:	8b 45 08             	mov    0x8(%ebp),%eax
 441:	0f b6 00             	movzbl (%eax),%eax
 444:	84 c0                	test   %al,%al
 446:	75 e2                	jne    42a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 448:	b8 00 00 00 00       	mov    $0x0,%eax
}
 44d:	c9                   	leave  
 44e:	c3                   	ret    

0000044f <gets>:

char*
gets(char *buf, int max)
{
 44f:	55                   	push   %ebp
 450:	89 e5                	mov    %esp,%ebp
 452:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 455:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 45c:	eb 42                	jmp    4a0 <gets+0x51>
    cc = read(0, &c, 1);
 45e:	83 ec 04             	sub    $0x4,%esp
 461:	6a 01                	push   $0x1
 463:	8d 45 ef             	lea    -0x11(%ebp),%eax
 466:	50                   	push   %eax
 467:	6a 00                	push   $0x0
 469:	e8 57 01 00 00       	call   5c5 <read>
 46e:	83 c4 10             	add    $0x10,%esp
 471:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 474:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 478:	7e 33                	jle    4ad <gets+0x5e>
      break;
    buf[i++] = c;
 47a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 47d:	8d 50 01             	lea    0x1(%eax),%edx
 480:	89 55 f4             	mov    %edx,-0xc(%ebp)
 483:	89 c2                	mov    %eax,%edx
 485:	8b 45 08             	mov    0x8(%ebp),%eax
 488:	01 c2                	add    %eax,%edx
 48a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 48e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 490:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 494:	3c 0a                	cmp    $0xa,%al
 496:	74 16                	je     4ae <gets+0x5f>
 498:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 49c:	3c 0d                	cmp    $0xd,%al
 49e:	74 0e                	je     4ae <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a3:	83 c0 01             	add    $0x1,%eax
 4a6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4a9:	7c b3                	jl     45e <gets+0xf>
 4ab:	eb 01                	jmp    4ae <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 4ad:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4b1:	8b 45 08             	mov    0x8(%ebp),%eax
 4b4:	01 d0                	add    %edx,%eax
 4b6:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4b9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4bc:	c9                   	leave  
 4bd:	c3                   	ret    

000004be <stat>:

int
stat(char *n, struct stat *st)
{
 4be:	55                   	push   %ebp
 4bf:	89 e5                	mov    %esp,%ebp
 4c1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c4:	83 ec 08             	sub    $0x8,%esp
 4c7:	6a 00                	push   $0x0
 4c9:	ff 75 08             	pushl  0x8(%ebp)
 4cc:	e8 1c 01 00 00       	call   5ed <open>
 4d1:	83 c4 10             	add    $0x10,%esp
 4d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4db:	79 07                	jns    4e4 <stat+0x26>
    return -1;
 4dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4e2:	eb 25                	jmp    509 <stat+0x4b>
  r = fstat(fd, st);
 4e4:	83 ec 08             	sub    $0x8,%esp
 4e7:	ff 75 0c             	pushl  0xc(%ebp)
 4ea:	ff 75 f4             	pushl  -0xc(%ebp)
 4ed:	e8 13 01 00 00       	call   605 <fstat>
 4f2:	83 c4 10             	add    $0x10,%esp
 4f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4f8:	83 ec 0c             	sub    $0xc,%esp
 4fb:	ff 75 f4             	pushl  -0xc(%ebp)
 4fe:	e8 d2 00 00 00       	call   5d5 <close>
 503:	83 c4 10             	add    $0x10,%esp
  return r;
 506:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 509:	c9                   	leave  
 50a:	c3                   	ret    

0000050b <atoi>:

int
atoi(const char *s)
{
 50b:	55                   	push   %ebp
 50c:	89 e5                	mov    %esp,%ebp
 50e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 511:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 518:	eb 25                	jmp    53f <atoi+0x34>
    n = n*10 + *s++ - '0';
 51a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 51d:	89 d0                	mov    %edx,%eax
 51f:	c1 e0 02             	shl    $0x2,%eax
 522:	01 d0                	add    %edx,%eax
 524:	01 c0                	add    %eax,%eax
 526:	89 c1                	mov    %eax,%ecx
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	8d 50 01             	lea    0x1(%eax),%edx
 52e:	89 55 08             	mov    %edx,0x8(%ebp)
 531:	0f b6 00             	movzbl (%eax),%eax
 534:	0f be c0             	movsbl %al,%eax
 537:	01 c8                	add    %ecx,%eax
 539:	83 e8 30             	sub    $0x30,%eax
 53c:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 53f:	8b 45 08             	mov    0x8(%ebp),%eax
 542:	0f b6 00             	movzbl (%eax),%eax
 545:	3c 2f                	cmp    $0x2f,%al
 547:	7e 0a                	jle    553 <atoi+0x48>
 549:	8b 45 08             	mov    0x8(%ebp),%eax
 54c:	0f b6 00             	movzbl (%eax),%eax
 54f:	3c 39                	cmp    $0x39,%al
 551:	7e c7                	jle    51a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 553:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 556:	c9                   	leave  
 557:	c3                   	ret    

00000558 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 558:	55                   	push   %ebp
 559:	89 e5                	mov    %esp,%ebp
 55b:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 55e:	8b 45 08             	mov    0x8(%ebp),%eax
 561:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 564:	8b 45 0c             	mov    0xc(%ebp),%eax
 567:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 56a:	eb 17                	jmp    583 <memmove+0x2b>
    *dst++ = *src++;
 56c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 56f:	8d 50 01             	lea    0x1(%eax),%edx
 572:	89 55 fc             	mov    %edx,-0x4(%ebp)
 575:	8b 55 f8             	mov    -0x8(%ebp),%edx
 578:	8d 4a 01             	lea    0x1(%edx),%ecx
 57b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 57e:	0f b6 12             	movzbl (%edx),%edx
 581:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 583:	8b 45 10             	mov    0x10(%ebp),%eax
 586:	8d 50 ff             	lea    -0x1(%eax),%edx
 589:	89 55 10             	mov    %edx,0x10(%ebp)
 58c:	85 c0                	test   %eax,%eax
 58e:	7f dc                	jg     56c <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 590:	8b 45 08             	mov    0x8(%ebp),%eax
}
 593:	c9                   	leave  
 594:	c3                   	ret    

00000595 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 595:	b8 01 00 00 00       	mov    $0x1,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <msend>:
SYSCALL(msend)
 59d:	b8 16 00 00 00       	mov    $0x16,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <mrcve>:
SYSCALL(mrcve)
 5a5:	b8 17 00 00 00       	mov    $0x17,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <exit>:
SYSCALL(exit)
 5ad:	b8 02 00 00 00       	mov    $0x2,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <wait>:
SYSCALL(wait)
 5b5:	b8 03 00 00 00       	mov    $0x3,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <pipe>:
SYSCALL(pipe)
 5bd:	b8 04 00 00 00       	mov    $0x4,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <read>:
SYSCALL(read)
 5c5:	b8 05 00 00 00       	mov    $0x5,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <write>:
SYSCALL(write)
 5cd:	b8 10 00 00 00       	mov    $0x10,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <close>:
SYSCALL(close)
 5d5:	b8 15 00 00 00       	mov    $0x15,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <kill>:
SYSCALL(kill)
 5dd:	b8 06 00 00 00       	mov    $0x6,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <exec>:
SYSCALL(exec)
 5e5:	b8 07 00 00 00       	mov    $0x7,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <open>:
SYSCALL(open)
 5ed:	b8 0f 00 00 00       	mov    $0xf,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <mknod>:
SYSCALL(mknod)
 5f5:	b8 11 00 00 00       	mov    $0x11,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <unlink>:
SYSCALL(unlink)
 5fd:	b8 12 00 00 00       	mov    $0x12,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <fstat>:
SYSCALL(fstat)
 605:	b8 08 00 00 00       	mov    $0x8,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <link>:
SYSCALL(link)
 60d:	b8 13 00 00 00       	mov    $0x13,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <mkdir>:
SYSCALL(mkdir)
 615:	b8 14 00 00 00       	mov    $0x14,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <chdir>:
SYSCALL(chdir)
 61d:	b8 09 00 00 00       	mov    $0x9,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <dup>:
SYSCALL(dup)
 625:	b8 0a 00 00 00       	mov    $0xa,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <getpid>:
SYSCALL(getpid)
 62d:	b8 0b 00 00 00       	mov    $0xb,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <sbrk>:
SYSCALL(sbrk)
 635:	b8 0c 00 00 00       	mov    $0xc,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <sleep>:
SYSCALL(sleep)
 63d:	b8 0d 00 00 00       	mov    $0xd,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <uptime>:
SYSCALL(uptime)
 645:	b8 0e 00 00 00       	mov    $0xe,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 64d:	55                   	push   %ebp
 64e:	89 e5                	mov    %esp,%ebp
 650:	83 ec 18             	sub    $0x18,%esp
 653:	8b 45 0c             	mov    0xc(%ebp),%eax
 656:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 659:	83 ec 04             	sub    $0x4,%esp
 65c:	6a 01                	push   $0x1
 65e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 661:	50                   	push   %eax
 662:	ff 75 08             	pushl  0x8(%ebp)
 665:	e8 63 ff ff ff       	call   5cd <write>
 66a:	83 c4 10             	add    $0x10,%esp
}
 66d:	90                   	nop
 66e:	c9                   	leave  
 66f:	c3                   	ret    

00000670 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	53                   	push   %ebx
 674:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 677:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 67e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 682:	74 17                	je     69b <printint+0x2b>
 684:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 688:	79 11                	jns    69b <printint+0x2b>
    neg = 1;
 68a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 691:	8b 45 0c             	mov    0xc(%ebp),%eax
 694:	f7 d8                	neg    %eax
 696:	89 45 ec             	mov    %eax,-0x14(%ebp)
 699:	eb 06                	jmp    6a1 <printint+0x31>
  } else {
    x = xx;
 69b:	8b 45 0c             	mov    0xc(%ebp),%eax
 69e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6a1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6a8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6ab:	8d 41 01             	lea    0x1(%ecx),%eax
 6ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6b1:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6b7:	ba 00 00 00 00       	mov    $0x0,%edx
 6bc:	f7 f3                	div    %ebx
 6be:	89 d0                	mov    %edx,%eax
 6c0:	0f b6 80 cc 0d 00 00 	movzbl 0xdcc(%eax),%eax
 6c7:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6cb:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6d1:	ba 00 00 00 00       	mov    $0x0,%edx
 6d6:	f7 f3                	div    %ebx
 6d8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6db:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6df:	75 c7                	jne    6a8 <printint+0x38>
  if(neg)
 6e1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6e5:	74 2d                	je     714 <printint+0xa4>
    buf[i++] = '-';
 6e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ea:	8d 50 01             	lea    0x1(%eax),%edx
 6ed:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6f0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6f5:	eb 1d                	jmp    714 <printint+0xa4>
    putc(fd, buf[i]);
 6f7:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6fd:	01 d0                	add    %edx,%eax
 6ff:	0f b6 00             	movzbl (%eax),%eax
 702:	0f be c0             	movsbl %al,%eax
 705:	83 ec 08             	sub    $0x8,%esp
 708:	50                   	push   %eax
 709:	ff 75 08             	pushl  0x8(%ebp)
 70c:	e8 3c ff ff ff       	call   64d <putc>
 711:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 714:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 718:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 71c:	79 d9                	jns    6f7 <printint+0x87>
    putc(fd, buf[i]);
}
 71e:	90                   	nop
 71f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 722:	c9                   	leave  
 723:	c3                   	ret    

00000724 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 724:	55                   	push   %ebp
 725:	89 e5                	mov    %esp,%ebp
 727:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 72a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 731:	8d 45 0c             	lea    0xc(%ebp),%eax
 734:	83 c0 04             	add    $0x4,%eax
 737:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 73a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 741:	e9 59 01 00 00       	jmp    89f <printf+0x17b>
    c = fmt[i] & 0xff;
 746:	8b 55 0c             	mov    0xc(%ebp),%edx
 749:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74c:	01 d0                	add    %edx,%eax
 74e:	0f b6 00             	movzbl (%eax),%eax
 751:	0f be c0             	movsbl %al,%eax
 754:	25 ff 00 00 00       	and    $0xff,%eax
 759:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 75c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 760:	75 2c                	jne    78e <printf+0x6a>
      if(c == '%'){
 762:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 766:	75 0c                	jne    774 <printf+0x50>
        state = '%';
 768:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 76f:	e9 27 01 00 00       	jmp    89b <printf+0x177>
      } else {
        putc(fd, c);
 774:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 777:	0f be c0             	movsbl %al,%eax
 77a:	83 ec 08             	sub    $0x8,%esp
 77d:	50                   	push   %eax
 77e:	ff 75 08             	pushl  0x8(%ebp)
 781:	e8 c7 fe ff ff       	call   64d <putc>
 786:	83 c4 10             	add    $0x10,%esp
 789:	e9 0d 01 00 00       	jmp    89b <printf+0x177>
      }
    } else if(state == '%'){
 78e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 792:	0f 85 03 01 00 00    	jne    89b <printf+0x177>
      if(c == 'd'){
 798:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 79c:	75 1e                	jne    7bc <printf+0x98>
        printint(fd, *ap, 10, 1);
 79e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7a1:	8b 00                	mov    (%eax),%eax
 7a3:	6a 01                	push   $0x1
 7a5:	6a 0a                	push   $0xa
 7a7:	50                   	push   %eax
 7a8:	ff 75 08             	pushl  0x8(%ebp)
 7ab:	e8 c0 fe ff ff       	call   670 <printint>
 7b0:	83 c4 10             	add    $0x10,%esp
        ap++;
 7b3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7b7:	e9 d8 00 00 00       	jmp    894 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 7bc:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7c0:	74 06                	je     7c8 <printf+0xa4>
 7c2:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7c6:	75 1e                	jne    7e6 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 7c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7cb:	8b 00                	mov    (%eax),%eax
 7cd:	6a 00                	push   $0x0
 7cf:	6a 10                	push   $0x10
 7d1:	50                   	push   %eax
 7d2:	ff 75 08             	pushl  0x8(%ebp)
 7d5:	e8 96 fe ff ff       	call   670 <printint>
 7da:	83 c4 10             	add    $0x10,%esp
        ap++;
 7dd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7e1:	e9 ae 00 00 00       	jmp    894 <printf+0x170>
      } else if(c == 's'){
 7e6:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7ea:	75 43                	jne    82f <printf+0x10b>
        s = (char*)*ap;
 7ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7ef:	8b 00                	mov    (%eax),%eax
 7f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7f4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7f8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7fc:	75 25                	jne    823 <printf+0xff>
          s = "(null)";
 7fe:	c7 45 f4 24 0b 00 00 	movl   $0xb24,-0xc(%ebp)
        while(*s != 0){
 805:	eb 1c                	jmp    823 <printf+0xff>
          putc(fd, *s);
 807:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80a:	0f b6 00             	movzbl (%eax),%eax
 80d:	0f be c0             	movsbl %al,%eax
 810:	83 ec 08             	sub    $0x8,%esp
 813:	50                   	push   %eax
 814:	ff 75 08             	pushl  0x8(%ebp)
 817:	e8 31 fe ff ff       	call   64d <putc>
 81c:	83 c4 10             	add    $0x10,%esp
          s++;
 81f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 823:	8b 45 f4             	mov    -0xc(%ebp),%eax
 826:	0f b6 00             	movzbl (%eax),%eax
 829:	84 c0                	test   %al,%al
 82b:	75 da                	jne    807 <printf+0xe3>
 82d:	eb 65                	jmp    894 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 82f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 833:	75 1d                	jne    852 <printf+0x12e>
        putc(fd, *ap);
 835:	8b 45 e8             	mov    -0x18(%ebp),%eax
 838:	8b 00                	mov    (%eax),%eax
 83a:	0f be c0             	movsbl %al,%eax
 83d:	83 ec 08             	sub    $0x8,%esp
 840:	50                   	push   %eax
 841:	ff 75 08             	pushl  0x8(%ebp)
 844:	e8 04 fe ff ff       	call   64d <putc>
 849:	83 c4 10             	add    $0x10,%esp
        ap++;
 84c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 850:	eb 42                	jmp    894 <printf+0x170>
      } else if(c == '%'){
 852:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 856:	75 17                	jne    86f <printf+0x14b>
        putc(fd, c);
 858:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 85b:	0f be c0             	movsbl %al,%eax
 85e:	83 ec 08             	sub    $0x8,%esp
 861:	50                   	push   %eax
 862:	ff 75 08             	pushl  0x8(%ebp)
 865:	e8 e3 fd ff ff       	call   64d <putc>
 86a:	83 c4 10             	add    $0x10,%esp
 86d:	eb 25                	jmp    894 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 86f:	83 ec 08             	sub    $0x8,%esp
 872:	6a 25                	push   $0x25
 874:	ff 75 08             	pushl  0x8(%ebp)
 877:	e8 d1 fd ff ff       	call   64d <putc>
 87c:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 87f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 882:	0f be c0             	movsbl %al,%eax
 885:	83 ec 08             	sub    $0x8,%esp
 888:	50                   	push   %eax
 889:	ff 75 08             	pushl  0x8(%ebp)
 88c:	e8 bc fd ff ff       	call   64d <putc>
 891:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 894:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 89b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 89f:	8b 55 0c             	mov    0xc(%ebp),%edx
 8a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a5:	01 d0                	add    %edx,%eax
 8a7:	0f b6 00             	movzbl (%eax),%eax
 8aa:	84 c0                	test   %al,%al
 8ac:	0f 85 94 fe ff ff    	jne    746 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8b2:	90                   	nop
 8b3:	c9                   	leave  
 8b4:	c3                   	ret    

000008b5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8b5:	55                   	push   %ebp
 8b6:	89 e5                	mov    %esp,%ebp
 8b8:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8bb:	8b 45 08             	mov    0x8(%ebp),%eax
 8be:	83 e8 08             	sub    $0x8,%eax
 8c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c4:	a1 f8 0d 00 00       	mov    0xdf8,%eax
 8c9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8cc:	eb 24                	jmp    8f2 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d1:	8b 00                	mov    (%eax),%eax
 8d3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8d6:	77 12                	ja     8ea <free+0x35>
 8d8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8de:	77 24                	ja     904 <free+0x4f>
 8e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e3:	8b 00                	mov    (%eax),%eax
 8e5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8e8:	77 1a                	ja     904 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ed:	8b 00                	mov    (%eax),%eax
 8ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8f8:	76 d4                	jbe    8ce <free+0x19>
 8fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8fd:	8b 00                	mov    (%eax),%eax
 8ff:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 902:	76 ca                	jbe    8ce <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 904:	8b 45 f8             	mov    -0x8(%ebp),%eax
 907:	8b 40 04             	mov    0x4(%eax),%eax
 90a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 911:	8b 45 f8             	mov    -0x8(%ebp),%eax
 914:	01 c2                	add    %eax,%edx
 916:	8b 45 fc             	mov    -0x4(%ebp),%eax
 919:	8b 00                	mov    (%eax),%eax
 91b:	39 c2                	cmp    %eax,%edx
 91d:	75 24                	jne    943 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 91f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 922:	8b 50 04             	mov    0x4(%eax),%edx
 925:	8b 45 fc             	mov    -0x4(%ebp),%eax
 928:	8b 00                	mov    (%eax),%eax
 92a:	8b 40 04             	mov    0x4(%eax),%eax
 92d:	01 c2                	add    %eax,%edx
 92f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 932:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 935:	8b 45 fc             	mov    -0x4(%ebp),%eax
 938:	8b 00                	mov    (%eax),%eax
 93a:	8b 10                	mov    (%eax),%edx
 93c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 93f:	89 10                	mov    %edx,(%eax)
 941:	eb 0a                	jmp    94d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 943:	8b 45 fc             	mov    -0x4(%ebp),%eax
 946:	8b 10                	mov    (%eax),%edx
 948:	8b 45 f8             	mov    -0x8(%ebp),%eax
 94b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 94d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 950:	8b 40 04             	mov    0x4(%eax),%eax
 953:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 95a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95d:	01 d0                	add    %edx,%eax
 95f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 962:	75 20                	jne    984 <free+0xcf>
    p->s.size += bp->s.size;
 964:	8b 45 fc             	mov    -0x4(%ebp),%eax
 967:	8b 50 04             	mov    0x4(%eax),%edx
 96a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 96d:	8b 40 04             	mov    0x4(%eax),%eax
 970:	01 c2                	add    %eax,%edx
 972:	8b 45 fc             	mov    -0x4(%ebp),%eax
 975:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 978:	8b 45 f8             	mov    -0x8(%ebp),%eax
 97b:	8b 10                	mov    (%eax),%edx
 97d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 980:	89 10                	mov    %edx,(%eax)
 982:	eb 08                	jmp    98c <free+0xd7>
  } else
    p->s.ptr = bp;
 984:	8b 45 fc             	mov    -0x4(%ebp),%eax
 987:	8b 55 f8             	mov    -0x8(%ebp),%edx
 98a:	89 10                	mov    %edx,(%eax)
  freep = p;
 98c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98f:	a3 f8 0d 00 00       	mov    %eax,0xdf8
}
 994:	90                   	nop
 995:	c9                   	leave  
 996:	c3                   	ret    

00000997 <morecore>:

static Header*
morecore(uint nu)
{
 997:	55                   	push   %ebp
 998:	89 e5                	mov    %esp,%ebp
 99a:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 99d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9a4:	77 07                	ja     9ad <morecore+0x16>
    nu = 4096;
 9a6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9ad:	8b 45 08             	mov    0x8(%ebp),%eax
 9b0:	c1 e0 03             	shl    $0x3,%eax
 9b3:	83 ec 0c             	sub    $0xc,%esp
 9b6:	50                   	push   %eax
 9b7:	e8 79 fc ff ff       	call   635 <sbrk>
 9bc:	83 c4 10             	add    $0x10,%esp
 9bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9c2:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9c6:	75 07                	jne    9cf <morecore+0x38>
    return 0;
 9c8:	b8 00 00 00 00       	mov    $0x0,%eax
 9cd:	eb 26                	jmp    9f5 <morecore+0x5e>
  hp = (Header*)p;
 9cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9d8:	8b 55 08             	mov    0x8(%ebp),%edx
 9db:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9de:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e1:	83 c0 08             	add    $0x8,%eax
 9e4:	83 ec 0c             	sub    $0xc,%esp
 9e7:	50                   	push   %eax
 9e8:	e8 c8 fe ff ff       	call   8b5 <free>
 9ed:	83 c4 10             	add    $0x10,%esp
  return freep;
 9f0:	a1 f8 0d 00 00       	mov    0xdf8,%eax
}
 9f5:	c9                   	leave  
 9f6:	c3                   	ret    

000009f7 <malloc>:

void*
malloc(uint nbytes)
{
 9f7:	55                   	push   %ebp
 9f8:	89 e5                	mov    %esp,%ebp
 9fa:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9fd:	8b 45 08             	mov    0x8(%ebp),%eax
 a00:	83 c0 07             	add    $0x7,%eax
 a03:	c1 e8 03             	shr    $0x3,%eax
 a06:	83 c0 01             	add    $0x1,%eax
 a09:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a0c:	a1 f8 0d 00 00       	mov    0xdf8,%eax
 a11:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a14:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a18:	75 23                	jne    a3d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a1a:	c7 45 f0 f0 0d 00 00 	movl   $0xdf0,-0x10(%ebp)
 a21:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a24:	a3 f8 0d 00 00       	mov    %eax,0xdf8
 a29:	a1 f8 0d 00 00       	mov    0xdf8,%eax
 a2e:	a3 f0 0d 00 00       	mov    %eax,0xdf0
    base.s.size = 0;
 a33:	c7 05 f4 0d 00 00 00 	movl   $0x0,0xdf4
 a3a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a40:	8b 00                	mov    (%eax),%eax
 a42:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a45:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a48:	8b 40 04             	mov    0x4(%eax),%eax
 a4b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a4e:	72 4d                	jb     a9d <malloc+0xa6>
      if(p->s.size == nunits)
 a50:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a53:	8b 40 04             	mov    0x4(%eax),%eax
 a56:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a59:	75 0c                	jne    a67 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5e:	8b 10                	mov    (%eax),%edx
 a60:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a63:	89 10                	mov    %edx,(%eax)
 a65:	eb 26                	jmp    a8d <malloc+0x96>
      else {
        p->s.size -= nunits;
 a67:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a6a:	8b 40 04             	mov    0x4(%eax),%eax
 a6d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a70:	89 c2                	mov    %eax,%edx
 a72:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a75:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a78:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7b:	8b 40 04             	mov    0x4(%eax),%eax
 a7e:	c1 e0 03             	shl    $0x3,%eax
 a81:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a84:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a87:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a8a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a90:	a3 f8 0d 00 00       	mov    %eax,0xdf8
      return (void*)(p + 1);
 a95:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a98:	83 c0 08             	add    $0x8,%eax
 a9b:	eb 3b                	jmp    ad8 <malloc+0xe1>
    }
    if(p == freep)
 a9d:	a1 f8 0d 00 00       	mov    0xdf8,%eax
 aa2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 aa5:	75 1e                	jne    ac5 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 aa7:	83 ec 0c             	sub    $0xc,%esp
 aaa:	ff 75 ec             	pushl  -0x14(%ebp)
 aad:	e8 e5 fe ff ff       	call   997 <morecore>
 ab2:	83 c4 10             	add    $0x10,%esp
 ab5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ab8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 abc:	75 07                	jne    ac5 <malloc+0xce>
        return 0;
 abe:	b8 00 00 00 00       	mov    $0x0,%eax
 ac3:	eb 13                	jmp    ad8 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 acb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ace:	8b 00                	mov    (%eax),%eax
 ad0:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 ad3:	e9 6d ff ff ff       	jmp    a45 <malloc+0x4e>
}
 ad8:	c9                   	leave  
 ad9:	c3                   	ret    

From: Phillip Liang <liangcw94086@yahoo.com>
Date: Fri, 17 Aug 2007 17:24:25 -0700 (PDT)
Subject: [Buildroot] llseek errors in e2fsprogs
Message-ID: <649040.99213.qm@web54202.mail.re2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I am compiling buildroot 2007-06-07 for at91sam9263
and stuck with this problem.
linux-kernel 2.6.20.4
gcc-4.1.2-uclibc
Your help is appreciated.


making all in lib/ext2fs
make[3]: Entering directory
`/scratch/buildroot-atmel/build_arm_small/e2fsprogs-1.39/lib/ext2fs'
        CC llseek.c
llseek.c:65: error: expected declaration specifiers or
'...' before '_llseek'
llseek.c:65: error: expected declaration specifiers or
'...' before 'fd'
llseek.c:65: error: expected declaration specifiers or
'...' before 'offset_high'
llseek.c:66: error: expected declaration specifiers or
'...' before 'offset_low'
llseek.c:66: error: expected declaration specifiers or
'...' before 'result'
llseek.c:67: error: expected declaration specifiers or
'...' before 'origin'
llseek.c: In function '_syscall5':
llseek.c:71: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '{' token
llseek.c:91: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '{' token
llseek.c:65: error: parameter name omitted
llseek.c:65: error: parameter name omitted
llseek.c:65: error: parameter name omitted
llseek.c:66: error: parameter name omitted
llseek.c:66: error: parameter name omitted
llseek.c:67: error: parameter name omitted
llseek.c:114: error: expected '{' at end of input
make[3]: *** [llseek.o] Error 1



       



      ____________________________________________________________________________________
Luggage? GPS? Comic books? 
Check out fitting gifts for grads at Yahoo! Search
http://search.yahoo.com/search?fr=oni_on_mail&p=graduation+gifts&cs=bz

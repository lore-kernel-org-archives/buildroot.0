From: Phillip Liang <liangcw94086@yahoo.com>
Date: Mon, 20 Aug 2007 17:31:34 -0700 (PDT)
Subject: [Buildroot] llseek errors in e2fsprogs
In-Reply-To: <20070820143821.GB23522@aon.at>
Message-ID: <114799.94938.qm@web54207.mail.re2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks.
It works now.

--- Bernhard Fischer <rep.dot.nop@gmail.com> wrote:

> On Fri, Aug 17, 2007 at 05:24:25PM -0700, Phillip
> Liang wrote:
> >Hello,
> >I am compiling buildroot 2007-06-07 for at91sam9263
> >and stuck with this problem.
> >linux-kernel 2.6.20.4
> >gcc-4.1.2-uclibc
> >Your help is appreciated.
> >
> >
> >making all in lib/ext2fs
> >make[3]: Entering directory
>
>`/scratch/buildroot-atmel/build_arm_small/e2fsprogs-1.39/lib/ext2fs'
> >        CC llseek.c
> >llseek.c:65: error: expected declaration specifiers
> or
> >'...' before '_llseek'
> >llseek.c:65: error: expected declaration specifiers
> or
> >'...' before 'fd'
> >llseek.c:65: error: expected declaration specifiers
> or
> >'...' before 'offset_high'
> >llseek.c:66: error: expected declaration specifiers
> or
> >'...' before 'offset_low'
> >llseek.c:66: error: expected declaration specifiers
> or
> >'...' before 'result'
> >llseek.c:67: error: expected declaration specifiers
> or
> >'...' before 'origin'
> >llseek.c: In function '_syscall5':
> >llseek.c:71: error: expected '=', ',', ';', 'asm'
> or
> >'__attribute__' before '{' token
> >llseek.c:91: error: expected '=', ',', ';', 'asm'
> or
> >'__attribute__' before '{' token
> >llseek.c:65: error: parameter name omitted
> >llseek.c:65: error: parameter name omitted
> >llseek.c:65: error: parameter name omitted
> >llseek.c:66: error: parameter name omitted
> >llseek.c:66: error: parameter name omitted
> >llseek.c:67: error: parameter name omitted
> >llseek.c:114: error: expected '{' at end of input
> >make[3]: *** [llseek.o] Error 1
> 
> Didn't look but it sounds like you should select
> BR2_LARGEFILE (i.e.
> LFS).
> 
> hth,
> 



       
____________________________________________________________________________________
Sick sense of humor? Visit Yahoo! TV's 
Comedy with an Edge to see what's on, when. 
http://tv.yahoo.com/collections/222

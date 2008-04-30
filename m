From: John Voltz <john.voltz@gmail.com>
Date: Wed, 30 Apr 2008 13:06:28 -0400
Subject: [Buildroot] mplayer in buildroot
Message-ID: <46a136670804301006p74346c55qf9fc2253f34b7c52@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I cannot get mplayer to build for x86 in buildroot. I keep getting this
error:

cabac.h:513: error: can't find a register in class 'GENERAL_REGS' while
reloading 'asm'
cabac.h:513: error: 'asm' operand has impossible constraints

Why can't it use inline assembler? It compiles just fine if I build it for
AVR32.

John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080430/20510887/attachment.htm 

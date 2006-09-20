From: Qiu Yu <unicell@gmail.com>
Date: Wed, 20 Sep 2006 21:34:24 +0800
Subject: [Buildroot] can't resolve symbol bcopy
Message-ID: <e068c5c30609200634i6b222c86r298f1fabe57a3049@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, all

Paid some effort, I finally got my first buildroot-made rootfs image for
mipsel platform, but this pleasure did't last long.

When I mount it on my board, after kernel started, I got an error message:
"bin/sh" can't resolve symbol bcopy

I tried to google it, and only got this page "
http://mailman.uclinux.org/pipermail/uclinux-dev/2006-April/037797.html". I
contacted the guy who sent this message, and he did't find out the cause of
the problem. All he suggests me is to try different version, and maybe
change some compiler option.

But...any body knows why and how to fix it? Please help me out and thanks!

My buildroot configuration:

Kernel Headers (Linux 2.4.31 kernel headers)       <-- I'm using Linux
2.4.17 to boot the board, can this be a problem?
Binutils Version (binutils 2.16.1)
GCC compiler Version (gcc 3.4.2)
uClibc-0.9.28
busybox-1.2.1

-- 
Qiu, Yu
-----------------------------------------------------------
email:  unicell@gmail.com
-----------------------------------------------------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20060920/cd7c4b20/attachment.html 

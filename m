From: aurele.traynard at laposte.net <aurele.traynard@laposte.net>
Date: Wed, 18 Aug 2010 14:07:49 +0200 (CEST)
Subject: [Buildroot] [BuildRoot] : __isoc99_sscanf when compiling X11
Message-ID: <27584480.9721.1282133269537.JavaMail.www@wwinf8202>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello,

I am new and French so be indulgent. I am working on a "arm Xscale processor" with a code sourcery gnu toolchain, and when i had compile X11 for the first time I had this error :? "undefined reference to `__isoc99_sscanf'" in the makekeys.c file.
to solve the problem i just add "#define _GNU_SOURCE" in the file.
I havent found any other solution to this problem.
I use buildroot-2010.05

have a nice day


Une messagerie gratuite, garantie ? vie et des services en plus, ?a vous tente ?
Je cr?e ma bo?te mail www.laposte.net
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100818/e1b94265/attachment.html>

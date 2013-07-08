From: Daniel. <danielhilst@gmail.com>
Date: Mon, 8 Jul 2013 18:01:26 +0000
Subject: [Buildroot] Error while building libevas, SFD_NONBLOCK undeclared
Message-ID: <CAF3SDA77hPn0TiYNajKZNTBGWAobSuFKEyWcvRZmmrNhyjRPkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm receiving this error while trying to build with buildroot.

make[5]: Entering directory
`/home/hilst/buildroot/buildroot-2013.05/output/build/libevas-1.7.4/src/bin'
CC evas_cserve2_main_loop_linux.o
evas_cserve2_main_loop_linux.c: In function '_signalfd_setup':
evas_cserve2_main_loop_linux.c:156: error: 'SFD_NONBLOCK' undeclared (first
use in this function)
evas_cserve2_main_loop_linux.c:156: error: (Each undeclared identifier is
reported only once
evas_cserve2_main_loop_linux.c:156: error: for each function it appears in.)
evas_cserve2_main_loop_linux.c:156: error: 'SFD_CLOEXEC' undeclared (first
use in this fu

My .config can be found here: https://gist.github.com/gkos/5950964

Any help is appreciated,

I'm on archilinux using Sourcery CodeBench toolchain..
Best regards


-- 
*"Do or do not. There is no try"*
*  **Yoda Master*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130708/ad81938a/attachment.html>

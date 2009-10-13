From: Souvik Ghosh <mailtosouvik@gmail.com>
Date: Tue, 13 Oct 2009 18:58:54 +0530
Subject: [Buildroot] Buildroot with uClibc 0.9.29
Message-ID: <6fff79820910130628peb87f9bo9c41414b461c0d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to build a toolchain for ARM 926t with uclibc version 0.9.29. I
have checked the buildroot releases and found that release 2009.02 allows to
change uClibc version to 0.9.29 through make menuconfig interface. But when
I compile buildroot using 'make' command it fives me the following error.

CC libc/sysdeps/linux/common/chdir.os
In file included from ./include/sys/param.h:22,
                 from libc/sysdeps/linux/common/chdir.c:13:
./include/limits.h:124:26: error: limits.h: No such file or directory
make[2]: *** [libc/sysdeps/linux/common/chdir.os] Error 1
make[1]: *** [lib/libc.so.0] Error 2

Can somebdy please help me to get rid of this issue. Do I need to switch to
different buildroot release?

Thanks in advance.

Regards,
papa
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091013/6d64740f/attachment.htm>

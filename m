From: Peter Chiu <peter.m.chiu@gmail.com>
Date: Mon, 21 May 2007 09:30:17 +0800
Subject: [Buildroot] How can I build the arm-linux-gcc with lintl support
Message-ID: <50062c450705201830x59b93edw3bc9cb308a58fd73@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

When I compiled the freetype 1.3.1 with arm-linux-gcc(3.4.6) witch is build
by buildroot, it reported the error info as follows:
====================
extend/ftxerr18.c:31:21: libintl.h: No such file or directory
extend/ftxerr18.c: In function `TT_ErrToString18':
extend/ftxerr18.c:47: warning: implicit declaration of function `dgettext'
====================

So, how can I build the arm-linux-gcc with lintl support?

Best Regards,
Peter
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070521/3e8d46af/attachment.htm 

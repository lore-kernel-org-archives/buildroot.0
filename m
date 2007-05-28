From: Peter Chiu <peter.m.chiu@gmail.com>
Date: Mon, 28 May 2007 11:46:39 +0800
Subject: [Buildroot] libintl.h not found
Message-ID: <50062c450705272046y4c2c61b8k5111c5dabb2ccd3c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
When I building freetype 1.3.1 with arm-linux-gcc(3.4.6),it reported the
error as follow:

extend/ftxerr18.c:31:21: libintl.h: No such file or directory
extend/ftxerr18.c: In function `TT_ErrToString18':
extend/ftxerr18.c:47: warning: implicit declaration of function `dgettext'

Is there anybody can give me some advice about
how can I build arm-linux-gcc with libintl support in buildroot?


Best Regards,
Peter
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070528/3e459621/attachment.htm 

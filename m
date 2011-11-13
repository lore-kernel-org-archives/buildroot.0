From: =?iso-8859-2?Q?Jaroslav_Jir=E1sek?= <jirasek@sauron.cz>
Date: Sun, 13 Nov 2011 20:29:54 +0100
Subject: [Buildroot] compile under buildroot
Message-ID: <B4FA196829E44A5AB99055A1E2166936@ch3mikPC>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, I build buildroot with all development tools, under CentOS 6.
Buildroot I unpack and chroot to this.

Now I want compile something (for example busybox)
All attemps ends with this error:

In file included from /usr/include/sys/types.h:27,
                 from scripts/basic/fixdep.c:105:
/usr/lib/gcc/x86_64-unknown-linux-uclibc/4.3.6/include-fixed/features.h:361:23: error: gnu/stubs.h: No such file or directory


How can I solve this?

Thank you Jarda

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111113/41c307b0/attachment.html>

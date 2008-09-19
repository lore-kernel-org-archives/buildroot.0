From: Lars Lockenvitz <l.lockenvitz@eubus.net>
Date: Fri, 19 Sep 2008 09:34:21 +0200
Subject: [Buildroot] make commands for parts of buildroot?
Message-ID: <48D355FD.4030502@eubus.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have a question!
Are there commands to rebuild parts of busybox?

For example:
I change some settings of busybox using make menuconfig or edit .c file direktly.
Now I want that these .c files or the busybox will be compile. But make only creates me the rootfs, but whitout these changes.

Most interesstings commands are for cleaning busybox, rootfs, or linux-kernel and make them, but to have the option to make only one of them if needed!

Best Regards
Lars Lockenvitz
_______________________________________________
buildroot mailing list
buildroot at uclibc.org

From: Michael Trimarchi <trimarchimichael@yahoo.it>
Date: Fri, 19 Oct 2007 16:59:54 +0000 (GMT)
Subject: [Buildroot] (AT91RM9200/DATAFLASH) Unable to create a *working*
	jffs2 rootfs.
Message-ID: <125382.76767.qm@web26211.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

>Freeing init memory: 132K
>Warning: unable to open an initial console.

Send your inittab. Do you have create a /dev/console in your filesystem.
Your fstab must contain /sys /proc directory mounted, then you can use mdev -s
in your startup script to create all the device of your board.

Regards Michael







      ___________________________________ 
L'email della prossima generazione? Puoi averla con la nuova Yahoo! Mail: 
http://it.docs.yahoo.com/nowyoucan.html
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071019/5172a961/attachment.htm 

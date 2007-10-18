From: Jorge S. <jorgesolla@gmail.com>
Date: Thu, 18 Oct 2007 15:54:42 +0200
Subject: [Buildroot] (AT91RM9200/DATAFLASH) Unable to create a *working*
	jffs2 rootfs.
In-Reply-To: <997232.91985.qm@web26201.mail.ukl.yahoo.com>
References: <997232.91985.qm@web26201.mail.ukl.yahoo.com>
Message-ID: <6090c5eb0710180654s7e6992eeib4abdaedb76f0197@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, im going to give a try.

2007/10/18, Michael Trimarchi <trimarchimichael@yahoo.it>:
>
> Hi,
> try this:
> start the system with an itiatial ramdisk conteining flash_eraseall
>
> flash_eraseall /dev/mtd2
>
> mount -t jffs2 /dev/mtdblock2 /mnt
>
> copy your system
> and verify your filesystem
>
> regards Michael
>
> ------------------------------
> L'email della prossima generazione? Puoi averla con la Nuova Yahoo! Mail<http://us.rd.yahoo.com/mail/it/taglines/gmail/nowyoucan/nextgen/*http://it.docs.yahoo.com/nowyoucan.html>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071018/2f25244e/attachment.htm 

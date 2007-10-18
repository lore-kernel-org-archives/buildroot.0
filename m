From: Michael Trimarchi <trimarchimichael@yahoo.it>
Date: Thu, 18 Oct 2007 12:24:15 +0000 (GMT)
Subject: [Buildroot] (AT91RM9200/DATAFLASH) Unable to create a *working*
	jffs2 rootfs.
Message-ID: <941891.99466.qm@web26206.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi

>at91_rtc at91_rtc: setting the system clock to 1998-01-01 00:06:50 (883613210)

>JFFS2 write-buffering enabled buffer (1056) erasesize (8448)
>jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223ae4: 0x2001 instead
>jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223ae8: 0x3c00 instead

>jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223aec: 0x2000 instead
>jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223af0: 0x2bf4 instead
>jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223af4: 0x3000 instead

>jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223af8: 0x3001 instead

Check if your partition is alignment, but I think so :)
regards
Michael







      ___________________________________ 
L'email della prossima generazione? Puoi averla con la nuova Yahoo! Mail: 
http://it.docs.yahoo.com/nowyoucan.html
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071018/391fb938/attachment.htm 

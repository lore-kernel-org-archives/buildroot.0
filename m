From: Michael Trimarchi <trimarchimichael@yahoo.it>
Date: Fri, 19 Oct 2007 17:42:08 +0000 (GMT)
Subject: [Buildroot] (AT91RM9200/DATAFLASH) Unable to create a *working*
	jffs2 rootfs.
Message-ID: <666787.53899.qm@web26207.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

>Inviato: Venerd? 19 ottobre 2007, 18:18:21
>Oggetto: (AT91RM9200/DATAFLASH) Unable to create a *working* jffs2 rootfs.

>Michael, you where right! the problem was the "flash_erase" step missing in my procedure.

>I ended up mounting the jffs2 fs image on my Host system and discovered that the "/dev" is missing!


>So, when the kernel says: "Warning: unable to open an initial console" is not a problem mounting the FS, indeed, the FS >is perfectly mounted now, but lacks of /dev directory!!

>So, i think there's a buildroot bug here... it creates a JFFS but forgets to create the /dev directory...



>PD: Michael,Ulf consider yourself "free beer" awarded if you ever come to spain! :)

I live in Valencia

Regards 
Michael








      ___________________________________ 
L'email della prossima generazione? Puoi averla con la nuova Yahoo! Mail: 
http://it.docs.yahoo.com/nowyoucan.html
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071019/d683cb36/attachment.htm 

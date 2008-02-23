From: Michael Trimarchi <trimarchimichael@yahoo.it>
Date: Sat, 23 Feb 2008 20:06:14 +0000 (GMT)
Subject: [Buildroot] [buildroot] Fast booting
Message-ID: <233548.14949.qm@web26202.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

>Dear Friends,

>I am using buildroot latest snapshot for filesystem generation. My board has 32bit arm controller >and has uboot as bootloader. I am using kernel 2.6.22.2. The board takes around 15 sec to boot >completely. While searching over the internet I came across >http://www.embeddedarm.com/software/arm-linux-fastboot-ts7400.php which boots the board in >just 1.1 sec. I want similar booting but within 5 sec is okey. Can anyone guide me further?

>Thank you,
>Ankur

I think that it does a suspend to disk on that board and using the software to revert process.
So it doesn't boot the system but reload it.

Regards Michael



-----Segue allegato-----

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot






      ___________________________________ 
L'email della prossima generazione? Puoi averla con la nuova Yahoo! Mail: 
http://it.docs.yahoo.com/nowyoucan.html
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080223/e488fa56/attachment.htm 

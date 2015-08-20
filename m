From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Thu, 20 Aug 2015 16:56:15 -0700
Subject: [Buildroot] bootm - "Starting kernel"
References: <893D978F8A8D2B40A4CC1A09F0844518045BB12971@svr-wa-exch1.atg.lc>
 <944894A3EB1D044A9003B2F944389BB20474AD9614@svr-wa-exch1.atg.lc>
 <CA+BsyQ7GRYhUA-2aJ+4qxaFnr6g0740B9sxEkGhXNEQ84ct3bw@mail.gmail.com>  
Message-ID: <944894A3EB1D044A9003B2F944389BB20474AD968D@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

FYI, I unplugged the Ethernet cable and did the steps again. This time the same ?tty: bad speedgetty? message is still repeated.

Tommy

From: Lee, Tommy
Sent: Thursday, August 20, 2015 4:47 PM
To: 'Brendan Heading'
Cc: 'buildroot at busybox.net'
Subject: RE: [Buildroot] bootm - "Starting kernel"

Brendan,

This time the ?VFS: Unable to mount?? issue is resolved. The new issue is the repetition of the of following message:

Starting network...
[    1.618745] mvneta f1030000.ethernet eth0: could not find the PHY
[    1.624877] mvneta f1030000.ethernet eth0: cannot probe MDIO bus
ip: SIOCSIFFLAGS: No such device
Starting netwogetty: bad speedgetty: bad speedgetty: bad speedgetty: bad speedge
tty: bad speedgetty: bad speedgetty: bad speedgetty: bad speedgetty: bad speedge
?..

The attachments are my .config file and the details of my U-Boot log.

I am trying to figure out the cause of this problem. You experience is extremely welcome.

Tommy

________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150820/00ee76e5/attachment.html>

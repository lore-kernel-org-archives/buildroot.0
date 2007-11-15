From: Michael Trimarchi <trimarchimichael@yahoo.it>
Date: Thu, 15 Nov 2007 13:39:27 +0000 (GMT)
Subject: [Buildroot] Illegal Instruction in arm buildroot
Message-ID: <896058.54769.qm@web26215.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

>Hi,

>I have a strange problem with buildroot built for an em-x270 board (an
>arm pxa270 based platform from compulab.co.il).
>All the build is performed correctly, and after some small change I
 have
>a working environment with busybox, udev, alsa, wireless tools,
 modutils
>and a kernel 2.6.23.1 (patched with some platform-dependent patch).
>But some program doesn't work at all, because the program receives a
>SIGILL (Illegal Instruction exception): for example, wget crashes after
>reading a remote file, udevd do not work at all, and also udhcpc
 crashes.

Maybe you have some soft-float operation and the kernel e/o toolchain 
doesn't have the support

Regards
Michael






      ___________________________________ 
L'email della prossima generazione? Puoi averla con la nuova Yahoo! Mail: http://it.docs.yahoo.com/nowyoucan.html
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071115/d86ffefd/attachment.htm 

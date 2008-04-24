From: Jorge S. <jorgesolla@gmail.com>
Date: Thu, 24 Apr 2008 15:03:12 +0200
Subject: [Buildroot] Question regarding CUPS package
Message-ID: <6090c5eb0804240603r1c89303eg4977bd66af67f4a7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm creating a rootfs for a custom AT91RM9200 board.
I'm planning to use the board as kind of a printer server and i need to use
CUPS.

The problem comes when building the CUPS package because it depends on X11
libs.
Just reading on the cups project documentation and some forums posts i've
discovered that CUPS only needs X11 libs
when you are planning to build/use GUI config tools, but if only need
cups-base and lpr are needed you can remove
the X11 libs dependence.

Does somebody on the list is using CUPS without X11 libs? Any available
patch? Any ideas on how to solve this?


Thanks in advance.

Regards,

Jorge.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080424/d8fd0c08/attachment-0001.htm 

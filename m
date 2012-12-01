From: Santhosh Ramani <srcoolz@gmail.com>
Date: Sat, 1 Dec 2012 16:27:54 -0600
Subject: [Buildroot] Qt library difference between E.so and just .so
Message-ID: <CADKZYYJFAKFs5KmSbcU7o=wkWi1_wOVc6MhgZrOdALgr_iva+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm using buildroot 2012.08 to create rootfs for AM335x device and would
like to compile in Qt libraries. I went through make menuconfig and I get
libraries for Qt 4.8.2. However, when I try and run some of the same
examples from the TI SDK it complains that it can't find *libQtGuiE.so.4.7.2
*.

When I looked at the installed Qt libraries, it did show that I only have *
libQtGui.so.4.8.2.* I was missing the *E *version, but, in the output
section buildroot it does create the 4.7.2 libraries but does not copy
those to the root file system.

Is there a fix for this??

Thank you
Regards

Santhosh

-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121201/d2c7cd3b/attachment.html>

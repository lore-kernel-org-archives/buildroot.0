From: Santhosh Ramani <srcoolz@gmail.com>
Date: Sat, 1 Dec 2012 19:51:37 -0600
Subject: [Buildroot] Problem with NFS boot
Message-ID: <CADKZYYLt90YY8rm4SCuqRN2SsAGqjXhQM7t5hQydpV9o7ZtT+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stephan,

Thank you for your reply, yes I did untar the rootfs.tar.bz2 into the
folder that is exported as NFS using sudo.

Note:
Linux kernel from TI SDK + buildroot rootfs = no nfs (only SD Card)
Linux kernle from buildroot + buildroot rootfs = everything works fine.

I actually have a script that performs a distclean on the Linux folder and
then tars and copies the linux kernel into the dl folder for buildroot. And
I have set it up so that buildroot uses this custom kernel.

However there are times when I make minor modifications to the Kernel code
and then try it out in which case it fails. That's what I'm trying to fix.

Please do let me know if I can provide more information.
Thank you
Regards

Santhosh


-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121201/cf1529f4/attachment.html>

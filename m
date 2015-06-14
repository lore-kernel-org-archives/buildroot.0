From: David Evans <sir.dje1812@gmail.com>
Date: Sun, 14 Jun 2015 11:03:13 +0100
Subject: [Buildroot] Using buildroot RFS and Kernel files with Altera SoC
Message-ID: <CAC322bi+GXgNAL0jXZmc4QMbM2VeUFAVz2+CpCwLLG9p=kPGzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Colleagues,

I want to use the uImage and rootfs.ext3 files that are generated when
running the Altera SoCKit instructions (that ship as part of the BuildRoot
download), with a different Altera SoC development kit.

I am struggeling to understand how I can swap out the default RFS and
Kernel for a given board (EBV SoCrates for example), and swap in the RFS
and Kernel file built using Buildroot.

For example, the SoCkit tutorial uses a uImage file whilst the SoCrates
board is using a zImage file.

It it just a matter of making changes in Uboot to define what Kernel and
RFS is to be used, or is there a need to fold in the planned type of RFS
and Kernel files as part of the SPL and Uboot build earlier in the whole
SoC development cycle?

Regards,

DJE
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150614/0a51eedb/attachment.html>

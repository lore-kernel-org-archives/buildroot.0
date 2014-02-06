From: Frank Ihle <frank.ihle@hs-offenburg.de>
Date: Thu, 06 Feb 2014 10:19:29 +0100
Subject: [Buildroot] Why can't I see any effects by different rootfs
 compression methods ??
Message-ID: <52F361B10200004600049F5D@gwia2.rz.hs-offenburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using Buildroot to generate a uImage with a kernel, which
 in the end starts busybox. I tried the different compression modes 
(kernel compression, built-in initramfs compression and the rootfs 
compression). The first 2 options worked quiet well but when it comes to
 apply different compression methodes (e.g. LZMA, bzip2) on  rootfs in make menuconfig nothing changes, neither size nor decompress time.

Why is it like that ? And how can I extract files of the generated uImage, so that i can see what really has been compressed ?

Thank you for your help.
Kind regards

Frank Ihle
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140206/05e72e76/attachment.html>

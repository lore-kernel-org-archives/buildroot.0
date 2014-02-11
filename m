From: Frank Ihle <frank.ihle@hs-offenburg.de>
Date: Tue, 11 Feb 2014 09:39:37 +0100
Subject: [Buildroot] How to get the kernel to mount a rootfs without an
 initramfs ??
Message-ID: <52F9EFD9020000460004A79F@gwia2.rz.hs-offenburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I think this is a rather easy question, yet I couldn't find any helpful information about it in the Internet and I'm a bit clueless how to solve it.

When generating an Image based on initramfs everything works fine, my embedded device boots as it supposed to be. But I'd like to use separate files of the rootfs and the kernel. 

Well the question is: how can I tell the kernel to boot without an initramfs but instead with a particular rootfs (e.g. rootfstype=squashfs) located on a SD card, same as the kernel itself ? 

I can't think that this is too tricky. 

Thanks for the support

Kind regards

Frank

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140211/8dd5c356/attachment.html>

From: Montag, Gil <gil.montag@intel.com>
Date: Sun, 10 Jun 2018 07:00:06 +0000
Subject: [Buildroot] Initramfs
Message-ID: <2C6957468785C14D8F47AB016E1D8F4B158FA7C2@hasmsx107.ger.corp.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have few questions regarding the use of initramfs in my system:


1.       Please correct me if I'm wrong:

-          When I enable the initramfs option, buildroot creates for me the same rootfs that was created before (e.g. ext2),  just instead of making it a file to be later unpacked into a storage device (e.g. rootfs.ext2) it will pack it  in a cpio archieve, and have the kernel build use it to build a kernel image that already contains it inside.

-          I don't need to enable ext2 file system anymore



2.       If I want to add anything to the rootfs created this way, should I do it in the same way as I did before - e.g. with rootfs overlay?

3.       Kernel image (bzImage in my case) is expected to grow bigger than it was before by the amount of the size of the rootfs.cpio.gz  file created in output/images

Thank you
Gil


---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180610/65c436a8/attachment.html>

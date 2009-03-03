From: Maxim Grigoriev <maxim@tensilica.com>
Date: Mon, 02 Mar 2009 22:49:59 -0800
Subject: [Buildroot] Xtensa BUILDROOT support
Message-ID: <49ACD317.6060205@hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello BUILDROOT maintainers,

I think I need to first properly introduce myself.

I am an Engineer at Tensilica, Inc. working on RTOS team.
My primary responsibility has been Xtensa GDB support.
I've been an Xtensa GDB maintainer for more than Two years
after I made an initial submission to FSF.

Tensilica provides a GNU/Linux Xtensa support. That's
why we've been using BUILDROOT for more than a year.
Publicly accessible BUILDROOT git-tree with Xtensa
support is available on xtensa-linux.org.

Tensilica would like to become a part of BUILDROOT
community. It's in our best interest to maintain
Xtensa BUILDROOT and permanently contribute to both
Xtensa-specific and generic parts of this open source
project. I already tried to submit a generic update :

http://lists.busybox.net/pipermail/buildroot/2009-February/026203.html

Now, I would like to submit the BUILDROOT Xtensa support.

Xtensa is a family of configurable and extensible
processors, which have been on the IP market for quite some
time now. For those of you who are interested, please, look at

            http://www.tensilica.com/

If you decide that Xtensa can be a valuable addition to
BUILDROOT I will go ahead and submit a set of patches.

I've attached the first patch.

Description:

      Xtensa BUILDROOT uses a concept of source overlays,
      which are necessary because Xtensa processors are
      configurable and extensible. Xtensa tools, e.g.
      gcc, gdb, and binutils, use source overlays, which
      can not be substituted by the current BUILDROOT
      patching mechanism. This update makes patch-kernel.sh
      script capable of handling these overlays.

Can BUILDROOT experts review the patch, please ?

Thanks much for any of your help,
Maxim Grigoriev
Tensilica, Inc.
(w) 408-566-1770
(c) 510-520-3697

-------------- next part --------------
A non-text attachment was scrubbed...
Name: patch_kernel_sh.patch
Type: text/x-patch
Size: 1200 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090302/67ebc21c/attachment.bin>

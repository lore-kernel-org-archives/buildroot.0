From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Sat, 14 Jul 2007 17:35:12 +0700
Subject: [Buildroot] Patch for usbutils
Message-ID: <5d75f4610707140335i33ac3880r2e12c45423ac1feb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch for usbutils is against subversion version 19085.
Maybe the problem is really why usb.h is in $(STAGING_DIR)/include ?
Anyway, this let it build for me.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: usbutils.patch
Type: text/x-diff
Size: 667 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070714/c7bd79f3/attachment.bin 

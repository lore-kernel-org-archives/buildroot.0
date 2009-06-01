From: Nigel Kukard <nkukard@lbsd.net>
Date: Mon, 01 Jun 2009 11:33:47 +0000
Subject: [Buildroot] [PATCH] Remvoed dm (devicemapper),
 this is included in the new lvm2 package
Message-ID: <4A23BC9B.8000507@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The devicemapper library is now included in LVM2.

Updated the lvm2 package to include the library during installation
and updated dmraid to depend on lvm2.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Removed-dm-devicemapper-this-is-included-in-the-n.patch
Type: text/x-patch
Size: 9261 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090601/bbd2a140/attachment-0001.bin>

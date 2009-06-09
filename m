From: Nigel Kukard <nkukard@lbsd.net>
Date: Tue, 09 Jun 2009 08:38:25 +0000
Subject: [Buildroot] [PATCH] Remvoed dm (devicemapper),
 this is included in the new lvm2 package
Message-ID: <4A2E1F81.4020505@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



-------- Original Message --------
Subject: 	[PATCH] Remvoed dm (devicemapper), this is included in the new
lvm2 package
Date: 	Mon, 01 Jun 2009 11:33:47 +0000
From: 	Nigel Kukard <nkukard@lbsd.net>
To: 	buildroot at busybox.net



The devicemapper library is now included in LVM2.

Updated the lvm2 package to include the library during installation
and updated dmraid to depend on lvm2.


-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Removed-dm-devicemapper-this-is-included-in-the-n.patch
Type: text/x-patch
Size: 9262 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090609/d70bbb87/attachment-0001.bin>

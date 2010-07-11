From: Ossy <ossy1980@gmx.net>
Date: Sun, 11 Jul 2010 21:45:36 +0200
Subject: [Buildroot] mkfs.xfs without xfs library - not possible to create
	xfsfs
Message-ID: <4C3A1F60.7050009@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi mailinglist,

I tried to create an xfs filesystem. Unfortunatly there is a library 
missing. I looked around in the configuration menu, but all I found were 
the xfsprogs. Under libraries/filesystem there is no xfslib either.

$ ./sbin/mkfs.xfs
./sbin/mkfs.xfs: can't load library 'libxfs.so.0'

Did I forget to include something?

Regards,
Marcus

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100711/d599de17/attachment.ksh>

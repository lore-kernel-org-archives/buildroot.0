From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 26 Jul 2011 15:25:26 +0000
Subject: [Buildroot] Target FS options:  YAFFS2
Message-ID: <F9C551623D2CBB4C9488801D14F864C6047EBA@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With respect to:
<http://lists.infradead.org/pipermail/linux-mtd/2011-June/036429.html>

(short version):  I also have a NAND flash that won't take JFFS2 and
UBIFS consumes too much of the individual partition when dividing it
up at the MTD char device (perhaps I'm doing this wrong?) (1/2 of the
8MB partition is usable).


YAFFS2 is said to work well with this flash.  I need, therefore, to
build a YAFFS2 image.  Are/were there YAFFS2 utils for the target
options?

Thanks,
Andy

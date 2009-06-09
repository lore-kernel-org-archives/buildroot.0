From: Nigel Kukard <nkukard@lbsd.net>
Date: Tue, 09 Jun 2009 08:06:41 +0000
Subject: [Buildroot] [PATCH] dmraid linking against host system fix
Message-ID: <4A2E1811.1040402@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



-------- Original Message --------
Subject: 	[PATCH] dmraid linking against host system fix
Date: 	Mon, 01 Jun 2009 11:30:59 +0000
From: 	Nigel Kukard <nkukard@lbsd.net>
To: 	buildroot at busybox.net



dmraid is hard coded with -L$(DESTDIR)$(libdir)  which tries to link in
the host systems' libs

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Why-on-earth-are-we-trying-to-link-against-the-libdi.patch
Type: text/x-patch
Size: 1447 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090609/627b13e1/attachment.bin>

From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 1 Feb 2011 20:04:34 -0500
Subject: [Buildroot] [PATCH] cryptsetup: select e2fsprogs for libuuid
	dependency
In-Reply-To: <1296585857-5491-1-git-send-email-mort@bork.org>
References: <=> <=> run ramboot>
	<1296585857-5491-1-git-send-email-mort@bork.org>
Message-ID: <201102012004.35481.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libuuid has moved to util-linux.  if e2fsprogs is still providing it in BR, 
it's broken and needs fixing.  same goes for libblkid.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110201/eb7292d8/attachment.asc>

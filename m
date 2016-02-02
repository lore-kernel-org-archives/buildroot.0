From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 1 Feb 2016 22:00:22 -0500
Subject: [Buildroot] apache upgraded to 2.4
Message-ID: <20160202030022.GU7732@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i've finished upgrading apache to 2.4.  all the active sites seem to
still be working correctly.  if you see anything wrong, please let me
know asap via this thread, or file a bug if bugzilla is working :).
	https://bugs.busybox.net/

enabling http/2 is causing a weird crash i need to investigate more,
so it's disabled for now.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160201/e7bb072a/attachment.asc>

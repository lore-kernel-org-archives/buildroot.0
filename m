From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 27 Jan 2010 11:58:55 +0000
Subject: [Buildroot] PATCH: fix build from nested makefile
Message-ID: <4B602A7F.2080301@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If you invoke the top level buildroot makefile from another makefile 
then it fails to work out LINUX26_VERSION_PROBED as make prints out 
directory.

The patch fixes this (although lookinng at the makefile docs it appears 
-s should do this, but on my machine, Debian Lenny it does not).
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: 0012-fix-build-from-nested-makefile.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100127/0824a71b/attachment.diff>

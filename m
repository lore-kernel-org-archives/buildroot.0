From: Igor Serebryany <igor47@moomers.org>
Date: Thu, 8 Oct 2009 10:30:36 -0500
Subject: [Buildroot] Patch: parted support
Message-ID: <20091008153036.GV25852@moomers.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds GNU parted to buildroot. It's against the 2009.08
release.  The makefile could probaby be improved significantly, for
instance enabling readline support if it's present in buildroot. But it
works for now, and I've tested it under i686 and x86_64.

Most of the credit should go to Marco Lazzarotto (m.lazzarotto at
robox.it) who originally wrote the makefile. I simply modified it to use
the latest version.

To apply: "cd buildroot-2009.08; patch -p1 < parted.patch".

--Igor
-------------- next part --------------
A non-text attachment was scrubbed...
Name: parted.patch
Type: text/x-diff
Size: 3440 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091008/c9098d28/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091008/c9098d28/attachment.pgp>

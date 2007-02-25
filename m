From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Sun, 25 Feb 2007 13:22:46 +0200
Subject: [Buildroot] [RFC/PATCH 2/3] fix buildroot sed handling on Mac OS X
Message-ID: <45E17186.2080208@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Include a patch for GNU sed that allows building it on Mac OS X and
remove a spurious --prefix from sed.mk.

-- Heikki Lindholm

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-070225-sed-osxbuild.patch
Url: http://busybox.net/lists/buildroot/attachments/20070225/cb8401d2/attachment.asc 

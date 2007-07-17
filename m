From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Tue, 17 Jul 2007 11:38:25 +0300
Subject: [Buildroot] [PATCH] fix packages/config on OS X
Message-ID: <469C8001.6080003@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to linux 2.6.21 config system broke packages/config on OS X. The 
following patch should allow it to build again. Note that "dylib" is 
hard-coded in check-lxdialog because HOST_SHREXT, which would be nicer, 
is not available at that point.

-- Heikki Lindholm
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-070717-config.patch
Url: http://busybox.net/lists/buildroot/attachments/20070717/f9f47994/attachment.diff 

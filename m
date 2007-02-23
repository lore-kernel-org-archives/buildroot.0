From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Fri, 23 Feb 2007 18:10:48 +0200
Subject: [Buildroot] [RFC/PATCH 2/3] fix buildroot sed handling on Mac OS X
Message-ID: <45DF1208.7000602@cs.helsinki.fi>
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
Name: buildroot-070223-sed-osxbuild.patch
Url: http://busybox.net/lists/buildroot/attachments/20070223/abbbf912/attachment.asc 

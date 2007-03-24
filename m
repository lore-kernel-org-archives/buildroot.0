From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Sat, 24 Mar 2007 09:59:38 +0200
Subject: [Buildroot] [PATCH] busybox version
Message-ID: <4604DA6A.3050507@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using BR2_BUSYBOX_VERSION doesn't work as supposed because it has "" 
around it, which are nicely handled by the shell, but not by make, 
resulting in useless redownloads of the package. Fix by stripping the 
"'s out.

-- Heikki Lindholm
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-070324-busybox-version.patch
Url: http://busybox.net/lists/buildroot/attachments/20070324/c76e52dd/attachment.diff 

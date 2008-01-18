From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 18 Jan 2008 13:57:45 +1100
Subject: [Buildroot] [PATCH] more python enhancements
Message-ID: <20080118025745.GA30978@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here's another improvement to the Python package.

1. Don't install the development headers, tools and static library into
the target system unless new configuration item is enabled.

2. Always install the development headers etc into the staging_dir, so
they can be used to build extension modules.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br-python2.patch
Type: text/x-diff
Size: 2725 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080118/e3319227/attachment.bin 

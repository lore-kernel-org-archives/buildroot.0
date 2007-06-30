From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Sat, 30 Jun 2007 07:22:24 +0100
Subject: [Buildroot] bug in udhcp where sed fails
Message-ID: <4685F6A0.1090202@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I have tracked down a bug in the package/udhcp/udhcp.mk file where sed 
fail because the backslash is being used as the field separator attached 
is a patch to fix this issue.

Regards,
Rod Boyce
-------------- next part --------------
A non-text attachment was scrubbed...
Name: udhcp.mk.patch
Type: text/x-patch
Size: 589 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070630/b56689ff/attachment.bin 

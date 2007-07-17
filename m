From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 17 Jul 2007 15:11:37 +0200
Subject: [Buildroot] [RFC] MTD patch
Message-ID: <1184677897.26911.7.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is my proposed patch for mtd.
The current mtd files are moved down to a subdirectory.
The new mtd files are in another subdirectory.
A new configuration item (BR2_PACKAGE_MTD_EXPERIMENTAL)
is used to select between the two (defaults to "no").
If it is no, then the original mtd is used.

This will allow people to continue use the old mtd,
but also to try the new one.

Comments?

Best Regards
Ulf Samuelsson

-------------- next part --------------
A non-text attachment was scrubbed...
Name: mtd.patch
Type: text/x-patch
Size: 19582 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070717/b9b10fa8/attachment-0001.bin 

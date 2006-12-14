From: Ulrich Hecht <uli@suse.de>
Date: Thu, 14 Dec 2006 16:02:15 +0100
Subject: [Buildroot] [patch] mpg123 build issues
Message-ID: <200612141602.15413.uli@suse.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

The current mpg123 package

- ignores TARGET_CC (overwritten in Makefile)
- ignores TARGET_CFLAGS
- is hardcoded to use the i386 target

The attached patch fixes these issues.

CU
Uli
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mpg123.patch
Type: text/x-diff
Size: 2605 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061214/2c169aab/attachment.bin 

From: Ulrich Hecht <uli@suse.de>
Date: Thu, 14 Dec 2006 18:01:32 +0100
Subject: [Buildroot] [patch] dmalloc for ARM
Message-ID: <200612141801.32702.uli@suse.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This patch adds a patch (yes, I know ...) fixing relocation problems that 
keep dmalloc from building on ARM targets. Not tested, but the assembly 
output looks good to me.

CU
Uli
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dmalloc.patch
Type: text/x-diff
Size: 785 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061214/22928fc9/attachment.bin 

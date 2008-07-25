From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 25 Jul 2008 16:17:36 +0200
Subject: [Buildroot] [patch] oprofile: bump version to 0.9.4 and make
	architecture	independent
Message-ID: <1216995456.18524.3.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will bump the version to 0.9.4 and let the build process be
architecture independent.
    
The old patches are not needed anymore, but a new patch for AVR32 has
been added to enable lookup_dcookie functionality.
    
Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
-------------- next part --------------
A non-text attachment was scrubbed...
Name: oprofile-bump-and-fix.patch
Type: text/x-patch
Size: 12772 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080725/8b0bf0eb/attachment-0001.bin 

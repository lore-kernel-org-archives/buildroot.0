From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 12 Mar 2008 11:07:25 +0100
Subject: [Buildroot] [patch] Fix Qtopia Core 4 compile and installtion and
	bump to	version 4.4.0 snapshot
Message-ID: <1205316445.8480.20.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

I have attached a patch which fixes compiling (and actually using)
Qtopia Core. Qtopia Core is now renamed to Qt Embedded by Trolltech.

I have also bumped the version to the latest snapshot, which has support
for AVR32 upstream. I.e. no more need for patches.

As Qtopia Core 4 is now in Buildroot, it is not usable by any Qt
applications.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qtopia4-fix-single-compile-and-update-to-snapshot.patch
Type: text/x-patch
Size: 15593 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080312/c133f41b/attachment-0001.bin 

From: Mike Sander <msander@ripnet.com>
Date: Thu, 08 May 2008 22:27:38 -0400
Subject: [Buildroot] $(DATE) out of sync with system
Message-ID: <4823B69A.2040508@ripnet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have Custom rootfs suffix set to the default $(DATE).   I have noticed 
that a few hours before midnight my rootfs.arm-yyyymmdd.romfs, the dd 
portion advances prematurely. this breaks a script I have to copy 
binaries after the build.

I suspect it is somehow related to DATE not using the timezone correctly 
(maybe I dont have it set correctly?).  I have attempted to find where 
DATE is being set.  I would imaging that it is using the "date" function 
& format specifiers.   Unfortunately DATE is a VERY common symbol under 
buildroot.  I am unable to locate where this symbol is initially set.

Can someone tell me where to look?

Thanks,

Mike

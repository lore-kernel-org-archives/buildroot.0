From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 9 May 2008 12:14:06 +0200
Subject: [Buildroot] $(DATE) out of sync with system
References: <4823B69A.2040508@ripnet.com>
Message-ID: <000601c8b1ed$8d50afe0$070514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>I have Custom rootfs suffix set to the default $(DATE).   I have noticed 
> that a few hours before midnight my rootfs.arm-yyyymmdd.romfs, the dd 
> portion advances prematurely. this breaks a script I have to copy 
> binaries after the build.
> 
> I suspect it is somehow related to DATE not using the timezone correctly 
> (maybe I dont have it set correctly?).  I have attempted to find where 
> DATE is being set.  I would imaging that it is using the "date" function 
> & format specifiers.   Unfortunately DATE is a VERY common symbol under 
> buildroot.  I am unable to locate where this symbol is initially set.
> 
> Can someone tell me where to look?
> 


Top Makefile

Best Regards
Ulf Samuelsson

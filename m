From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 5 Apr 2007 10:00:43 +0200
Subject: [Buildroot] [linux-users-list] New version of AT91-Bootstrap
	for AT91SAM92x U-Boot/Buildroot/Linux users
References: <00a001c776e6$a7ebc2b0$02201fac@ildell1>
Message-ID: <012b01c77758$93bef060$ab039e0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Robin Cutshaw" <robin@interlabs.com>
To: "'Ulf Samuelsson'" <ulf@atmel.com>
Sent: Wednesday, April 04, 2007 8:25 PM
Subject: RE: [linux-users-list] New version of AT91-Bootstrap for AT91SAM92x U-Boot/Buildroot/Linux users


> 
> Tired of hearing from me?  :)
> 
> Two problems with the buildroot make:
> 
> 1) package/fakeroot/fakeroot.mk uses version 1.6.4 which doesn't exist in
> the download dir.  Changed to 1.6.5.

Happen from tim to time, and the way to do this, is to fix the makefile fragement.
Has been fixed last week in mainstream buildroot.

> 2) mtd build fails due to package/mtd/mtd.mk having a typo in MTD_SOURCE.  I
> temporarily changed it to:
> MTD_SOURCE:=mtd_20050122.orig.tar.gz and the jffs2 image completed.
> 

I use a later version and the patch has been submitted but has not been reviewed.

> Have you tried to build a buildroot from a scratch environment lately?  :)

I download buildroot and apply my local patches, but lately
I have focused on trying to get the stuff into mainstream buildroot,
but noone seems to have the bandwidth at the moment to review and apply.

> 
> Robin
> 
> 




Best Regards
Ulf Samuelsson

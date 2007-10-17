From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 18 Oct 2007 01:05:14 +0200
Subject: [Buildroot] (AT91RM9200/DATAFLASH) Unable to create a	*working*
	jffs2 rootfs.
In-Reply-To: <6090c5eb0710171505r739bd7b1le836930f308f5209@mail.gmail.com>
References: <6090c5eb0710171505r739bd7b1le836930f308f5209@mail.gmail.com>
Message-ID: <1192662314.17963.6.camel@c-f87ee255>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2007-10-18 klockan 00:05 +0200 skrev Jorge S.:
> Dear all,
> 
>  I'm still having problems with the rootfs on my AT91RM9200/Dataflash
> (AT45DB642D) based system.
> 
>  Now i'm trying to build a jffs2 rootfs and but getting tons of errors
> from the kernel when it mounts the rootfs: 
> 
> ..
> .. 

[snip]

>   - Any ideas on how to solve this?
> 

I suspect that you selected an bad version of the MTD.
20061007 should work.

-- 
Best Regards,
Ulf Samuelsson

From: Daniels, Brian <bdaniels@ciena.com>
Date: Thu Jul 27 12:00:15 2006
Subject: [Buildroot] base busybox version for buildroot?
Message-ID: <3B9518857C91E345AA1806A6F53C0EB70190D253@onmxm01.ciena.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,
> 
> Is the base busybox version for buildroot is now 1.2.0, 
> instead of 1.1.3?  Is there a buildroot config somewhere that 
> determines which version of busybox is used, or is it just 
> based on the date of the buildroot package (builds after 30 
> June 2006 use busybox 1.2.0)?
> There seems to have been a file size change recently, just 
> curious what that might have been:
> 
>  buildroot-20060710.t..> 10-Jul-2006 00:17  3.8M  
> buildroot-20060711.t..> 11-Jul-2006 00:17  4.3M

You can configure the busybox version through the BUSYBOX_VER variable
in package/busybox/busybox.mk.

Brian Daniels

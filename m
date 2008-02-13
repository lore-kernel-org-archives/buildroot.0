From: Kelvin <kelvin@willowglen.com.my>
Date: Wed, 13 Feb 2008 19:08:07 +0800
Subject: [Buildroot] How to combine kernel,
	busybox and rfs into 1 single image?
In-Reply-To: <024901c86d64$61ac2d10$2301a8c0@atmel.com>
Message-ID: <013a01c86e30$b93a4b30$4452a8c0@KelvinChewPC>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----Original Message-----
From: Ulf Samuelsson [mailto:ulf.samuelsson at atmel.com] 
Sent: Tuesday, February 12, 2008 6:35 PM
To: Kelvin; buildroot at uclibc.org
Subject: Re: [Buildroot] How to combine kernel,busybox and rfs into 1 single
image?

----- Original Message ----- 
From: "Kelvin" <kelvin@willowglen.com.my>
To: <buildroot@uclibc.org>
Sent: Tuesday, February 12, 2008 10:21 AM
Subject: [Buildroot] How to combine kernel,busybox and rfs into 1 single
image?


> Hi,
> 
> 
> 
> I'm building an embedded Linux system using Buildroot2. How can I combine
> and build the kernel image (vmlinux, version2.4), busybox utilities
(version
> 1.00) and RFS (jffs2 filesystem) into a single image for easier download?
> 
> 
> 
> Any help on this is much appreciated. Thanks!
> 
> 
> 
> Regards,
> 
> Kelvin
> 


Why bother?
If you are using U-Boot, you can generate a script which handles the
download of everything automatically.

Best Regards
Ulf Samuelsson


But what's U-Boot? Can't I do it with Buildroot2?

Regards,
Kelvin

From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Thu, 10 Jul 2014 11:35:47 -0700
Subject: [Buildroot] Boundary U-Boot files (was [PATCH] nitrogen6x:
	include .dtb files...)
In-Reply-To: <CADCpmyOL9bGFzjKe-4NRZ2Fwm7o-q8jzJ+u0McyfQeWqbPZyQA@mail.gmail.com>
References: <a913d991bd0534d192982537a25388705c80c728.1404164261.git.yann.morin.1998@free.fr>	<1405012684-30163-1-git-send-email-eric.nelson@boundarydevices.com>	<20140710172818.GE28300@free.fr>
 <CADCpmyOL9bGFzjKe-4NRZ2Fwm7o-q8jzJ+u0McyfQeWqbPZyQA@mail.gmail.com>
Message-ID: <53BEDD03.9030103@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the ping, Gary.

On 07/10/2014 11:22 AM, Gary Bisson wrote:
> Eric, All,
> 
> What about the bootloader configuration? I know the same bootloader will
> work the same for sabrelite and nitrogen6q. However for the max and dl
> versions I guess need another config as the DCD table will be different.
> Do we want to create other defconfigs?
> 

As our boards don't require U-Boot to be built in order to
craft a filesystem (U-Boot runs from SPI NOR), we could simply
remove the build target.

At the very least, we should probably find a way to rename the U-Boot
binary (u-boot.imx) to make it clear that the one built is for
the Quad-Core/1GiB variant.

I'll try to craft a way of doing this.

Regards,


Eric

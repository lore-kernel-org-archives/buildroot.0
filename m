From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 17:17:41 +0200
Subject: [Buildroot] [PATCH] configs: add Armadeus Systems APF6 SOM
 basic support
In-Reply-To: <5710FB65.6080403@free.fr>
References: <1460641197-12610-1-git-send-email-julien.boibessot@free.fr>
 <20160415095435.7ac98177@free-electrons.com>
 <5710FB65.6080403@free.fr>
Message-ID: <20160415171741.0f2f29cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Apr 2016 16:32:05 +0200, Julien Boibessot wrote:

> > Is it expected that you're not building any bootloader here?
> 
> yes. it doesn't work for the moment with latest BR.

It works with an older Buildroot? What is the problem you encounter?

> > Also, this needs a readme.txt to explain how to use this defconfig. If
> > you're putting off SD card, then please use genimage to generate a
> > complete SD card image. If you're booting out of NAND, please include
> > instructions on how to flash the resulting system.
> 
> Yes you're right I was a little short on comments.
> APF6 has an onboard eMMC, so no need for genimage to build basic rootfs.

Hm, isn't genimage capable of building a complete image for an eMMC ?

In any case, you should include a readme.txt that documents how to
flash the resulting system on the board.

> > But does it make sense to have a defconfig for a SOM ? A SOM as-is
> > generally can't be booted, it needs to be put on some base-board,
> > right ?
> 
> Nop, of course support includes development boards and it will be more
> explicit in my next patch.

Thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

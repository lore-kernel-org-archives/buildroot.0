From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 22:01:50 +0200
Subject: [Buildroot] Wandboard Solo/Dual/Quad support
In-Reply-To: <CANu7NGtUCHKhNDZwA7im_nCgB82NXYdwzr6gjGnq0b+yGOmVBw@mail.gmail.com>
References: <CANu7NGtUCHKhNDZwA7im_nCgB82NXYdwzr6gjGnq0b+yGOmVBw@mail.gmail.com>
Message-ID: <20150930220150.2cfc3ae5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Wed, 30 Sep 2015 13:45:55 -0300, Sergio Prado wrote:

> I'm working on the config files for the wandboard solo, dual and quad, and
> I have a few questions:
> 
> 1. Are you guys OK with this organization?
> 
> $ ls configs/wandboard*
> configs/wandboard_solo_defconfig
> configs/wandboard_dual_defconfig
> configs/wandboard_quad_defconfig

Is there a reason to have 3 separate defconfigs? In the Linux kernel, a
single configuration can support all three variants, and it seems to be
the case in U-Boot as well:

  ./configs/wandboard_defconfig

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

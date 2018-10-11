From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 09:32:18 +0200
Subject: [Buildroot] [PATCH 0/5] Update MacchiatoBin defconfigs
In-Reply-To: <20180914153326.19346-1-thomas.petazzoni@bootlin.com>
References: <20180914153326.19346-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181011093218.53f9b797@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Sep 2018 17:33:21 +0200, Thomas Petazzoni wrote:

> Thomas Petazzoni (5):
>   boot/mv-ddr-marvell: bump version to armada-18.09.2
>   boot/binaries-marvell: bump version to marvell-armada-18.06
>   boot/arm-trusted-firmware: don't pass TARGET_CONFIGURE_OPTS when
>     building
>   configs/solidrun_macchiatobin_mainline: bump component versions
>   configs/solidrun_macchiatobin_marvell: bump component versions

I've applied the entire series, after updating the commit log of the
last patch to indicate why we stick to Linux 4.4 and not switch to
Marvell provided Linux 4.14, as was requested by Baruch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

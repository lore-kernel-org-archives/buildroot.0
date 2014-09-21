From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:55:12 +0200
Subject: [Buildroot] [PATCH 0/15 v2] linux-firmware: bump + more
 firmwares (branch yem/lnx-fw)
In-Reply-To: <cover.1411246411.git.yann.morin.1998@free.fr>
References: <cover.1411246411.git.yann.morin.1998@free.fr>
Message-ID: <20140921195512.037da855@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sat, 20 Sep 2014 22:55:09 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (15):
>       package/linux-firmware: bump revision

Applied.

>       package/linux-firmware: split bcm43xx / bcm43xxx

Applied.

>       package/linux-firmware: use the new bnx2x firmware version

Applied.

>       package/linux-firmware: install firmware files for rtlwifi rtl8723be

Applied.

>       package/linux-firmware: add option for Realtek rtl88xx firmware

Applied.

>       package/linux-firmware: add option for TI wl18xx firmware

Applied.

>       package/linux-firmware: prepare new firmware and new revision for iwlwifi

Not applied: does not add the appropriate Config.in.legacy handling.

>       package/linux-firmware: add new revision for iwlwifi firmware

Too much mixed with previous patch to apply.

>       package/linux-firmware: use the new Chelsio cxgb4 firmware

Applied.

>       package/linux-firmware: add option for Chelsio cxgb4 T5

Not applied: does not add the appropriate Config.in.legacy handling.

>       package/linux-firmware: add option for Abilis Systems DVB-T as102

Applied.

>       package/linux-firmware: install Xceive/Cresta xc4000 and xc5000c

Not applied: does not add the appropriate Config.in.legacy handling.

>       package/linux-firmware: add option for ITEtech it9135 firmware

Applied.

>       package/linux-firmware: add option for iwl7265 firmware

Too much mixed with a previous non-applied patch.

>       package/linux-firmware: add option for Intel SST DSP (Baytrail audio)

Applied.

Care to respin the non-applied patches after fixing the
Config.in.legacy handling?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

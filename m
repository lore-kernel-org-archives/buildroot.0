From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 12:23:35 +0100
Subject: [Buildroot] [PATCH 0/5 v2] RPi: enable building a
 device-tree-enabled kernel (branch yem/rpi-dt)
In-Reply-To: <cover.1420843412.git.yann.morin.1998@free.fr>
References: <cover.1420843412.git.yann.morin.1998@free.fr>
Message-ID: <20150110122335.18905a24@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri,  9 Jan 2015 23:46:19 +0100, Yann E. MORIN wrote:

> Yann E. MORIN (5):
>       package/rpi-firmware: add DT-aware marking script
>       package/rpi-firmware: install DTB blobs
>       boards/raspberrypi: don't document non-existent files

Those ones applied. I just did a minor change on PATCH 2/5, to explain
why we need to change the version when installing DTBs is enabled.

>       boards/raspberrypi: update readme with Device Tree instructions
>       configs: add a DT-enabled Raspberry Pi defconfig

For those ones, I'm waiting for your input on using a custom defconfig
instead of a default one that is too big.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

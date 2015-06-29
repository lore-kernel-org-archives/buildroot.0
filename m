From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 22:22:36 +0200
Subject: [Buildroot] [pull request] raspberrypi: update packages and
 defconfigs
In-Reply-To: <cover.1435529863.git.yann.morin.1998@free.fr>
References: <cover.1435529863.git.yann.morin.1998@free.fr>
Message-ID: <20150629222236.394f9932@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, 29 Jun 2015 00:25:14 +0200, Yann E. MORIN wrote:

> Floris Bos (1):
>       rpi-firmware: allow disabling installation of binary DTBs

Applied.

> 
> Yann E. MORIN (10):
>       package/rpi-firmware: add option to install DTB overlays

Applied.

>       package/rpi-firmware: add option to install vcdbg

Marked as Changes Requested, see my comments.

>       package/rpi-firmware: bump version
>       package/rpi-userland: bump version

Both applied.

>       configs/raspberrypi: update the DT-enabled config
>       configs/raspberrypi_plus: new defconfig
>       configs/raspberrypi2: update our defconfig
>       config/raspberrypi: remove non-DT defconfig
>       config/raspberrypi: rename our defconfig files
>       boards/raspberrypi: update instructions

Marked as Changes Requested: I'd like to have a single defconfig for
RPi A/B and RPi A+/B+ by simply building two DTBs.

Can you respin the patches 3 and 6-11 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

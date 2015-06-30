From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 14:41:10 +0200
Subject: [Buildroot] [PATCH 0/6 v2] raspberrypi: update packages and
 defconfigs (branch yem/rpi)
In-Reply-To: <cover.1435615426.git.yann.morin.1998@free.fr>
References: <cover.1435615426.git.yann.morin.1998@free.fr>
Message-ID: <20150630144110.5d84d333@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 30 Jun 2015 00:07:41 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (6):
>       package/rpi-firmware: add option to install vcdbg

There are still some pending questions on that one.

>       configs/raspberrypi: update the DT-enabled config
>       configs/raspberrypi2: update our defconfig
>       config/raspberrypi: remove non-DT defconfig
>       config/raspberrypi: rename our non-DT defconfig file
>       boards/raspberrypi: update instructions

All these ones applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

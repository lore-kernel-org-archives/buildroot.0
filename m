From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:21:24 +0200
Subject: [Buildroot] [PATCH] configs/beaglebone_defconfig: use default
 console device
In-Reply-To: <20190930060447.7377-1-yegorslists@googlemail.com>
References: <20190930060447.7377-1-yegorslists@googlemail.com>
Message-ID: <20190930222124.72a79224@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Sep 2019 08:04:47 +0200
yegorslists at googlemail.com wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> OMAP kernels use 8250 driver by default. Hence the name of
> the console device is not /dev/ttyO0 but /dev/ttyS0.
> Use /dev/console in order to handle the console independently
> of the selected driver.
> 
> Tested in BeagleBone Black board.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  configs/beaglebone_defconfig | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

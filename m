From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 21:21:01 +0100
Subject: [Buildroot] [PATCH] configs/atmel: bump to linux4sam_6.2 and
 at91bootstrap 3.9.0
In-Reply-To: <1573823254-15612-1-git-send-email-eugen.hristev@microchip.com>
References: <1573823254-15612-1-git-send-email-eugen.hristev@microchip.com>
Message-ID: <20191115212101.75c0eb16@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Nov 2019 13:07:54 +0000
<Eugen.Hristev@microchip.com> wrote:

> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Update configs with latest linux4sam and at91bootstrap.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  configs/atmel_sama5d2_xplained_mmc_defconfig     | 6 +++---
>  configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 6 +++---
>  configs/atmel_sama5d3_xplained_defconfig         | 6 +++---
>  configs/atmel_sama5d3_xplained_dev_defconfig     | 6 +++---
>  configs/atmel_sama5d3_xplained_mmc_defconfig     | 6 +++---
>  configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 6 +++---
>  configs/atmel_sama5d4_xplained_defconfig         | 6 +++---
>  configs/atmel_sama5d4_xplained_dev_defconfig     | 6 +++---
>  configs/atmel_sama5d4_xplained_mmc_defconfig     | 6 +++---
>  configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 6 +++---
>  10 files changed, 30 insertions(+), 30 deletions(-)

Thanks Eugen, I have applied to our next branch. However, could you
send some additional patches to:

 - Update the at91sam9x5ek defconfigs to those new components version

 - Use the github helper not only for the Linux kernel, but also for
   U-Boot and AT91Bootstrap

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Mar 2017 21:59:44 +0100
Subject: [Buildroot] [PATCH 1/4] configs: at91sam9x5ek: add development
 rootfs
In-Reply-To: <20161103140841.28789-1-ludovic.desroches@atmel.com>
References: <20161103140841.28789-1-ludovic.desroches@atmel.com>
Message-ID: <20170307215944.20dfa0e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Nov 2016 15:08:38 +0100, Ludovic Desroches wrote:
> Add development rootfs based on linux4sam_5.4 for at91sam9x5ek for both
> NAND flash and SD card.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  board/atmel/at91sam9x5ek_mmc/genimage.cfg  |  34 ++++++++++
>  board/atmel/at91sam9x5ek_mmc/post-image.sh |  20 ++++++
>  configs/at91sam9x5ek_dev_defconfig         |  99 ++++++++++++++++++++++++++++
>  configs/at91sam9x5ek_mmc_dev_defconfig     | 102 +++++++++++++++++++++++++++++
>  4 files changed, 255 insertions(+)
>  create mode 100644 board/atmel/at91sam9x5ek_mmc/genimage.cfg
>  create mode 100755 board/atmel/at91sam9x5ek_mmc/post-image.sh
>  create mode 100644 configs/at91sam9x5ek_dev_defconfig
>  create mode 100644 configs/at91sam9x5ek_mmc_dev_defconfig

In the end, I've applied your commit. But before doing so, I've added a
at91sam9x5ek_mmc_defconfig, i.e a minimal defconfig for the MMC
configuration.

Please check that everything is still OK on your side.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

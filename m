From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:30:01 +0100
Subject: [Buildroot] [PATCH] configs/atmel: refactor to use genimage.sh
In-Reply-To: <1510164921-11497-1-git-send-email-joshua.henderson@microchip.com>
References: <1510164921-11497-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20171111233001.6d5eff3f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Nov 2017 11:15:20 -0700, Joshua Henderson wrote:
> Prefer the commom genimage.sh instead of a custom post-image.sh script.
> 
> Cc: Ludovic Desroches <ludovic.desroches@atmel.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> ---
>  board/atmel/sama5d27_som1_ek_mmc/post-image.sh   | 14 --------------
>  board/atmel/sama5d2_xplained_mmc/post-image.sh   | 14 --------------
>  board/atmel/sama5d3_xplained_mmc/post-image.sh   | 14 --------------
>  board/atmel/sama5d4_xplained_mmc/post-image.sh   | 14 --------------
>  configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig |  3 ++-
>  configs/atmel_sama5d2_xplained_mmc_defconfig     |  3 ++-
>  configs/atmel_sama5d2_xplained_mmc_dev_defconfig |  3 ++-
>  configs/atmel_sama5d3_xplained_mmc_defconfig     |  3 ++-
>  configs/atmel_sama5d3_xplained_mmc_dev_defconfig |  3 ++-
>  configs/atmel_sama5d4_xplained_mmc_defconfig     |  3 ++-
>  configs/atmel_sama5d4_xplained_mmc_dev_defconfig |  3 ++-
>  11 files changed, 14 insertions(+), 63 deletions(-)
>  delete mode 100755 board/atmel/sama5d27_som1_ek_mmc/post-image.sh
>  delete mode 100755 board/atmel/sama5d2_xplained_mmc/post-image.sh
>  delete mode 100755 board/atmel/sama5d3_xplained_mmc/post-image.sh
>  delete mode 100755 board/atmel/sama5d4_xplained_mmc/post-image.sh

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

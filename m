From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 23:45:21 +0100
Subject: [Buildroot] [PATCH v2 1/2] configs/atmel: fix at91bootstrap
 custom tarball call function
In-Reply-To: <1576508766-25676-1-git-send-email-eugen.hristev@microchip.com>
References: <1576508766-25676-1-git-send-email-eugen.hristev@microchip.com>
Message-ID: <20191223234521.09012615@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Dec 2019 15:06:34 +0000
<Eugen.Hristev@microchip.com> wrote:

> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> The function was wrong, missing '$'. Also aligned with tar.gz. name rule in
> hash file.
> 
> Fixes: 806409533202 ("configs/atmel: use tarballs to fetch U-Boot and at91bootstrap")
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 2 +-
>  configs/atmel_sama5d2_xplained_mmc_defconfig     | 2 +-
>  configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 2 +-
>  configs/atmel_sama5d3_xplained_defconfig         | 2 +-
>  configs/atmel_sama5d3_xplained_dev_defconfig     | 2 +-
>  configs/atmel_sama5d3_xplained_mmc_defconfig     | 2 +-
>  configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 2 +-
>  configs/atmel_sama5d3xek_defconfig               | 2 +-
>  configs/atmel_sama5d4_xplained_defconfig         | 2 +-
>  configs/atmel_sama5d4_xplained_dev_defconfig     | 2 +-
>  configs/atmel_sama5d4_xplained_mmc_defconfig     | 2 +-
>  configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 2 +-
>  12 files changed, 12 insertions(+), 12 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
